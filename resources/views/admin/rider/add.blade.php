@extends('admin.template')
@section('main')
<div class="content-wrapper" ng-controller="destination_admin">
	<section class="content-header">
		<h1> Add Rider </h1>
		<ol class="breadcrumb">
			<li>
				<a href="{{ url(LOGIN_USER_TYPE.'/dashboard') }}"> <i class="fa fa-dashboard"> </i> Home </a>
			</li>
			<li>
				<a href="{{ url(LOGIN_USER_TYPE.'/rider') }}"> Riders </a>
			</li>
			<li class="active"> Add </li>
		</ol>
	</section>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title"> Add Rider Form </h3>
					</div>
					@if(LOGIN_USER_TYPE=='corporate')
						{!! Form::open(['url' => 'corporate/add_rider', 'class' => 'form-horizontal']) !!}
					@else
						{!! Form::open(['url' => 'admin/add_rider', 'class' => 'form-horizontal']) !!}
					@endif
					<div class="box-body">
						<span class="text-danger">(*)Fields are Mandatory</span>
						<div class="form-group">
							<label for="input_first_name" class="col-sm-3 control-label">First Name<em class="text-danger">*</em></label>
							<div class="col-md-7 col-sm-offset-1">
								{!! Form::text('first_name', '', ['class' => 'form-control', 'id' => 'input_first_name', 'placeholder' => 'First Name']) !!}
								<span class="text-danger">{{ $errors->first('first_name') }}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="input_last_name" class="col-sm-3 control-label">Last Name<em class="text-danger">*</em></label>
							<div class="col-md-7 col-sm-offset-1">
								{!! Form::text('last_name', '', ['class' => 'form-control', 'id' => 'input_last_name', 'placeholder' => 'Last Name']) !!}
								<span class="text-danger">{{ $errors->first('last_name') }}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="input_email" class="col-sm-3 control-label">Email</label>
							<div class="col-md-7 col-sm-offset-1">
								{!! Form::text('email', '', ['class' => 'form-control', 'id' => 'input_email', 'placeholder' => 'Email']) !!}
								<span class="text-danger">{{ $errors->first('email') }}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="input_password" class="col-sm-3 control-label">Password<em class="text-danger">*</em></label>
							<div class="col-md-7 col-sm-offset-1">
								{!! Form::text('password', '', ['class' => 'form-control', 'id' => 'input_password', 'placeholder' => 'Password']) !!}
								<span class="text-danger">{{ $errors->first('password') }}</span>
							</div>
						</div>
						{!! Form::hidden('user_type','Rider', ['class' => 'form-control', 'id' => 'user_type', 'placeholder' => 'Select']) !!}
						<div class="form-group">
							<label for="input_status" class="col-sm-3 control-label">Country Code<em class="text-danger">*</em></label>
							<div class="col-md-7 col-sm-offset-1">
								<select class ='form-control' id = 'input_country_code' name='country_code' >
									@foreach($country_code_option as $country_code)
									<option value="{{@$country_code->phone_code}}" data-id="{{ $country_code->id }}" {{ ($country_code->id == old('country_id')) ? 'Selected' : ''}}>{{$country_code->long_name}}</option>
									@endforeach
									{!! Form::hidden('country_id', old('country_id'), array('id'=>'country_id')) !!}
								</select>
								<span class="text-danger">{{ $errors->first('country_code') }}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-3 control-label">Gender <em class="text-danger">*</em></label>
							<div class="col-md-7 col-sm-offset-1">
								{{ Form::radio('gender', '1', '', ['class' => 'form-check-input gender', 'id'=>'g_male']) }}
								<label for="g_male" style="font-weight: normal !important;">Male</label>
								{{ Form::radio('gender', '2', '', ['class' => 'form-check-input gender', 'id'=>'g_female']) }}
								<label for="g_female" style="font-weight: normal !important;">Female</label>
								<div class="text-danger">{{ $errors->first('gender') }}</div>
							</div>
						</div>
						<div class="form-group">
							<label for="input_status" class="col-sm-3 control-label">Mobile Number <em class="text-danger">*</em></label>
							<div class="col-md-7 col-sm-offset-1">
								{!! Form::text('mobile_number', '', ['class' => 'form-control', 'id' => 'mobile_number', 'placeholder' => 'Mobile Number']) !!}
								<span class="text-danger">{{ $errors->first('mobile_number') }}</span>
							</div>
						</div>
						@if(LOGIN_USER_TYPE=='corporate')
							<div class="form-group">
							<label for="input_status" class="col-sm-3 control-label">Group<em class="text-danger">*</em></label>
							<div class="col-md-7 col-sm-offset-1">
								<select class ='form-control' id = 'input_country_code' name='group_id' required>
									<option>Select Group</option>
									@foreach($groups as $group)
										<option value="{{$group->id}}" data-id="{{ $group->id }}" {{ ($group->id == old('group_id')) ? 'Selected' : ''}}>{{$group->name}}</option>
									@endforeach
								</select>
								<span class="text-danger">{{ $errors->first('group_id') }}</span>
							</div>
						</div>
						@endif
						<div class="form-group">
							<label for="input_password" class="col-sm-3 control-label">Home Location</label>
							<div class="col-md-7 col-sm-offset-1">
								<div class="autocomplete-input-container">
									<div class="autocomplete-input">
										{!! Form::text('home_location', @$location->home_location, ['class' => 'form-control', 'id' => 'input_home_location', 'placeholder' => 'Home Location','autocomplete' => 'off']) !!}
									</div>
									<ul class="autocomplete-results home-autocomplete-results">
									</ul>
								</div>
								<span class="text-danger">{{ $errors->first('home_location') }}</span>
							</div>
						</div>
						{!! Form::hidden('home_latitude',@$location->home_latitude, ['class' => 'form-control', 'id' => 'home_latitude', 'placeholder' => 'Select']) !!}
						{!! Form::hidden('home_longitude',@$location->home_longitude, ['class' => 'form-control', 'id' => 'home_longitude', 'placeholder' => 'Select']) !!}
						<div class="form-group">
							<label for="input_password" class="col-sm-3 control-label">Work Location</label>
							<div class="col-md-7 col-sm-offset-1">
								<div class="autocomplete-input-container">
									<div class="autocomplete-input">
										{!! Form::text('work_location', @$location->work_location, ['class' => 'form-control', 'id' => 'input_work_location', 'placeholder' => 'Work Location','autocomplete' => 'off']) !!}
									</div>
									<ul class="autocomplete-results work-autocomplete-results">
									</ul>
								</div>
								<span class="text-danger">{{ $errors->first('work_location') }}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="input_status" class="col-sm-3 control-label">Status<em class="text-danger">*</em></label>
							<div class="col-md-7 col-sm-offset-1">
								{!! Form::select('status', array('Active' => 'Active', 'Inactive' => 'Inactive'), '', ['class' => 'form-control', 'id' => 'input_status', 'placeholder' => 'Select']) !!}
								<span class="text-danger">{{ $errors->first('status') }}</span>
							</div>
						</div>
						{!! Form::hidden('work_latitude',@$location->work_latitude, ['class' => 'form-control', 'id' => 'work_latitude', 'placeholder' => 'Select']) !!}
						{!! Form::hidden('work_longitude',@$location->work_longitude, ['class' => 'form-control', 'id' => 'work_longitude', 'placeholder' => 'Select']) !!}
					    @if(LOGIN_USER_TYPE=='corporate')
							{!! Form::hidden('corporate_id',auth('corporate')->id(), ['class' => 'form-control', 'id' => 'corporate', 'placeholder' => 'Select']) !!}
						@endif
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
