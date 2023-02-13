<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Policies;
use Illuminate\Http\Request;
use App\DataTables\PoliciesDataTable;
use Illuminate\Support\Facades\DB;
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
            $rules = array(
                'policy_name'    => 'required',
                'description'     => 'required',
                'amount_to_spend'      => 'required',
                'no_of_rides'      => 'required',


            );

            // Add Rider Validation Custom Names
            $attributes = array(
                'policy_name' => 'Policy Name',
                'description' => 'Description',
                'amount_to_spend'      => 'Amount to spend',
                'no_of_rides'      => 'No of Rides',

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
            $user->amount_to_spend	          = $request->no_of_rides;
            $user->amount_to_spend_frequency = $request->amount_to_spend_frequency;
            $user->duration	          = $request->duration;

            $user->corporate_id	          = Auth('corporate')->id();

            $user->save();

            foreach($request->monday_start_time as $key=>$value){
                $dayTime='';
                if($key==0){
                    $dayTime='morning';
                }elseif($key==1){
                    $dayTime='afternoon';
                }else{
                    $dayTime='evening';
                }

                DB::table('bookings_time')->insert(
                    array('policy_id' => $user->id, 'day' => 'monday','dayTime' =>$dayTime,'time'=> $value .'-'.$request->monday_end_time[$key])
                );
            }
            foreach($request->tuesday_start_time as $key=>$value){
                $dayTime='';
                if($key==0){
                    $dayTime='morning';
                }elseif($key==1){
                    $dayTime='afternoon';
                }else{
                    $dayTime='evening';
                }

                DB::table('bookings_time')->insert(
                    array('policy_id' => $user->id, 'day' => 'tuesday','dayTime' =>$dayTime,'time'=> $value .'-'.$request->tuesday_end_time[$key])
                );
            }
            foreach($request->wednesday_start_time as $key=>$value){
                $dayTime='';
                if($key==0){
                    $dayTime='morning';
                }elseif($key==1){
                    $dayTime='afternoon';
                }else{
                    $dayTime='evening';
                }

                DB::table('bookings_time')->insert(
                    array('policy_id' => $user->id, 'day' => 'wednesday','dayTime' =>$dayTime,'time'=> $value .'-'.$request->wednesday_end_time[$key])
                );
            }
            foreach($request->thursday_start_time as $key=>$value){
                $dayTime='';
                if($key==0){
                    $dayTime='morning';
                }elseif($key==1){
                    $dayTime='afternoon';
                }else{
                    $dayTime='evening';
                }

                DB::table('bookings_time')->insert(
                    array('policy_id' => $user->id, 'day' => 'thursday','dayTime' =>$dayTime,'time'=> $value .'-'.$request->thursday_end_time[$key])
                );
            }
            foreach($request->friday_start_time as $key=>$value){
                $dayTime='';
                if($key==0){
                    $dayTime='morning';
                }elseif($key==1){
                    $dayTime='afternoon';
                }else{
                    $dayTime='evening';
                }

                DB::table('bookings_time')->insert(
                    array('policy_id' => $user->id, 'day' => 'friday','dayTime' =>$dayTime,'time'=> $value .'-'.$request->friday_end_time[$key])
                );
            }
            foreach($request->saturday_start_time as $key=>$value){
                $dayTime='';
                if($key==0){
                    $dayTime='morning';
                }elseif($key==1){
                    $dayTime='afternoon';
                }else{
                    $dayTime='evening';
                }

                DB::table('bookings_time')->insert(
                    array('policy_id' => $user->id, 'day' => 'saturday','dayTime' =>$dayTime,'time'=> $value .'-'.$request->saturday_end_time[$key])
                );
            }
            foreach($request->sunday_start_time as $key=>$value){
                $dayTime='';
                if($key==0){
                    $dayTime='morning';
                }elseif($key==1){
                    $dayTime='afternoon';
                }else{
                    $dayTime='evening';
                }

                DB::table('bookings_time')->insert(
                    array('policy_id' => $user->id, 'day' => 'sunday','dayTime' =>$dayTime,'time'=> $value .'-'.$request->sunday_end_time[$key])
                );
            }



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
