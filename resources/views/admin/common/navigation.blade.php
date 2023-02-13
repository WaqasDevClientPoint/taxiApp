<style>

	h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
		font-family: 'Poppins', sans-serif;
	}
	.main-sidebar, .left-side{
		position: fixed;
		top: 0;
		left: 0;
		min-height: 100%;
		width: 250px;
		z-index: 810;
		-webkit-transition: -webkit-transform .3s ease-in-out, width .3s ease-in-out;
		-moz-transition: -moz-transform .3s ease-in-out, width .3s ease-in-out;
		-o-transition: -o-transform .3s ease-in-out, width .3s ease-in-out;
		transition: transform .3s ease-in-out, width .3s ease-in-out;
		max-height: 100%;
		background-color: #F2F3F5;
		border-radius: 20px;
		height: 100%;
		overflow: hidden;
		margin: 15px;
	}
	.main-sidebar .sidebar{
		padding: 15px 0 0 0;
		max-height: 90vh;
		overflow-y: auto;
		box-sizing: content-box;
		background-color: #F2F3F5;
		border-radius: 20px !important;
		height: 100% !important;
	}
	.skin-purple .main-sidebar{
		border-radius: 20px;
		height: 100%;
	}

	.skin-purple .sidebar-menu>li>a {
		border-left: 3px solid transparent;
	}

	.skin-purple .sidebar a {
		color: #5E6278;
	}
	.skin-purple .sidebar-menu>li:hover>a, .skin-purple .sidebar-menu>li.active>a {
		color: #181C32;
		background: transparent;
		border-left-color: #181C32;
		font-weight: bold;
	}
	.main-header .sidebar-toggle{
		background-color: #f2f3f5;
		padding: 8px 15px 5px 15px;
		margin-left: 0;
		margin-top: 18px;
	}
	.main-header > .navbar{
		margin-left: 280px;
	}
	.main-header .sidebar-toggle:before{
		color: black;
	}
	.skin-purple .main-header .navbar .sidebar-toggle:hover{
		background-color: rgba(0, 0, 0, 0.1);
	}
	.skin-purple .treeview-menu>li>a{
		color: #5E6278;
	}
	.skin-purple .sidebar-menu > li > .treeview-menu{
		background-color: #F2F3F5;
	}
	a{
		background-color: transparent;
	}
	.main-header .sidebar-toggle:focus, .main-header .sidebar-toggle:active{
		background: #f2f3f5;
	}
	@media (min-width: 768px){
		.sidebar-mini.sidebar-collapse .content-wrapper,
		.sidebar-mini.sidebar-collapse .main-header .navbar,
		.sidebar-mini.sidebar-collapse .right-side,
		.sidebar-mini.sidebar-collapse .main-footer{
			margin-left: 80px !important;
		}
	}
	.content-header>h1 {
		margin: 0 0 5px;
		font-size: 22px;
		color: #181C32;
		font-weight: bold;
	}
	.sidebar a.logo{
		padding: 0;
	}
	.sidebar .logo img{
		max-width: 160px;
	}
	.main-footer{
		margin-left: 280px;
	}
	.main-sidebar:before{
		display: none;
	}
	.skin-purple .sidebar-menu>li:hover>a, .skin-purple .sidebar-menu>li.active>a{
		border-left-color: #2166eb;
	}
	/*small-box css*/
	.small-box .icon{
		-webkit-transition: all .3s linear;
		-o-transition: all .3s linear;
		transition: all .3s linear;
		position: unset;
		z-index: 0;
		background: transparent;
		border-radius: 50%;
		width: 50px;
		height: 50px;
		font-size: 30px;
		padding: 15px;
		text-align: center;
		color: #fff;
		margin-left: auto;
	}
	.small-box {
		display: flex;
		align-items: center;
		padding: 3em;
		height: 210px;
		justify-content: center;
	}
	.small-box {
		border-radius: 15px !important;
		position: relative;
		margin-bottom: 20px;
		background-color: #EFEFEF;
		margin: 10px 0 20px;
		box-shadow: unset;
	}
	.small-box > .inner{
		padding: 0;
	}
	.content-header>.breadcrumb {
		float: unset;
		background: transparent;
		margin-top: 0;
		margin-bottom: 0;
		font-size: 12px;
		padding: 7px 5px;
		position: unset;
	}


</style>
<aside class="main-sidebar">
	<section class="sidebar">
		<a href="https://poolus.biz/admin/dashboard" class="logo">
			<img src="https://poolus.biz/admin_assets/dist/img/pool-Logo.png" alt="logo">
		</a>
		<!-- <div class="user-panel">
			<div class="pull-left image">
				@php
					if(LOGIN_USER_TYPE=='company'){
						$user = Auth::guard('company')->user();
						$company_user = true;
						$corporate_user = false;

						$first_segment = 'company';
					}elseif(LOGIN_USER_TYPE=='corporate'){
						$user = Auth::guard('corporate')->user();
						$company_user = false;
						$corporate_user = true;
						$first_segment = 'corporate';
					}
					else{
						$user = Auth::guard('admin')->user();
						$company_user = false;
						$corporate_user = false;

						$first_segment = 'admin';
					}
				@endphp
				@if(!$company_user || $user->profile ==null)
					<img src="{{ url('admin_assets/dist/img/avatar04.png') }}"  class="img-circle" alt="User Image">
				@else
					<img src="{{ $user->profile }}"  class="img-circle" alt="User Image">
				@endif
			</div>
			<div class="pull-left info">
				<p>{{ (!$company_user)?$user->username:$user->name }}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div> -->
		<ul class="sidebar-menu">
			<!-- <li class="header">MAIN NAVIGATION</li> -->
			<li class="{{ (Route::current()->uri() == $first_segment.'/dashboard') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/dashboard') }}"><i class="fa fa-dashboard"></i><span>Dashboard</span></a></li>

			@if(@$user->can('manage_admin'))
			<li class="treeview {{ (Route::current()->uri() == 'admin/admin_user' || Route::current()->uri() == 'admin/roles') ? 'active' : ''  }}">
				<a href="#">
					<i class="fa fa-user-plus"></i> <span>Manage Admin</span> <i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li class="{{ (Route::current()->uri() == 'admin/admin_user') ? 'active' : ''  }}"><a href="{{ url('admin/admin_user') }}"><i class="fa fa-circle-o"></i><span>Admin Users</span></a></li>
					<li class="{{ (Route::current()->uri() == 'admin/roles') ? 'active' : ''  }}"><a href="{{ url('admin/roles') }}"><i class="fa fa-circle-o"></i><span>Roles & Permissions</span></a></li>
				</ul>
			</li>
			@endif

			@if($company_user || @$user->can('view_driver'))
				<li class="{{ (Route::current()->uri() == $first_segment.'/driver') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/driver') }}"><i class="fa fa-dribbble"></i><span>Manage Drivers</span></a></li>
			@endif
			@if($company_user && $user->id != 1)
			<li class="{{ (Route::current()->uri() == $first_segment.'/payout_preferences') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/payout_preferences') }}"><i class="fa fa-paypal"></i><span>Payout Preferences</span></a></li>
			@endif
			@if($corporate_user || @$user->can('view_rider'))
			<li class="{{ (Route::current()->uri() == $first_segment.'/rider') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/rider') }}"><i class="fa fa-users"></i>
					@if($corporate_user)
					<span>People</span></a></li>
			@else
				<span>Manage Riders</span></a></li>
			@endif
			@endif
			@if(@$user->can('view_company'))
				<li class="{{ (Route::current()->uri() == 'admin/company') ? 'active' : ''  }}"><a href="{{ url('admin/company') }}"><i class="fa fa-building"></i><span>Manage Franchise</span></a></li>
			@endif
			@if(@$user->can('manage_corporate'))
				<li class="treeview {{ (Route::current()->uri() == 'admin/corporates') ? 'active' : ''  }}">
					<a href="{{ url('admin/corporates') }}"><i class="fa fa-newspaper-o"></i><span>Manage Corporate</span> <i class="fa fa-angle-left pull-right"></i></a>
					<ul class="treeview-menu">
							<li class="{{ (Route::current()->uri() == $first_segment.'/manage_corporate_billings') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/manage_corporate_billings') }}"><i class="fa fa fa-dollar" aria-hidden="true"></i><span>Manage Corporate Billings</span></a></li>
					</ul>
				</li>
{{--				<li class="{{ (Route::current()->uri() == 'admin/corporates') ? 'active' : ''  }}"><a href="{{ url('admin/corporates') }}"><i class="fa fa-newspaper-o"></i><span>Manage Corporate</span></a></li>--}}
			@endif
			@if(@$user->can('view_documents'))
				<li class="{{ (Route::current()->uri() == 'admin/documents') ? 'active' : ''  }}"><a href="{{ url('admin/documents') }}"><i class="fa fa-users"></i><span>Manage Documents</span></a></li>
			@endif

           {{--           corporate menu--}}
			@if($corporate_user || @$user->can('view_policies'))
				<li class="{{ (Route::current()->uri() == $first_segment.'/policies') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/policies') }}"><i class="fa fa-cog"></i><span>Policies</span></a></li>
			@endif
			@if($corporate_user)
				<li class="{{ (Route::current()->uri() == $first_segment.'/group') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/group') }}"><i class="fa fa-users"></i><span>Groups</span></a></li>
			@endif
			{{--           corporate menu--}}


			@if($company_user || @$user->status == 'Active' || @$user->can('manage_send_message') || @$user->can('manage_send_email') || @$user->can('manage_email_settings'))
				<li class="treeview {{ (Route::current()->uri() == $first_segment.'/send_message' || Route::current()->uri() == 'admin/send_email' || Route::current()->uri() == 'admin/email_settings') ? 'active' : ''  }}">
					<a href="#">
						<i class="fa fa-bullhorn"></i>
						<span> Communications </span><i class="fa fa-angle-left pull-right"></i>

					</a>
					<ul class="treeview-menu">
						@if($company_user || @$user->can('manage_send_message'))
							<li class="{{ (Route::current()->uri() == $first_segment.'/send_message') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/send_message') }}"><i class="fa fa-circle-o"></i><span>Send Messages</span></a></li>
						@endif
						@if(@$user->can('manage_send_email'))
							<li class="{{ (Route::current()->uri() == 'admin/send_email') ? 'active' : ''  }}">
								<a href="{{ url('admin/send_email') }}"><i class="fa fa-circle-o"></i>
									<span>Send Email</span>
								</a>
							</li>
						@endif
						@if(@$user->can('manage_email_settings'))
							<li class="{{ (Route::current()->uri() == 'admin/email_settings') ? 'active' : ''  }}">
								<a href="{{ url('admin/email_settings') }}"><i class="fa fa-circle-o"></i>
									<span>Email Settings</span>
								</a>
							</li>
						@endif
					</ul>
				</li>
			@endif

			@if((($company_user || $corporate_user  && @$user->status == 'Active') || @$user->can('manage_manual_booking')) || ($company_user || @$user->can('manage_vehicle_type')))
			<li class="treeview {{ (Route::current()->uri() == $first_segment.'/manual_booking/{id?}' || Route::current()->uri() == $first_segment.'/later_booking') ? 'active' : ''  }}">
				<a href="#">
					<i class="fa fa-taxi"></i>
					@if($corporate_user)
					<span> Rider Booker </span><i class="fa fa-angle-left pull-right"></i>
					@else
						<span> Manage Manual Booking </span><i class="fa fa-angle-left pull-right"></i>

					@endif
				</a>
				<ul class="treeview-menu">
					@if(($company_user || $corporate_user || @$user->status == 'Active') || @$user->can('manage_manual_booking'))
					<li class="{{ (Route::current()->uri() == $first_segment.'/manual_booking/{id?}') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/manual_booking') }}"><i class="fa fa-address-book" aria-hidden="true"></i><span>Manual Booking</span></a></li>
					@endif
					@if($company_user || $corporate_user || @$user->can('manage_manual_booking'))
					<li class="{{ (Route::current()->uri() == $first_segment.'/later_booking') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/later_booking') }}"><i class="fa fa-list-alt"></i><span>View Manual/Schedule Booking</span></a></li>
					@endif
				</ul>
			</li>
			@endif

			@if($company_user || @$user->status == 'Active' || @$user->can('view_vehicle_make') || @$user->can('view_vehicle_model') || @$user->can('manage_vehicle_type'))
				<li class="treeview {{ (Route::current()->uri() == 'admin/vehicle_make' || Route::current()->uri() == 'admin/vehicle_model' || Route::current()->uri() == 'admin/vehicle_type') ? 'active' : ''  }}">
					<a href="#">
						<i class="fa fa-car"></i>
						<span> Manage Vehicles </span><i class="fa fa-angle-left pull-right"></i>

					</a>
					<ul class="treeview-menu">
						@if(@$user->can('view_vehicle_make'))
							<li class="{{ (Route::current()->uri() == 'admin/vehicle_make' || Route::current()->uri() == 'admin/add-vehicle-make' || Route::current()->uri() == 'admin/edit-vehicle-make/{id}') ? 'active' : ''  }}"><a href="{{ url('admin/vehicle_make') }}"><i class="fa fa fa-circle-o"></i><span>Vehicle Make</span></a></li>
						@endif

						@if(@$user->can('view_vehicle_model'))
							<li class="{{ (Route::current()->uri() == 'admin/vehicle_model' || Route::current()->uri() == 'admin/add-vehicle_model' || Route::current()->uri() == 'admin/edit-vehicle_model/{id}') ? 'active' : ''  }}"><a href="{{ url('admin/vehicle_model') }}"><i class="fa fa fa-circle-o"></i><span>Vehicle Model</span></a></li>
						@endif

						@if($company_user || @$user->can('manage_vehicle_type'))
							<li class="{{ (Route::current()->uri() == 'admin/vehicle_type') ? 'active' : ''  }}"><a href="{{ url('admin/vehicle_type') }}"><i class="fa fa fa-circle-o"></i><span>Vehicles Types</span></a></li>
						@endif
					</ul>
				</li>
			@endif





			@if(@$user->can('view_additional_reason'))
			<li class="{{ (Route::current()->uri() == 'admin/additional-reasons') ? 'active' : ''  }}"><a href="{{ url('admin/additional-reasons') }}"><i class="fa fa fa-comment"></i><span> Additional Reasons</span></a></li>
			@endif

			@if(@$user->can('view_manage_reason'))
			<li class="{{ (Route::current()->uri() == 'admin/cancel-reason') ? 'active' : ''  }}"><a href="{{ url('admin/cancel-reason') }}"><i class="fa fa fa-ban"></i><span>Manage Cancel Reason</span></a></li>
			@endif

			@if(@$user->can('manage_locations'))
			<li class="{{ (Route::current()->uri() == 'admin/locations') ? 'active' : ''  }}"><a href="{{ url('admin/locations') }}"><i class="fa fa-map-o"></i><span>Manage Locations</span></a></li>
			@endif

			@if(@$user->can('manage_peak_based_fare'))
			<li class="{{ (Route::current()->uri() == 'admin/manage_fare') ? 'active' : ''  }}"><a href="{{ url('admin/manage_fare') }}"><i class="fa fa fa-dollar"></i><span>Manage Fare</span></a></li>
			@endif



			@if($company_user || $corporate_user || @$user->can('manage_requests') || @$user->can('manage_trips') || @$user->can('manage_cancel_trips') || @$user->can('manage_payments') || @$user->can('manage_rating'))
			<li class="treeview {{ (Route::current()->uri() == $first_segment.'/request' || Route::current()->uri() == $first_segment.'/trips' || Route::current()->uri() == $first_segment.'/cancel_trips' || Route::current()->uri() == $first_segment.'/payments' || Route::current()->uri() == $first_segment.'/rating') ? 'active' : ''  }}">
				<a href="#">
					<i class="fa fa-taxi"></i>
					@if($corporate_user)
					<span> Rides </span><i class="fa fa-angle-left pull-right"></i>
					@else
						<span> Manage Trips </span><i class="fa fa-angle-left pull-right"></i>
					@endif
				</a>
				<ul class="treeview-menu">
					@if($company_user || $corporate_user|| @$user->can('manage_requests'))
					<li class="{{ (Route::current()->uri() == $first_segment.'/request') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/request') }}"><i class="fa fa-paper-plane-o"></i><span>Manage Ride Requests</span></a></li>
					@endif

					@if($company_user || $corporate_user|| @$user->can('manage_trips'))
					<li class="{{ (Route::current()->uri() == $first_segment.'/trips') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/trips') }}"><i class="fa fa-taxi"></i><span> Manage Trips</span></a></li>
					@endif

					@if($company_user || $corporate_user|| @$user->can('manage_cancel_trips'))
					<li class="{{ (Route::current()->uri() == $first_segment.'/cancel_trips') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/cancel_trips') }}"><i class="fa fa-chain-broken"></i><span>Manage Canceled Trips</span></a></li>
					@endif

					@if($company_user || @$user->can('manage_payments'))
					<li class="{{ (Route::current()->uri() == $first_segment.'/payments') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/payments') }}"><i class="fa fa-usd"></i><span>Manage Payments</span></a></li>
					@endif

					@if($company_user || $corporate_user|| @$user->can('manage_rating'))
					<li class="{{ (Route::current()->uri() == $first_segment.'/rating') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/rating') }}"><i class="fa fa-star"></i><span>Ratings</span></a></li>
					@endif
				</ul>
			</li>
			@endif

			@if($company_user  || @$user->can('manage_driver_payments') || @$user->can('manage_company_payments'))
			<li class="treeview {{ (Route::current()->uri() == 'admin/payout/overall' || Route::current()->uri() == 'admin/payout/company/overall' || Route::current()->uri() == 'company/payout/overall') ? 'active' : ''  }}">
				<a href="#">
					<i class="fa fa-dollar" aria-hidden="true"></i> <span>Manage Payouts</span> <i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					@if(@$user->can('manage_company_payment'))
					<li class="{{ (Route::current()->uri() == 'admin/payout/company/overall') ? 'active' : ''  }}"><a href="{{ url('admin/payout/company/overall') }}"><i class="fa fa-circle-o"></i><span>Company Payouts</span></a></li>
					@endif
					@if($company_user || @$user->can('manage_driver_payments'))
					<li class="{{ (Route::current()->uri() == $first_segment.'/payout/overall') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/payout/overall') }}"><i class="fa fa-circle-o"></i><span>Driver Payouts</span></a></li>
					@endif
				</ul>
			</li>
			@endif
			@if($company_user || @$user->can('manage_owe_amount'))
			<li class="{{ (Route::current()->uri() == $first_segment.'/owe') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/owe') }}"><i class="fa fa-money"></i><span>Manage Owe Amount</span></a></li>
			@endif


			@if($company_user ||  @$user->can('manage_statements'))
			<li class="treeview {{ (Route::current()->uri() == $first_segment.'/statements/{type}') ? 'active' : ''  }}">
				<a href="#">
					<i class="fa fa-area-chart"></i> <span>Manage Statements</span> <i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li class="{{ (request()->type == 'overall') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/statements/overall') }}"><i class="fa fa-circle-o"></i><span>Overall Statments</span></a></li>
					<li class="{{ (request()->type == 'driver') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/statements/driver') }}"><i class="fa fa-circle-o"></i><span>Drivers Statments</span></a></li>
				</ul>
			</li>
			@endif
			@if(@$user->can('manage_wallet') || @$user->can('manage_promo_code'))
			<li class="treeview {{ (Route::current()->uri() == 'admin/wallet/{user_type}' || Route::current()->uri() == 'admin/promo_code') ? 'active' : ''  }}">
				<a href="#">
					<i class="fa fa-google-wallet"></i> <span>Manage Wallet & Promo</span> <i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					@if($company_user || @$user->can('manage_wallet'))
					<li class="treeview {{ (@$navigation == 'manage_wallet') ? 'active' : ''  }}">
						<a href="{{ route('wallet',['user_type' => 'Rider']) }}"><i class="fa fa-circle-o"></i>
							<span> Manage Wallet Amount </span>
						</a>
					</li>
					@endif
					@if(@$user->can('manage_promo_code'))
					<li class="{{ (Route::current()->uri() == 'admin/promo_code') ? 'active' : ''  }}"><a href="{{ url('admin/promo_code') }}"><i class="fa fa-circle-o"></i><span>Manage Promo Code</span></a></li>
					@endif
				</ul>
			</li>
			@endif

			@if(@$user->can('manage_rider_referrals') || @$user->can('manage_driver_referrals'))
			<li class="treeview {{ (Route::current()->uri() == 'admin/referrals/rider' || Route::current()->uri() == 'admin/referrals/driver') ? 'active' : ''  }}">
				<a href="#">
					<i class="fa fa-users"></i>
					<span>Referrals</span><i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					@if(@$user->can('manage_rider_referrals'))
					<li class="{{ (Route::current()->uri() == 'admin/referrals/rider') ? 'active' : ''  }}">
						<a href="{{ url('admin/referrals/rider') }}"><i class="fa fa-circle-o"></i>
							<span> Riders </span>
						</a>
					</li>
					@endif
					@if(@$user->can('manage_driver_referrals'))
					<li class="{{ (Route::current()->uri() == 'admin/referrals/driver') ? 'active' : ''  }}">
						<a href="{{ url('admin/referrals/driver') }}"><i class="fa fa-circle-o"></i>
							<span> Drivers </span>
						</a>
					</li>
					@endif
				</ul>
			</li>
			@endif
			@if($company_user  || $user->can('manage_map') || $user->can('manage_heat_map'))
			<li class="treeview {{ (Route::current()->uri() == $first_segment.'/map' || Route::current()->uri() == $first_segment.'/heat-map') ? 'active' : ''  }}">
				
				<a href="#">
					<i class="fa fa-map-marker" aria-hidden="true"></i> <span>Manage Map</span> <i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					@if($user->can('manage_map')|| $corporate_user || $company_user )
						<li class="{{ (Route::current()->uri() == $first_segment.'/map') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/map') }}"><i class="fa fa-circle-o"></i><span>Map View</span></a></li>
					@endif

					@if($user->can('manage_heat_map')|| $corporate_user || $company_user )
					<li class="{{ (Route::current()->uri() == $first_segment.'/heat-map') ? 'active' : ''  }}"><a href="{{ url($first_segment.'/heat-map') }}"><i class="fa fa-circle-o"></i><span>HeatMap</span></a></li>
					@endif
				</ul>
			</li>
			@endif
			@if(@$user->can('manage_mobile_app_version'))
			<li class="{{ (Route::current()->uri() == 'admin/mobile_app_version') ? 'active' : ''  }}"><a href="{{ url('admin/mobile_app_version') }}"><i class="fa fa-level-up"></i><span>Manage Mobile App Version</span></a></li>
			@endif
			@if(@$user->can('manage_help'))
				<li class="treeview {{ (Route::current()->uri() == 'admin/help' || Route::current()->uri() == 'admin/help_category' || Route::current()->uri() == 'admin/help_subcategory') ? 'active' : ''  }}">
					<a href="#">
						<i class="fa fa-support"></i> <span>Manage Help</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li class="{{ (Route::current()->uri() == 'admin/help') ? 'active' : ''  }}"><a href="{{ url('admin/help') }}"><i class="fa fa-circle-o"></i><span>Help</span></a></li>
						<li class="{{ (Route::current()->uri() == 'admin/help_category') ? 'active' : ''  }}"><a href="{{ url('admin/help_category') }}"><i class="fa fa-circle-o"></i><span>Category</span></a></li>
						<li class="{{ (Route::current()->uri() == 'admin/help_subcategory') ? 'active' : ''  }}"><a href="{{ url('admin/help_subcategory') }}"><i class="fa fa-circle-o"></i><span>Subcategory</span></a></li>
					</ul>
				</li>
			@endif


			@if(@$user->status == 'Active' || $corporate_user || Route::current()->uri() == 'admin/site_setting' || Route::current()->uri() == 'admin/support' || Route::current()->uri() == 'admin/join_us' || Route::current()->uri() == 'admin/language' || Route::current()->uri() == 'admin/currency' || @$user->can('manage_site_settings') ||@$user->can('manage_support') || @$user->can('manage_api_credentials') || @$user->can('manage_payment_gateway') || @$user->can('manage_fees') || @$user->can('manage_referral_settings')  || @$user->can('manage_metas') || @$user->can('manage_country') || @$user->can('manage_currency') || @$user->can('manage_language') || @$user->can('manage_join_us'))
				<li class="treeview {{ (Route::current()->uri() == 'admin/api_credentials' || Route::current()->uri() == 'admin/site_setting' ||Route::current()->uri() == 'admin/support' || Route::current()->uri() == 'admin/payment_gateway' || Route::current()->uri() == 'admin/country' || Route::current()->uri() == 'admin/metas' || Route::current()->uri() == 'admin/referral_settings' || Route::current()->uri() == 'admin/payment_gateway' || Route::current()->uri() == 'admin/fees') ? 'active' : ''  }}">
					<a href="#">
						<i class="fa fa-cogs"></i>
						<span> Manage Settings </span><i class="fa fa-angle-left pull-right"></i>

					</a>
					<ul class="treeview-menu">
						@if(@$user->can('manage_api_credentials'))
							<li class="{{ (Route::current()->uri() == 'admin/api_credentials') ? 'active' : ''  }}"><a href="{{ url('admin/api_credentials') }}"><i class="fa fa-gear"></i><span>Api Credentials</span></a></li>
						@endif
						@if(@$user->can('manage_payment_gateway'))
							<li class="{{ (Route::current()->uri() == 'admin/payment_gateway') ? 'active' : ''  }}"><a href="{{ url('admin/payment_gateway') }}"><i class="fa fa-paypal"></i><span>Payment Gateway</span></a></li>
						@endif
						@if(@$user->can('manage_fees'))
							<li class="{{ (Route::current()->uri() == 'admin/fees') ? 'active' : ''  }}"><a href="{{ url('admin/fees') }}"><i class="fa fa-dollar"></i><span>Manage Fees</span></a></li>
						@endif
						@if(@$user->can('manage_referral_settings'))
							<li class="{{ (Route::current()->uri() == 'admin/referral_settings') ? 'active' : ''  }}"><a href="{{ url('admin/referral_settings') }}"><i class="fa fa-users"></i><span>Manage Referral Settings</span></a></li>
						@endif
						@if(@$user->can('manage_metas'))
							<li class="{{ (Route::current()->uri() == 'admin/metas') ? 'active' : ''  }}"><a href="{{ url('admin/metas') }}"><i class="fa fa-bar-chart"></i><span>Manage Metas</span></a></li>
						@endif
						@if(@$user->can('manage_country'))
							<li class="{{ (Route::current()->uri() == 'admin/country') ? 'active' : ''  }}"><a href="{{ url('admin/country') }}"><i class="fa fa-globe"></i><span>Manage Country</span></a></li>
						@endif
						@if(@$user->can('manage_currency'))
							<li class="{{ (Route::current()->uri() == 'admin/currency') ? 'active' : ''  }}"><a href="{{ url('admin/currency') }}"><i class="fa fa-eur"></i><span>Manage Currency</span></a></li>
						@endif
						@if(@$user->can('manage_language'))
							<li class="{{ (Route::current()->uri() == 'admin/language') ? 'active' : ''  }}"><a href="{{ url('admin/language') }}"><i class="fa fa-language"></i><span>Manage Language</span></a></li>
						@endif


						@if(@$user->can('manage_join_us'))
							<li class="{{ (Route::current()->uri() == 'admin/join_us') ? 'active' : ''  }}"><a href="{{ url('admin/join_us') }}"><i class="fa fa-share-alt"></i><span>Join Us Links</span></a></li>
						@endif
						@if($corporate_user)
							<li class="{{ (Route::current()->uri() == 'billings') ? 'active' : ''  }}"><a href="/corporate/billing"><i class="fa fa-cogs"></i>

									<span>Billing</span>


								</a></li>
						@endif
						@if(@$user->can('manage_support') || $corporate_user)
							<li class="{{ (Route::current()->uri() == 'admin/support') ? 'active' : ''  }}"><a href="{{ url('admin/support') }}"><i class="fa fa-globe"></i>
									@if($corporate_user)
										<span>Support</span>
									@else
										<span>Manage Support</span>

									@endif

								</a></li>
						@endif
						@if(@$user->can('manage_site_settings') || $corporate_user)
							<li class="{{ (Route::current()->uri() == 'admin/site_setting') ? 'active' : ''  }}"><a href="{{ url('admin/site_setting') }}"><i class="fa fa-cogs"></i>
									@if($corporate_user)
										<span>Setting</span>
									@else
										<span>Site Setting</span>

									@endif

								</a></li>
						@endif
					</ul>
				</li>
			@endif




		</ul>
	</section>
</aside>
