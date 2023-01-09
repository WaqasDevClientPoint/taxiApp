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
<h1>test</h1>


<?php $__env->startSection('main'); ?>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Manage Policies
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="<?php echo e(url(LOGIN_USER_TYPE . '/dashboard')); ?>"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Policies</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <!-- <h3 class="box-title">Manage Riders</h3> -->
                            <?php if((LOGIN_USER_TYPE == 'corporate' && Auth::guard('corporate')->user()->status == 'Active') ||
                                (LOGIN_USER_TYPE == 'admin' &&
                                    Auth::guard('admin')->user()->can('create_rider'))): ?>
                                <div style="float:right;"><a class="btn btn-success" type="button" class="btn btn-primary"
                                     href="">Add Policy</a>
                                </div>
                            <?php endif; ?>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            
                            <div>
                                <h4>New Policy</h4>
                                <p>Set up spending allowance, add limitations, time restrictions and expense codes for your
                                    team.</p>
                            </div>
                            <div>
                                <form>
                                    <div class="form-group">
                                        <label for="title">Policy title <span>*</span></label>
                                        <input type="title" class="form-control" id="title" placeholder="Enter title">
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description of policy <span>Optional</span> </label>
                                        <textarea class="form-control" id="description" rows="3" placeholder="Enter description"></textarea>
                                    </div>
                                    <p class="text-center mb-0"><strong> RULES
                                            <hr>
                                        </strong></p>

                                    
                                    <div class="card expense">
                                        <div class="card-body">
                                            <label class="card-title">Expense tracking</label>
                                            <label class="switch" style="float: right;">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="card-text">A reason for placing the order and/or an expense code will
                                                need to be provided before submitting the order.</p>

                                            <div class="expense-body">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value=""
                                                                id="defaultCheck1">
                                                            <label class="form-check-label" for="defaultCheck1">
                                                                Expense note <br>
                                                                <span class="text-muted">People need to add a note to
                                                                    describe the purpose of the order.</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value=""
                                                                id="defaultCheck1">
                                                            <label class="form-check-label" for="defaultCheck1">
                                                                Expense code <br>
                                                                <span class="text-muted">People will need to select expense
                                                                    code from your expense code list</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    

                                    <br>
                                    
                                    <div class="card speeding">
                                        <div class="card-body">
                                            <label class="card-title">Spending allowance</label>
                                            <label class="switch" style="float: right;">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="card-text">Limit the maximum amount of money a person can spend within
                                                a given period of time</p>

                                            <div class="speeding-body">

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control"
                                                                placeholder="Spending allowance">
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">KES</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <select class="form-control" id="inputGroupSelect01">
                                                            <option selected>Choose...</option>
                                                            <option value="year">Year</option>
                                                            <option value="month">Month</option>
                                                            <option value="week">Week</option>
                                                            <option value="day">Day</option>
                                                            <option value="one-time">One time (never renewed)</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    

                                    <br>
                                    
                                    <div class="card speeding">
                                        <div class="card-body">
                                            <label class="card-title">Number of rides</label>
                                            <label class="switch" style="float: right;">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="card-text">Limit the maximum number of rides a person can make within
                                                a set period of time</p>

                                            <div class="speeding-body">

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control"
                                                                placeholder="Number of rides">
                                                            <div class="input-group-append">
                                                                <span class="input-group-text">Max</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <select class="form-control" id="inputGroupSelect01">
                                                            <option selected>Choose...</option>
                                                            <option value="year">Year</option>
                                                            <option value="month">Month</option>
                                                            <option value="week">Week</option>
                                                            <option value="day">Day</option>

                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    

                                    <br>
                                    
                                    <div class="card ride-time">
                                        <div class="card-body">
                                            <label class="card-title">Ride day and time</label>
                                            <label class="switch" style="float: right;">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="card-text">Restrict when users can ride to specific days of the week and/or times of the day.</p>

                                            <div class="ride-time-body">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                                    <label class="form-check-label" for="exampleRadios1">
                                                        Weekdays only
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                                    <label class="form-check-label" for="exampleRadios1">
                                                        Custom
                                                    </label>
                                                </div>
                                                <div class="ride-custom-time">
                                                    <div class="alert">
                                                       <i class="fa fa-info"></i> <span>Hour restriction for a single day can’t extend beyond 23:59. To add hour restriction that go beyond 24:00, select the next day and enter the appropriate times.</span> 
                                                    </div>
                                                    
                                                    <div>
                                                        <label>Monday</label>
                                                        <label class="switch" style="float: right;">
                                                            <input type="checkbox">
                                                            <span class="slider round"></span>
                                                        </label>
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
                                                                        <input type="time" class="form-control" id="start-time" >
                                                                    </td>
                                                                    <td>    
                                                                        <input type="time" class="form-control" id="end-time" >
                                                                    </td>
                                                                    <td>  
                                                                        <button type="button" class="btn btn-secondary"> <i class="fa fa-plus"></i></button>  
                                                                       
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    
                                                    <div>
                                                        <label>Tuesday</label>
                                                        <label class="switch" style="float: right;">
                                                            <input type="checkbox">
                                                            <span class="slider round"></span>
                                                        </label>
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
                                                                        <input type="time" class="form-control" id="start-time" >
                                                                    </td>
                                                                    <td>    
                                                                        <input type="time" class="form-control" id="end-time" >
                                                                    </td>
                                                                    <td>  
                                                                        <button type="button" class="btn btn-secondary"> <i class="fa fa-plus"></i></button>  
                                                                       
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    
                                                    <div>
                                                        <label>Wednesday</label>
                                                        <label class="switch" style="float: right;">
                                                            <input type="checkbox">
                                                            <span class="slider round"></span>
                                                        </label>
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
                                                                        <input type="time" class="form-control" id="start-time" >
                                                                    </td>
                                                                    <td>    
                                                                        <input type="time" class="form-control" id="end-time" >
                                                                    </td>
                                                                    <td>  
                                                                        <button type="button" class="btn btn-secondary"> <i class="fa fa-plus"></i></button>  
                                                                       
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    
                                                    <div>
                                                        <label>Thursday</label>
                                                        <label class="switch" style="float: right;">
                                                            <input type="checkbox">
                                                            <span class="slider round"></span>
                                                        </label>
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
                                                                        <input type="time" class="form-control" id="start-time" >
                                                                    </td>
                                                                    <td>    
                                                                        <input type="time" class="form-control" id="end-time" >
                                                                    </td>
                                                                    <td>  
                                                                        <button type="button" class="btn btn-secondary"> <i class="fa fa-plus"></i></button>  
                                                                       
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    
                                                    <div>
                                                        <label>Friday</label>
                                                        <label class="switch" style="float: right;">
                                                            <input type="checkbox">
                                                            <span class="slider round"></span>
                                                        </label>
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
                                                                        <input type="time" class="form-control" id="start-time" >
                                                                    </td>
                                                                    <td>    
                                                                        <input type="time" class="form-control" id="end-time" >
                                                                    </td>
                                                                    <td>  
                                                                        <button type="button" class="btn btn-secondary"> <i class="fa fa-plus"></i></button>  
                                                                       
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    
                                                    <div>
                                                        <label>Saturday</label>
                                                        <label class="switch" style="float: right;">
                                                            <input type="checkbox">
                                                            <span class="slider round"></span>
                                                        </label>
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
                                                                        <input type="time" class="form-control" id="start-time" >
                                                                    </td>
                                                                    <td>    
                                                                        <input type="time" class="form-control" id="end-time" >
                                                                    </td>
                                                                    <td>  
                                                                        <button type="button" class="btn btn-secondary"> <i class="fa fa-plus"></i></button>  
                                                                       
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    
                                                    <div>
                                                        <label>Sunday</label>
                                                        <label class="switch" style="float: right;">
                                                            <input type="checkbox">
                                                            <span class="slider round"></span>
                                                        </label>
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
                                                                        <input type="time" class="form-control" id="start-time" >
                                                                    </td>
                                                                    <td>    
                                                                        <input type="time" class="form-control" id="end-time" >
                                                                    </td>
                                                                    <td>  
                                                                        <button type="button" class="btn btn-secondary"> <i class="fa fa-plus"></i></button>  
                                                                       
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    

                                    <br>
                                    
                                    <div class="card service-type">
                                        <div class="card-body">
                                            <label class="card-title">Service type</label>
                                            <label class="switch" style="float: right;">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="card-text">Set which Bolt services can be used</p>

                                            <div class="service-type-body">

                                                
                                                <div>
                                                    <img class="img-thumbnail" width="80" src="https://business.bolt.eu/current/assets/img/policies/ridehailing-9ffaf6b3ab20e50da69ee0a2cbe2ec4b.png">
                                                    <p style="display: inline-block;vertical-align:top">Ride-hailing <br>
                                                        <span class="text-muted">Users can take rides</span>
                                                    </p>
                                                    <input type="checkbox" name="ride-hailing" id="ride-hailing" style="float: right">

                                                    <div style="margin:5px 0px 0px 50px">
                                                        <img class="img-thumbnail" width="80" src="https://business.bolt.eu/current/assets/img/policies/premium-84a4d0728cd5c221d7f6de7c39fcce07.png">
                                                        <p style="display: inline-block;vertical-align:top">Premium <br>
                                                            <span class="text-muted">Best-in-class vehicles</span>
                                                        </p>
                                                        <input type="checkbox" name="ride-hailing" id="ride-hailing" style="float: right">
                                                    </div>
                                                </div>
                                                <div style="margin:5px 0px 0px 0px">
                                                    <img class="img-thumbnail" width="80" src="https://business.bolt.eu/current/assets/img/policies/scooters-c9f3730f05a657b947b01bf21cf9cb1f.png">
                                                    <p style="display: inline-block;vertical-align:top">Rentals <br>
                                                        <span class="text-muted">Eco-friendly travel on two wheels</span>
                                                    </p>
                                                    <input type="checkbox" name="ride-hailing" id="ride-hailing" style="float: right">
                                                </div>
                                                <div style="margin:5px 0px 0px 0px">
                                                    <img class="img-thumbnail" width="80" src="https://business.bolt.eu/current/assets/img/policies/drive-ea4321ef40e746477768908e0997d00c.png">
                                                    <p style="display: inline-block;vertical-align:top">Bolt Drive <br>
                                                        <span class="text-muted">Car rental for your team</span>
                                                    </p>
                                                    <input type="checkbox" name="ride-hailing" id="ride-hailing" style="float: right">
                                                </div>
                                                  

                                            </div>
                                        </div>

                                    </div>
                                    

                                    <br>
                                    
                                    <div class="card service-type">
                                        <div class="card-body">
                                            <label class="card-title">Ride locations</label>
                                            <label class="switch" style="float: right;">
                                                <input type="checkbox">
                                                <span class="slider round"></span>
                                            </label>
                                            <p class="card-text">Choose locations where your team can travel to and from. (Supports ride-hailing only)</p>

                                            <div class="service-type-body">

                                                
                                                <div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="location" id="location" value="location-to-from" >
                                                        <label class="form-check-label" for="location-to-from">
                                                            To or from certain locations
                                                        </label>
                                                    </div>
                                                    <button class="btn btn-secondary" data-toggle="modal" data-target="#add-location">Add locations</button>

                                                </div>

                                                
                                                <div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="location" id="location" value="location-only-from" >
                                                        <label class="form-check-label" for="location-only-from">
                                                            Only from certain locations
                                                        </label>
                                                    </div>
                                                    <button class="btn btn-secondary" data-toggle="modal" data-target="#add-location">Add locations</button>

                                                </div>

                                                
                                                <div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="location" id="location" value="location-only-to" >
                                                        <label class="form-check-label" for="location-only-to">
                                                            Only to certain locations
                                                        </label>
                                                    </div>
                                                    <button class="btn btn-secondary" data-toggle="modal" data-target="#add-location">Add locations</button>

                                                </div>

                                                
                                                <div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="location" id="location" value="location-between" >
                                                        <label class="form-check-label" for="location-between">
                                                            Between certain locations
                                                        </label>
                                                    </div>
                                                    <button class="btn btn-secondary" data-toggle="modal" data-target="#add-location">Add locations</button>
                                                </div>
                                             
                                                  

                                            </div>
                                        </div>

                                    </div>
                                    

                                </form>
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
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <link rel="stylesheet" href="<?php echo e(url('css/buttons.dataTables.css')); ?>">
    <script src="<?php echo e(url('js/dataTables.buttons.js')); ?>"></script>
    <script src="<?php echo e(url('js/buttons.server-side.js')); ?>"></script>
    
<?php $__env->stopPush(); ?>

<?php echo $__env->make('admin.template', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\taxiApp\resources\views/admin/policy/view.blade.php ENDPATH**/ ?>