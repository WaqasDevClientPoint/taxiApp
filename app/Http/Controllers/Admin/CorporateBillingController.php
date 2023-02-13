<?php

namespace App\Http\Controllers\Admin;

use App\DataTables\BillingsDataTable;
use App\Http\Controllers\Controller;
use App\Models\Billings;
use App\Models\CorporateWallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class CorporateBillingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(BillingsDataTable $dataTable)
    {
        return $dataTable->render('admin.corporate.corporateBillings');
    }

    public function update(Request $request, $id)
    {

        if($request->isMethod("GET")) {
            $data['result'] = $company_info = Billings::select('billings.*','billings.amount as requested_amount','corporates.name','corporate_wallets.amount as wallet_amount')
                ->join('corporates', 'billings.corporate_id', '=', 'corporates.id')
                ->join('corporate_wallets', 'billings.corporate_id', '=', 'corporate_wallets.id','left')
                ->find($request->id);

            if (LOGIN_USER_TYPE=='company' && LOGIN_USER_TYPE=='corporate') {
                abort(404);
            }

            if($data['result']) {
                return view('admin.corporate.editCorporateBilling', $data);
            }
            flashMessage('danger', 'Invalid ID');
            return redirect(LOGIN_USER_TYPE.'/manage_corporate_billings');
        }

        $rules = array(
            'amount'  => 'required',
            'status'  => 'required',
        );

        $attributes = array(
            'amount'          => 'Wallet Top up amount',
            'status'         => 'Staus',

        );

        $messages = array(
            'required'            => ':attribute is required.',
        );



        $validator = Validator::make($request->all(), $rules, $messages, $attributes);


        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $billings = Billings::find($request->id);
        $billings->amount=0;
        $billings->active=1;
        $billings->save();

        $corporateWallet = new CorporateWallet();
        $corporateWallet->corporate_id = $billings->corporate_id;
        $corporateWallet->amount = $request->amount;
        $corporateWallet->currency_code = 'ETB';
        $corporateWallet->save();

        flashMessage('success', 'Updated Successfully');


        return redirect(LOGIN_USER_TYPE.'/manage_corporate_billings');
    }


    public function destroy($id)
    {
        //
    }
}
