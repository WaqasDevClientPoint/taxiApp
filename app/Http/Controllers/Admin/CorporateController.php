<?php

namespace App\Http\Controllers\Admin;

use App\Corporate;
use App\DataTables\CorporatesDataTable;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\CompanyDocuments;
use App\Models\Country;
use Illuminate\Http\Request;
use Validator;
use DB;
use Image;
use Auth;
class CorporateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(CorporatesDataTable $dataTable)
    {
        return $dataTable->render('admin.corporate.index');
    }

    public function add(Request $request)
    {
        if($request->isMethod("GET")) {
            $data['country_code_option'] = Country::pluck('long_name','id');
            return view('admin.corporate.create_corporate',$data);
        }
        if($request->isMethod("POST")) {
            $rules = array(
                'name' => 'required|unique:companies,name,' . $request->id,
                'country_code' => 'required',
                'mobile_number' => 'required|regex:/[0-9]{6}/',
                'status' => 'required',
                'password' => 'required|min:6',
                'profile' => 'mimes:jpg,jpeg,png',
                'address_line' => 'required',
                'postal_code' => 'required',
            );

            $attributes = array(
                'name' => 'Name',
                'email' => 'Email',
                'country_code' => 'Country Code',
                'mobile_number' => 'Mobile Number',
                'status' => 'Status',
                'password' => 'Password',
                'profile' => 'Profile',
                'address_line' => 'Address Line',
                'postal_code' => 'Postal Code',
            );

            $messages = array(
                'required' => ':attribute is required.',
                'mobile_number.regex' => trans('messages.user.mobile_no'),
            );

//        $company_doc = CheckDocument('Company',$request->country_code ?? 'all');
//
//        if($company_doc->count() > 0){
//            foreach($company_doc as $key => $value) {
//                $rules['file_'.$value->id] = 'required|mimes:jpg,jpeg,png,gif';
//                $attributes['file_'.$value->id] = $value->doc_name;
//                if($value->expire_on_date=='Yes') {
//                    $rules['expired_date_'.$value->id] = 'required|date|date_format:Y-m-d';
//                    $attributes['expired_date_'.$value->id] = 'Expired Date';
//                }
//            }
//        }

            $validator = Validator::make($request->all(), $rules, $messages, $attributes);

            $validator->after(function ($validator) use ($request) {
                $company = Corporate::where('mobile_number', $request->mobile_number)->where('country_id', $request->country_code)->count();

                if ($company) {
                    $validator->errors()->add('mobile_number', trans('messages.user.mobile_no_exists'));
                }

                if (!empty($request->email)) {
                    if (!filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
                        $validator->errors()->add('email', trans('messages.user.invalid_email'));
                    }
                    $company_email = Corporate::where('email', $request->email)->count();
                    if ($company_email) {
                        $validator->errors()->add('email', trans('messages.user.email_exists'));
                    }
                }
            });

            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }
            $get_country = Country::find($request->country_code);


            $company = new Corporate();
            $company->name = $request->name;
            $company->vat_number = $request->vat_number;
            $company->email = $request->email;
            $company->country_code = $get_country->phone_code;
            $company->country_id = $request->country_code;
            $company->mobile_number = $request->mobile_number;
            $company->password = $request->password;
            $company->status = $request->status;
            $company->address = $request->address_line;
            $company->city = $request->city;
            $company->state = $request->state;
            $company->country = $get_country->phone_code;
            $company->postal_code = $request->postal_code;
            $company->save();

            $image_uploader = resolve('App\Contracts\ImageHandlerInterface');
            $target_dir = '/images/companies/' . $company->id;
            $target_path = asset($target_dir) . '/';

            if ($request->hasFile('profile')) {
                $profile = $request->file('profile');

                $extension = $profile->getClientOriginalExtension();
                $file_name = "profile_" . time() . "." . $extension;
                $options = compact('target_dir', 'file_name');

                $upload_result = $image_uploader->upload($profile, $options);
                if (!$upload_result['status']) {
                    flashMessage('danger', $upload_result['status_message']);
                    return back();
                }

                $company->profile = $target_path . $upload_result['file_name'];
                $company->save();
            }

//        if($company_doc){
//            foreach($company_doc as $key => $value) {
//                $document_name = $value->doc_name;
//                $document = $request->file('file_'.$value->id);
//                $extension = $document->getClientOriginalExtension();
//                $file_name = $document_name."_".time().".".$extension;
//                $options = compact('target_dir','file_name');
//                $upload_result = $image_uploader->upload($document,$options);
//                if(!$upload_result['status']) {
//                    flashMessage('danger', $upload_result['status_message']);
//                    return back();
//                }
//
//                $company_doc = new CompanyDocuments;
//                $company_doc->company_id = $company->id;
//                $company_doc->document_id = $value->id;
//                $company_doc->document = $target_path.$upload_result['file_name'];
//                $document_status = $value->doc_name."_status";
//                $company_doc->status = $request->$document_status;
//
//                $expired_date_key = 'expired_date_'.$value->id;
//                $company_doc->expired_date = $request->$expired_date_key;
//                $company_doc->save();
//            }
//        }


            flashMessage('success', trans('messages.user.add_success'));

            return redirect(LOGIN_USER_TYPE . '/corporates');
        }
    }

    public function update(Request $request)
    {
        if($request->isMethod("GET")) {
            $data['result'] = $company_info = Corporate::find($request->id);

            if (LOGIN_USER_TYPE=='company' && LOGIN_USER_TYPE=='corporate' && $request->id != Auth::guard('company')->user()->id) {
                abort(404);
            }

            if($data['result']) {
                $data['country_code_option']= Country::pluck('long_name','id');
                $data['path']               = url('images/users/'.$request->id);
                return view('admin.corporate.edit', $data);
            }
            flashMessage('danger', 'Invalid ID');
            return redirect(LOGIN_USER_TYPE.'/corporates');
        }

        $rules = array(
            'name'          => 'required|unique:companies,name,'.$request->id,
//            'email'         => 'required|email',
            'country_code'  => 'required',
            'password'      => 'nullable|min:6',
            'profile'       => 'mimes:jpg,jpeg,png',
            'address_line'  => 'required',
            'postal_code'   => 'required',
            'mobile_number' => 'nullable|regex:/[0-9]{6}/',
        );

        //Admin only can update status and company commission.Company could not update
//        if (LOGIN_USER_TYPE != 'company') {
//            $rules['status'] = 'required';
//            if ($request->id != 1) {
//                $rules['company_commission'] = 'required|numeric|max:100';
//            }
//        }

        $attributes = array(
            'name'          => 'Name',
            'email'         => 'Email',
            'country_code'  => 'Country Code',
            'mobile_number' => 'Mobile Number',
            'status'        => 'Status',
            'password'      => 'Password',
            'profile'       => 'Profile',
            'address_line'  => 'Address Line',
            'postal_code'   => 'Postal Code',
//            'company_commission' => 'Company Commission',
        );

        $messages = array(
            'required'            => ':attribute is required.',
            'mobile_number.regex' => trans('messages.user.mobile_no'),
        );



        $validator = Validator::make($request->all(), $rules, $messages, $attributes);

        $validator->after(function ($validator) use($request) {
            if ($request->mobile_number != '') {
                $company = Corporate::where('mobile_number', $request->mobile_number)->where('country_id', $request->country_code)->where('id','!=',$request->id)->count();
                if($company) {
                    $validator->errors()->add('mobile_number',trans('messages.user.mobile_no_exists'));
                }
            }
            if(!empty($request->email)){
                if (!filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
                    $validator->errors()->add('email',trans('messages.user.invalid_email'));
                }
                $company_email = Corporate::where('email', $request->email)->where('id','!=',$request->id)->count();
                if($company_email) {
                    $validator->errors()->add('email',trans('messages.user.email_exists'));
                }
            }
        });

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $get_country = Country::find($request->country_code);

        $company = Corporate::find($request->id);
        $company->name         = $request->name;
        $company->vat_number   = $request->vat_number;
        $company->email        = $request->email;
        $company->country_code = $get_country->phone_code;
        $company->country_id   = $request->country_code;
        if($request->mobile_number != "") {
            $company->mobile_number= $request->mobile_number;
        }
        if (isset($request->password)) {
            $company->password = $request->password;
        }
        if (LOGIN_USER_TYPE != 'corporate') {
            $company->status       = $request->status;
        }
        $company->address      = $request->address_line;
        $company->city         = $request->city;
        $company->state        = $request->state;
        $company->country      = $get_country->phone_code;
        $company->postal_code  = $request->postal_code;
        $company->save();

        $image_uploader = resolve('App\Contracts\ImageHandlerInterface');
        $target_dir = '/images/companies/'.$company->id;
        $target_path = asset($target_dir).'/';

        if($request->hasFile('profile')) {
            $profile    =   $request->file('profile');

            $extension = $profile->getClientOriginalExtension();
            $file_name = "profile_".time().".".$extension;
            $options = compact('target_dir','file_name');

            $upload_result = $image_uploader->upload($profile,$options);
            if(!$upload_result['status']) {
                flashMessage('danger', $upload_result['status_message']);
                return back();
            }

            $company->profile = $target_path.$upload_result['file_name'];
            $company->save();
        }

//        $company_doc = CheckDocument('Company',$request->country_code);
//        if($company_doc){
//            foreach($company_doc as $key => $value) {
//                if($request->hasFile('file_'.$value->id)){
//                    $document_name = $value->doc_name;
//                    $document = $request->file('file_'.$value->id);
//                    $extension = $document->getClientOriginalExtension();
//                    $file_name = $document_name."_".time().".".$extension;
//                    $options = compact('target_dir','file_name');
//                    $upload_result = $image_uploader->upload($document,$options);
//
//                    if(!$upload_result['status']) {
//                        flashMessage('danger', $upload_result['status_message']);
//                        return back();
//                    }
//
//                    $user_doc = CompanyDocuments::where('company_id',$company_info->id)->where('document_id',$value->id)->first();
//                    if(!$user_doc){
//                        $user_doc = new CompanyDocuments;
//                    }
//
//                    $user_doc->company_id  = $company_info->id;
//                    $user_doc->document_id = $value->id;
//                    $user_doc->document = $target_path.$upload_result['file_name'];
//                    $document_status    = $value->doc_name."_status";
//                    if(LOGIN_USER_TYPE=='company')
//                        $user_doc->status = '0';
//                    else
//                        $user_doc->status = $request->$document_status;
//                    $user_doc->save();
//                }
//            }
//
//            $deleteOldDocument = CompanyDocuments::where('company_id',$company_info->id)->whereNotIn('document_id',$company_doc->pluck('id')->toArray())->pluck('id');
//            /*Delete document from table and folder*/
//            if($deleteOldDocument){
//                foreach ($deleteOldDocument as $key => $value) {
//                    $company = CompanyDocuments::find($value);
//                    $company_doc = resolve('App\Contracts\ImageHandlerInterface');
//                    $company_doc->delete($company->document,['file_path' => '/images/companies/'.$company->id.'/']);
//                    $company->delete();
//                }
//            }
//            /*End Here*/
//
//            foreach($company_doc as $key => $value) {
//                $user_doc = CompanyDocuments::where('company_id',$company_info->id)->where('document_id',$value->id)->first();
//
//                $expired_date_key = 'expired_date_'.$value->id;
//
//                if(LOGIN_USER_TYPE=='company' && $user_doc->expired_date!=$request->$expired_date_key) {
//                    $document_status = $value->doc_name."_status";
//                    $user_doc->status = '0';
//                } else if(LOGIN_USER_TYPE!='company') {
//                    $document_status = $value->doc_name."_status";
//                    $user_doc->status = $request->$document_status;
//                }
//
//                $user_doc->expired_date = $request->$expired_date_key;
//                $user_doc->save();
//            }
//        }

        flashMessage('success', 'Updated Successfully');

        if (LOGIN_USER_TYPE == 'corporate') {
            return redirect('company/edit_corporate/'.Auth::guard('corporate')->user()->id);
        }
        return redirect(LOGIN_USER_TYPE.'/corporates');
    }
    public function delete(Request $request)
    {
        Corporate::find($request->id)->delete();
        flashMessage('success', 'Deleted Successfully');
        return redirect(LOGIN_USER_TYPE.'/corporates');
    }






    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }


    public function destroy($id)
    {
        //
    }
}
