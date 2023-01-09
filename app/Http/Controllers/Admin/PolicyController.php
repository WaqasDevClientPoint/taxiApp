<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Policies;
use Illuminate\Http\Request;
use App\DataTables\PoliciesDataTable;
use Illuminate\Support\Facades\Validator;


class PolicyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(PoliciesDataTable $dataTable)
    {
        return $dataTable->render('admin.policy.view');
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        if($request->isMethod('GET')) {
            return view('admin.policy.add');
        }

        if($request->submit){
//            dd($request->all());
            $rules = array(
                'policy_name'    => 'required',
                'description'     => 'required',
                'amount_to_spend'      => 'required',
                'no_of_rides'      => 'required',
                'start_time_morning'      => 'required',
                'end_time_morning'      => 'required',
                'start_time_afternoon'      => 'required',
                'end_time_afternoon'      => 'required',
                'start_time_evening'      => 'required',
                'end_time_evening'      => 'required',

            );

            // Add Rider Validation Custom Names
            $attributes = array(
                'policy_name' => 'Policy Name',
                'description' => 'Description',
                'amount_to_spend'      => 'Amount to spend',
                'no_of_rides'      => 'No of Rides',
                'start_time_morning'      => 'Morning Start Time',
                'end_time_morning'      => 'Morning End Time',
                'start_time_afternoon'      => 'Afternoon Start Time',
                'end_time_afternoon'      => 'Afternoon End Time',
                'start_time_evening'      => 'Evening Start Time',
                'end_time_evening'      => 'Evening End Time',
            );

            // Edit Rider Validation Custom Fields message
            $messages = array(
                'required' => ':attribute is required',
            );

            $validator = Validator::make($request->all(), $rules,$messages, $attributes);


            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $user = new Policies();
            $user->policy_name	          = $request->policy_name;
            $user->policy_description	  = $request->description;
            $user->no_of_rides	          = $request->no_of_rides;
            $user->morning                = $request->start_time_morning. '-' .$request->start_time_morning;
            $user->afternoon              = $request->start_time_afternoon. '-' .$request->start_time_afternoon;
            $user->evening                = $request->start_time_evening. '-' .$request->start_time_evening;
            $user->corporate_id           = Auth('corporate')->id();

            $user->save();

            flashMessage('success', 'Policy Created Successfully');
        }

        return redirect('corporate/policies');
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
