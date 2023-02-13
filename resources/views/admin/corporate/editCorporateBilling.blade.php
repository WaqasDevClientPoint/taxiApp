@extends('admin.template')

@section('main')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Edit Corporate Billing
            </h1>
            <ol class="breadcrumb">
                <li><a href="{{ url(LOGIN_USER_TYPE.'/dashboard') }}"><i class="fa fa-dashboard"></i> Home</a></li>
                @if(LOGIN_USER_TYPE == 'admin')
                    <li><a href="{{ url(LOGIN_USER_TYPE.'/manage_corporate_billings') }}">Corporate Billing</a></li>
                @endif
                <li class="active">Edit</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- right column -->
                <div class="col-md-12">
                    <!-- Horizontal Form -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Edit Corporate Billing Form</h3>
                        </div>

                        {!! Form::open(['url'=>LOGIN_USER_TYPE.'/edit_corporate_billing/'.$result->id, 'class'=>'form-horizontal', 'files'=>true, 'id'=>'company_form', 'novalidate']) !!}
                        {{ Form::hidden('user_id', $result->id, array('id'=>'user_id')) }}
                        <div class="box-body">
                            <span class="text-danger">(*)Fields are Mandatory</span>
                            <div class="form-group">
                                <label for="input_name" class="col-sm-3 control-label">Requested Amount</label>
                                <div class="col-md-7 col-sm-offset-1">
                                    {!! Form::text('name', $result->requested_amount, ['class' => 'form-control', 'id' => 'input_name', 'placeholder' => 'Name','readonly'=>'true']) !!}
                                    <span class="text-danger">{{ $errors->first('name') }}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_name" class="col-sm-3 control-label">Add Wallet Amount <em class="text-danger">*</em></label>
                                <div class="col-md-7 col-sm-offset-1">
                                    {!! Form::text('amount', $result->wallet_amount, ['class' => 'form-control', 'id' => 'input_name', 'placeholder' => 'Add Wallet Amount']) !!}
                                    <span class="text-danger">{{ $errors->first('amount') }}</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_name" class="col-sm-3 control-label">Add Wallet Amount <em class="text-danger">*</em></label>
                                <div class="col-md-7 col-sm-offset-1">
                                        {!! Form::select('status', array('1' => 'Active', '0' => 'Inactive'), '', ['class' => 'form-control', 'id' => 'input_status', 'placeholder' => 'Select']) !!}
                                    <span class="text-danger">{{ $errors->first('status') }}</span>
                                </div>
                            </div>




                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer text-center">
                            <button type="submit" class="btn btn-info" name="submit" value="submit">Submit</button>
                            @if(LOGIN_USER_TYPE == 'corporate')
                                <a href="{{url(LOGIN_USER_TYPE.'/edit_corporate/'.$result->id)}}"><span class="btn btn-default">Cancel</span></a>
                            @else
                                <a href="{{url(LOGIN_USER_TYPE.'/corporates')}}"><span class="btn btn-default">Cancel</span></a>
                            @endif
                        </div>
                        <!-- /.box-footer -->
                        {!! Form::close() !!}
                    </div>
                    <!-- /.box -->
                </div>
                <!--/.col (right) -->
            </div>
            <!-- /.row -->
    </div>
    </section>
    <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection

@push('scripts')
    <script>
        var datepicker_format = 'dd-mm-yy';
        $('#license_exp_date').datepicker({ 'dateFormat': datepicker_format, maxDate: new Date()});
        $(function () {
            $("#yearDate").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:' + new Date().getFullYear().toString(),
                dateFormat: datepicker_format,
            });
            $('.ui-datepicker').addClass('notranslate');
        });
        $('#insurance_exp_date').datepicker({ 'dateFormat': datepicker_format, maxDate: new Date()});
        $(function () {
            $("#yearDate").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:' + new Date().getFullYear().toString(),
                dateFormat: datepicker_format,
            });
            $('.ui-datepicker').addClass('notranslate');
        });
    </script>
@endpush
