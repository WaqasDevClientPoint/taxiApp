@extends('admin.template')
@section('main')
    <div class="content-wrapper" ng-controller="destination_admin">
        <section class="content-header">
            <h1> Add Group </h1>
            <ol class="breadcrumb">
                <li>
                    <a href="{{ url(LOGIN_USER_TYPE.'/dashboard') }}"> <i class="fa fa-dashboard"> </i> Home </a>
                </li>
                <li>
                    <a href="{{ url(LOGIN_USER_TYPE.'/group') }}"> Groups </a>
                </li>
                <li class="active"> Add </li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title"> Add Group Form </h3>
                        </div>
                        {!! Form::open(['url' => 'corporate/add_group', 'class' => 'form-horizontal']) !!}
                        <div class="box-body">
                            <span class="text-danger">(*)Fields are Mandatory</span>
                            <div class="form-group">
                                <label for="input_first_name" class="col-sm-3 control-label">Name<em class="text-danger">*</em></label>
                                <div class="col-md-7 col-sm-offset-1">
                                    {!! Form::text('first_name', '', ['class' => 'form-control', 'id' => 'input_first_name', 'placeholder' => 'Group Name']) !!}
                                    <span class="text-danger">{{ $errors->first('name') }}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_first_name" class="col-sm-3 control-label">Description<em class="text-danger">*</em></label>
                                <div class="col-md-7 col-sm-offset-1">
                                    {!! Form::textarea('description', '', ['class' => 'form-control', 'id' => 'input_description', 'placeholder' => 'Group Description']) !!}
                                    <span class="text-danger">{{ $errors->first('description') }}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_first_name" class="col-sm-3 control-label">Policy<em class="text-danger">*</em></label>
                                <div class="col-md-7 col-sm-offset-1">
                                    <select class ='form-control' id = 'policy' name='policy' >
                                        <option value="">Select Policy</option>
                                        <option value="1">Managers</option>
                                        <option value="2">Workers</option>

                                    </select>
                                    <span class="text-danger">{{ $errors->first('policy') }}</span>
                                </div>
                            </div>
                            {!! Form::hidden('corporate_id', auth('corporate')->id(), array('id'=>'corporate_id')) !!}

                        </div>
                        <div class="box-footer text-center">
                            <button type="submit" class="btn btn-info" name="submit" value="submit">Submit</button>
                            <button type="submit" class="btn btn-default" name="cancel" value="cancel">Cancel</button>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
