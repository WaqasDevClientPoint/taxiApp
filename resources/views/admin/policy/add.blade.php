<style>
    .card {
        position: relative;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid rgba(0, 0, 0, .125);
        border-radius: 0.25rem;
    }
    .card-body {
        -webkit-box-flex: 1;
        -ms-flex: 1 1 auto;
        flex: 1 1 auto;
        padding: 1.25rem;
    }
    .card-title {
        margin-bottom: 0.75rem;
    }
    /* The switch - the box around the slider */
    .switch {
        position: relative;
        display: inline-block;
        width: 50px;
        height: 24px;
    }
    /* Hide default HTML checkbox */
    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }
    /* The slider */
    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }
    .slider:before {
        position: absolute;
        content: "";
        height: 16px;
        width: 16px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }
    input:checked+.slider {
        background-color: #2196F3;
    }
    input:focus+.slider {
        box-shadow: 0 0 1px #2196F3;
    }
    input:checked+.slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }
    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }
    .slider.round:before {
        border-radius: 50%;
    }
    /* The alert message box */
    .alert {
        padding: 10px;
        background-color: #7097e07d; /* Red */
        color: #062d76;
        margin-bottom: 10px;
    }
</style>
<script>
    // var t=$('.toggle:first').val();
    // $(document).on('change', '.toggle', function() {
    //     console.log("Asdasd")
    //     var client_id = $(this).val();
    //     getClientProject(client_id);
    // });
    // $('.toggle').on("click", function() {
    //     console.log("Asdasd")
    //     var t=$(this).val();
    //     console.log({t})

    // });
    // const toggles = document.querySelectorAll(".toggle");
    function handleClick(obj,id){

        obj.classList.toggle("is-open");

        var status=obj.classList.contains('is-open')
        var content=document.getElementById(id);

        if(status==true){
            content.style.display="block";
        }
        else{
            content.style.display="none";
        }
    }


</script>
@extends('admin.template')

@section('main')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Create Policy
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="{{ url(LOGIN_USER_TYPE . '/dashboard') }}"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Policies</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            {{-- {!! $dataTable->table() !!} --}}
                            <div>
                                <h3>New Policy</h3>
                                <p>Set up spending allowance, add limitations and time restrictions for your
                                    team.</p>
                            </div>
                            <div>
                                {!! Form::open(['url' => 'corporate/add_policies', 'class' => 'form-horizontal']) !!}
                                <div class="form-group">
                                    <label for="title">Policy title <span>*</span></label>
                                    <input type="title" name="policy_name" class="form-control" id="title" placeholder="Enter title">
                                    <span class="text-danger">{{ $errors->first('policy_name') }}</span>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description of policy <span>Optional</span> </label>
                                    <textarea class="form-control" name="description" id="description" rows="3" placeholder="Enter description"></textarea>
                                    <span class="text-danger">{{ $errors->first('description') }}</span>

                                </div>
                                <p class="text-center mb-0"><strong> RULES  </strong></p>
                                <hr>



                                <br>
                                {{-- Spending allowance --}}
                                <div class="card speeding">
                                    <div class="card-body">
                                        <label class="card-title">Spending allowance</label>
                                        <label class="switch" style="float: right;">
                                            <input type="checkbox" class="toggle" onclick='handleClick(this,"speeding-body");'>
                                            <span class="slider round"></span>
                                        </label>
                                        <p class="card-text">Limit the maximum amount of money a person can spend</p>

                                        <div class="speeding-body"  id="speeding-body" style="display: none">

                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="input-group">
                                                        <input type="text" name="amount_to_spend" class="form-control"
                                                               placeholder="Spending allowance">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">KES</span>
                                                        </div>
                                                    </div>

                                                    <span class="text-danger">{{ $errors->first('amount_to_spend') }}</span>

                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="input-group">
                                                        <select name="duration" class="form-control">
                                                            <option value="daily">Per Day</option>
                                                            <option  value="week">Per Week</option>
                                                            <option  value="month">Per Month</option>
                                                            <option  value="year">Per Year</option>

                                                        </select>

                                                    </div>
                                                    <span class="text-danger">{{ $errors->first('amount_to_spend') }}</span>

                                                </div>


                                            </div>

                                        </div>
                                    </div>

                                </div>
                                {{-- **Spending allowance end** --}}

                                <br>
                                {{-- Number of rides --}}
                                <div class="card speeding">
                                    <div class="card-body">
                                        <label class="card-title">Number of rides</label>
                                        <label class="switch" style="float: right;">
                                            <input type="checkbox" class="toggle" onclick='handleClick(this,"rides-body");'>
                                            <span class="slider round"></span>
                                        </label>
                                        <p class="card-text">Limit the maximum number of rides a person</p>

                                        <div class="rides-body"  id="rides-body" style="display: none">

                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="input-group">
                                                        <input type="text" name="no_of_rides" class="form-control"
                                                               placeholder="Number of rides">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">Max</span>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="input-group">
                                                        <select name="duration" class="form-control">
                                                            <option value="daily">Per Day</option>
                                                            <option  value="week">Per Week</option>
                                                            <option  value="month">Per Month</option>
                                                            <option  value="year">Per Year</option>

                                                        </select>

                                                    </div>
                                                    <span class="text-danger">{{ $errors->first('amount_to_spend') }}</span>

                                                </div>

                                                <span class="text-danger">{{ $errors->first('no_of_rides') }}</span>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                {{-- **Number of rides end**--}}

                                <br>
                                {{-- Ride day and time --}}
                                <div class="card ride-time">
                                    <div class="card-body">
                                        <label class="card-title">Ride day and time</label>
                                        <label class="switch" style="float: right;">
                                            <input type="checkbox" class="toggle" onclick='handleClick(this,"ride-time-body");'>
                                            <span class="slider round"></span>
                                        </label>
                                        <p class="card-text">Restrict when users can ride</p>

                                        <div class="ride-time-body"  id="ride-time-body" style="display: none">

                                            <div class="ride-custom-time">
                                                <div>
                                                    <label>Morning</label>

                                                    <br>
                                                    <div>
                                                        <table class="table border-0" style="width:100%;padding: 10px">
                                                            <tr>
                                                                <th style="width:40%">Start Time</th>
                                                                <th style="width:40%">End Time</th>
                                                                <th style="width:20%"></th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="time" name="start_time_morning" class="form-control" id="start-time" >
                                                                    <span class="text-danger">{{ $errors->first('start_time_morning') }}</span>
                                                                </td>
                                                                <td>
                                                                    <input type="time" name="end_time_morning" class="form-control" id="end-time" >
                                                                    <span class="text-danger">{{ $errors->first('end_time_morning') }}</span>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                {{-- Tuesday --}}
                                                <div>
                                                    <label>Afternoon</label>

                                                    <br>
                                                    <div>
                                                        <table class="table border-0" style="width:100%;padding: 10px">
                                                            <tr>
                                                                <th style="width:40%">Start Time</th>
                                                                <th style="width:40%">End Time</th>
                                                                <th style="width:20%"></th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="time" name="start_time_afternoon" class="form-control" id="start-time" >
                                                                    <span class="text-danger">{{ $errors->first('start_time_afternoon') }}</span>

                                                                </td>
                                                                <td>
                                                                    <input type="time" name="end_time_afternoon" class="form-control" id="end-time" >
                                                                    <span class="text-danger">{{ $errors->first('end_time_afternoon') }}</span>

                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>

                                                {{-- Wednesday --}}
                                                <div>
                                                    <label>Evening</label>

                                                    <br>
                                                    <div>
                                                        <table class="table border-0" style="width:100%;padding: 10px">
                                                            <tr>
                                                                <th style="width:40%">Start Time</th>
                                                                <th style="width:40%">End Time</th>
                                                                <th style="width:20%"></th>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="time" name="start_time_evening" class="form-control" id="start-time" >
                                                                    <span class="text-danger">{{ $errors->first('start_time_evening') }}</span>

                                                                </td>
                                                                <td>
                                                                    <input type="time" name="end_time_evening" class="form-control" id="end-time" >
                                                                    <span class="text-danger">{{ $errors->first('end_time_evening') }}</span>

                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="box-footer text-center">
                                    <button type="submit" class="btn btn-info" name="submit" value="submit">Submit</button>
                                </div>
                                {!! Form::close() !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="add-location" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Add location</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="title">Location name <span>*</span></label>
                        <input type="title" class="form-control" id="title" placeholder="Enter title">
                    </div>
                    <div class="form-group">
                        <label for="description">Location Address </label>
                        <textarea class="form-control" id="description" rows="3" placeholder="Enter description"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="description">Radius</label>
                        <select class="form-control" id="radius">
                            <option selected>Choose...</option>
                            <option value="0.5km">0.5km</option>
                            <option value="1km">1km</option>
                            <option value="1.5km">1.5km</option>
                            <option value="2km">2km</option>
                            <option value="2.5km">2.5km</option>
                            <option value="3km">3km</option>
                            <option value="3.5km">3.5km</option>
                            <option value="4km">4km</option>
                            <option value="4.5km">4.5km</option>
                            <option value="5km">5km</option>
                            <option value="10km">10km</option>
                            <option value="20km">20km</option>
                            <option value="30km">30km</option>
                            <option value="40km">40km</option>
                            <option value="50km">50km</option>
                            <option value="60km">60km</option>
                            <option value="70km">70km</option>
                            <option value="80km">80km</option>
                            <option value="90km">90km</option>
                            <option value="100km">100km</option>

                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Add</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    {{--    <link rel="stylesheet" href="{{ url('css/buttons.dataTables.css') }}">--}}
    {{--    <script src="{{ url('js/dataTables.buttons.js') }}"></script>--}}
    {{--    <script src="{{ url('js/buttons.server-side.js') }}"></script>--}}
    {{-- {!! $dataTable->scripts() !!} --}}
@endpush

