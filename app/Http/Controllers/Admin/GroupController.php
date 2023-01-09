<?php

namespace App\Http\Controllers\Admin;

use App\DataTables\GroupsDataTable;
use App\Http\Controllers\Controller;
use App\Models\ApiCredentials;
use App\Models\Country;
use App\Models\Group;
use App\Models\Policies;
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
            $data['policies'] = Policies::where('corporate_id',Auth('corporate')->id())->get();

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
            $data['policies'] = Policies::where('corporate_id',Auth('corporate')->id())->get();

            if($data['result']) {
                return view('admin.group.edit', $data);
            }
            flashMessage('danger', 'Invalid ID');
            return redirect('corporate/group');
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

            $user = Group::find($request->id);
            $user->name   = $request->first_name;
            $user->description    = $request->description;
            $user->policy_id        = $request->policy;
            $user->save();

            flashMessage('success', trans('messages.user.update_success'));
        }

        return redirect('corporate/group');
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
