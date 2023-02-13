<?php

namespace App\Http\Controllers\Admin;

use App\Models\Billings;
use App\Corporate;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Stripe\Customer;
use Stripe\PaymentMethod;
use Stripe\SetupIntent;
use Validator;
use Auth;



class BillingController extends Controller
{

    public function __construct()
    {
        $stripe_key    = payment_gateway('secret','Stripe');
        $api_version   = payment_gateway('api_version','Stripe');
        \Stripe\Stripe::setApiKey($stripe_key);
        \Stripe\Stripe::setApiVersion($api_version);
    }

    public function index(){

        return view('corporate/billing');
    }

    public function add(Request $request)
    {


        $type='';
        $error='';
        if(isset($request->pre_billing_checkbox) && $request->pre_billing_checkbox==true){
            $rules = array(
            'pre_amount' => 'required',
            );

            $type='pre';
            $amount=$request->pre_amount;
        }
        if(isset($request->post_billing_checkbox) && $request->post_billing_checkbox==true){
            $rules = array(
                'post_amount' => 'required',
            );
            $type='post';
            $amount=$request->post_amount;

        }
        if(isset($request->pay_as_you_go_checkbox) && $request->pay_as_you_go_checkbox==true){
            $rules = array(
                'card_no' => 'required',
                'expiration_month' => 'required',
                'expiration_year' => 'required',
                'cvc' => 'required',
                'email'=>'required|email'

            );
            $type='pay_as_you_go';

                // Retrieve the user's email address and Stripe token from the request
                $email = $request->email;
                $token = $request->stripeToken;
            $count = DB::table('corporate_payment_method')->where('id',Auth::guard('corporate')->user()->id)->first();
            if(isset($count->id)){

                $customerId = $count->customer_id;
                $customer = Customer::retrieve($customerId);

                $paymentMethods = PaymentMethod::all([
                    "customer" => $customerId,
                    "type" => "card"
                ]);
                $check=0;
                foreach ($paymentMethods->data as $paymentMethod) {
                    // Retrieve the payment method's ID
                    $paymentMethodId = $paymentMethod->id;
                    $last4 = $paymentMethod->card->last4;


                    if($last4==$count->last4){
                        $check=1;
                    }

                }

                if($check==1){

                    return back()->withErrors(['already_added'=>'This Payment method is already in used!']);

                }else{

                    $payment_method = \Stripe\PaymentMethod::create([
                        'type' => 'card',
                        'card' => [
                            'number' => $request->card_no,
                            'exp_month' => $request->expiration_month,
                            'exp_year' => $request->expiration_year,
                            'cvc' => $request->cvc,
                        ],
                    ]);

                    $customer->invoice_settings = [
                        "default_payment_method" => $payment_method->id
                    ];

                    $customer->save();

                    $data=array(
                        'payment_method_id'=>$payment_method->id,
                        'brand'=>$payment_method->card->brand,
                        'last4'=>$payment_method->card->last4
                    );

                    DB::table('corporate_payment_method')->where('id',Auth::guard('corporate')->user()->id)->update($data);

                }
            }else{
                try {
                    $customer = \Stripe\Customer::create([
                        'email' => $email,
                        'source' => $token,
                    ]);

                    $payment_method = \Stripe\PaymentMethod::create([
                        'type' => 'card',
                        'card' => [
                            'number' => $request->card_no,
                            'exp_month' => $request->expiration_month,
                            'exp_year' => $request->expiration_year,
                            'cvc' => $request->cvc,
                        ],
                    ]);

                    $payment_method->attach([
                        'customer' => $customer->id,
                    ]);

                    $setup_intent = SetupIntent::create([
                        'customer' => $customer->id,
                    ]);

                    $data=array(
                        'corporate_id'=>Auth::guard('corporate')->user()->id,
                        'customer_id'=>$customer->id,
                        'intent_id'=>$setup_intent->id,
                        'payment_method_id'=>$payment_method->id,
                        'brand'=>$payment_method->card->brand,
                        'last4'=>$payment_method->card->last4
                    );

                    DB::table('corporate_payment_method')->insert($data);




                } catch (\Stripe\Exception\CardException $e) {
                    if ($e->getError()->code === 'token_already_used') {
                        // Handle the error by displaying a message to the customer
                        return redirect()->back()->withErrors([
                            'error' => 'The payment token has already been used and cannot be reused.',
                        ]);
                    }
                }
            }

                $amount='';
        }

        $attributes = array(
            'pre_amount' => 'Pre Amount',
            'post_amount' => 'Post Amount',
        );

        $messages = array(
            'required' => ':attribute is required.',
        );

        $validator = Validator::make($request->all(), $rules, $messages, $attributes);

        $validator->after(function ($validator) use ($error, $request) {
            if ((isset($request->pre_billing_checkbox) && $request->pre_billing_checkbox==true) && (isset($request->post_billing_checkbox) && $request->post_billing_checkbox==true) && (isset($request->pay_as_you_go_checkbox) && $request->pay_as_you_go_checkbox==true)) {
                $validator->errors()->add('select_error', 'You can select only one billing option!');
            }
//            if(!empty($error)){
//                $validator->errors()->add('select_error', $error);
//            }
        });

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $check = Billings::where('corporate_id',Auth::guard('corporate')->user()->id)->first();
        if(!$check){
            $billing=new Billings();
            $billing->billing_type  = $type;
            $billing->corporate_id  =  Auth::guard('corporate')->user()->id;
            $billing->amount        =  $amount;
            $billing->save();
            flashMessage('success', 'Billing details added successfully');
            return redirect()->back();
        }else{
            $billing=Billings::find($check->id);
            if($billing->amount<=0 && $billing->billing_type!='pay_as_you_go'){
                $billing->amount        =  $amount;
                $billing->save();
                flashMessage('success', 'Billing details added successfully');
                return redirect()->back();
            }elseif($billing->amount>0 && $billing->billing_type!='pay_as_you_go'){
                return back()->withErrors(['already_added'=>'Billing details are already added!']);
            }
            flashMessage('success', 'Billing details added successfully');
            return redirect()->back();
        }

    }

    public function getToken(){
        $cardNumber = request('cardNumber');
        $cardExpMonth = request('cardExpMonth');
        $cardExpYear = request('cardExpYear');
        $cardCvc = request('cardCvc');



        try {
            $token = \Stripe\Token::create([
                'card' => [
                    'number' => $cardNumber,
                    'exp_month' => $cardExpMonth,
                    'exp_year' => $cardExpYear,
                    'cvc' => $cardCvc,
                ],
            ]);
            return response()->json(['token' => $token]);
        } catch (\Stripe\Exception\CardException $e) {
            return response()->json(['error' => $e->getMessage()]);
        }
    }
}
