<?php

namespace App\Http\Controllers\Admin;

use App\DataTables\GroupsDataTable;
use App\Http\Controllers\Controller;
use App\Models\ApiCredentials;
use App\Models\Country;
use App\Models\Group;
use Illuminate\Http\Request;
use App\DataTables\UsersDataTable;
use Illuminate\Support\Facades\Validator;


class GroupController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(GroupsDataTable $dataTable)
    {
        return $dataTable->render('admin.group.view');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {

        if($request->isMethod('GET')) {
            $data['country_code_option'] = Country::select('long_name','phone_code','id')->get();
            $data['google_api'] = ApiCredentials::where('id','');
            return view('admin.group.add',$data);
        }
        if($request->submit) {
            $rules = array(
                'first_name'    => 'required',
                'description'     => 'required',
                'policy'      => 'required',
            );

            // Add Rider Validation Custom Names
            $attributes = array(
                'first_name' => 'Name',
                'description' => 'Description',
                'policy' => 'policy',

            );

            // Edit Rider Validation Custom Fields message
            $messages = array(
                'required' => ':attribute is required',
            );

            $validator = Validator::make($request->all(), $rules,$messages, $attributes);


            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $user = new Group();
            $user->name   = $request->first_name;
            $user->description    = $request->description;
            $user->policy_id        = $request->policy;
            $user->corporate_id        = $request->corporate_id;

            $user->save();

            flashMessage('success', 'Added Successfully');
        }
        return redirect('corporate/group');
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

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if($request->isMethod("GET")) {
            $data['result'] = Group::find($request->id);
            if($data['result']) {
                return view('admin.group.edit', $data);
            }
            flashMessage('danger', 'Invalid ID');
            return redirect('corporate/group');
        }
        if($request->submit) {
            $rules = array(
                'first_name'    => 'required',
                'last_name'     => 'required',
                'mobile_number' => 'required|numeric|regex:/[0-9]{6}/',
                'country_code'  => 'required',
                'gender'        => 'required',
                'status'        => 'required',
            );
            // Edit Rider Validation Custom Fields message
            $messages = array(
                'required' => ':attribute '.trans('messages.home.field_is_required').'',
                'mobile_number.regex' => trans('messages.user.mobile_no'),
            );
            // Edit Rider Validation Custom Fields Name
            $attributes = array(
                'first_name' => trans('messages.user.firstname'),
                'last_name' => trans('messages.user.lastname'),
                'email' => trans('messages.user.email'),
                'password' => trans('messages.user.paswrd'),
                'country_code' => trans('messages.user.country_code'),
                'gender' => trans('messages.profile.gender'),
                'mobile_number' => trans('messages.user.mobile'),
                'status' => trans('messages.driver_dashboard.status'),
            );

            $validator = Validator::make($request->all(), $rules,$messages, $attributes);

            if($request->mobile_number != "") {
                $validator->after(function ($validator) use($request) {
                    $user = User::where('mobile_number', $request->mobile_number)->where('user_type', $request->user_type)->where('country_id', $request->country_id)->where('id','!=', $request->id)->count();

                    if($user) {
                        $validator->errors()->add('mobile_number',trans('messages.user.mobile_no_exists'));
                    }
                });
            }

            $validator->after(function ($validator) use($request) {
                if(!empty($request->email)){
                    if (!filter_var($request->email, FILTER_VALIDATE_EMAIL)) {
                        $validator->errors()->add('email',trans('messages.user.invalid_email'));
                    }
                    $user_email = User::where('email', $request->email)->where('user_type', $request->user_type)->where('id','!=', $request->id)->count();
                    if($user_email) {
                        $validator->errors()->add('email',trans('messages.user.email_exists'));
                    }
                }
            });

            if($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $user = User::find($request->id);

            $user->first_name   = $request->first_name;
            $user->last_name    = $request->last_name;
            $user->email        = $request->email;
            $user->country_code = $request->country_code;
            $user->gender       = $request->gender;
            if($request->mobile_number != "") {
                $user->mobile_number= $request->mobile_number;
            }
            $user->user_type    = $request->user_type;
            if($request->password != '') {
                $user->password = $request->password;
            }
            $user->country_id = $request->country_id;
            $user->status       = $request->status;
            $user->save();

            $location = RiderLocation::where('user_id',$request->id)->first();
            if($location == '') {
                $location   = new RiderLocation;
            }
            $location->user_id          =   $request->id;
            $location->home             =   $request->home_location?$request->home_location:'';
            $location->work             =   $request->work_location ? $request->work_location :'';
            $location->home_latitude    =   $request->home_latitude ? $request->home_latitude :'';
            $location->home_longitude   =   $request->home_longitude ? $request->home_longitude : '';
            $location->work_latitude    =   $request->work_latitude ? $request->work_latitude :'';
            $location->work_longitude   =   $request->work_longitude ? $request->work_longitude : '';
            $location->save();

            flashMessage('success', trans('messages.user.update_success'));
        }

        return redirect('corporate/rider');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete(request $request)
    {
        Group::where('id',$request->id)->delete();
        flashMessage('success', 'Deleted Successfully');
        return redirect('corporate/group');
    }
}
