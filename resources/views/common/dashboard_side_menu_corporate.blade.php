<div class="container mar-zero" style="padding:0px;">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 height--full dash-panel">
		<div class="height--full separated--sides pull-left full-width">
			<div style="padding:0px;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 flexbox__item one-fifth page-sidebar hidden--portable hide-sm-760">
				<ul class="site-nav">
					<li class="soft--ends">
						<div class="center-block three-quarters push-half--bottom">
							<div class="img--circle img--bordered img--shadow fixed-ratio fixed-ratio--1-1">
								@if(@Auth::user()->profile_picture->src == '')
								<img src="{{ url('images/user.jpeg')}}" class="img--full fixed-ratio__content">
								@else
								<img src="{{ @Auth::user()->profile_picture->src }}" class="img--full fixed-ratio__content profile_picture">
								@endif
							</div>
						</div>
						<div class="text--center">
							<div style="font-size: 15px;color: #303841;font-weight: bold;line-height: 58px;
                            ">
								{{ @Auth::user()->first_name}} {{ @Auth::user()->last_name}}
							</div>
							<div class="soft-half--top"></div>
						</div>
					</li>
					<li>
						<a href="{{ route('rides') }}" aria-selected="{{ (Route::current()->uri() == 'rides') ? 'true' : 'false' }}" class="side-nav-a">Rides</a>
					</li>
					<li>
						<a href="{{ route('group') }}" aria-selected="{{ (Route::current()->uri() == 'profile') ? 'true' : 'false' }}" class="side-nav-a">Groups</a>
					</li>
					<li>
						<a href="#" aria-selected="{{ (Route::current()->uri() == 'profile') ? 'true' : 'false' }}" class="side-nav-a">Policies</a>
					</li>
					<li>
						<a href="#" aria-selected="{{ (Route::current()->uri() == 'profile') ? 'true' : 'false' }}" class="side-nav-a">People</a>
					</li>
					<li>
						<a href="#" aria-selected="{{ (Route::current()->uri() == 'profile') ? 'true' : 'false' }}" class="side-nav-a">Ride Booker</a>
					</li>
					<li>
						<a href="{{ route('referral') }}" aria-selected="{{ (Route::current()->uri() == 'referral') ? 'true' : 'false' }}" class="side-nav-a">
							{{trans('messages.referrals.referral')}}
						</a>
					</li>
					<li>
						<a href="javascript:void(0);" class="side-nav-a social-dropdown-btn">Support<i class="fa fa-caret-down"></i></a>
						<ul class="dropdown-container site_nav">
							@foreach($support_links as $support_link)
							@if($support_link->id==1)
                                @php $support_link->link = 'https://web.whatsapp.com/send?phone=+'.$support_link->link @endphp
                            @elseif($support_link->id==2)
                                @php $support_link->link = 'https://join.skype.com/invite/'.$support_link->link @endphp
                            @endif
							<li style="display: flex;align-items: center;">
                                <img src="{{ $support_link->image_src }}" style="width: 20px;height: 20px;margin-right: 10px;">
                                @if (is_numeric($support_link->link) || str_starts_with($support_link->link,'+') )
                                	<a target="_blank" data-toggle="modal" data-target="#support_links" name='mobile_number_tab' data-index='{{$support_link->link}}' class="side-nav-a" href="{{ $support_link->link }}">{{ $support_link->name }}</a>
                                @else
                                	<a target="_blank" class="side-nav-a" href="{{ $support_link->link }}">{{ $support_link->name }}</a>
                               @endif
                            </li>
							@endforeach
						</ul>
					</li>
					<li class="logout"><a href="{{ url('sign_out')}}">{{trans('messages.header.logout')}}</a></li>
				</ul>
			</div>
			<div class="modal poppayout fade" id="support_links" aria-hidden="false" tabindex="-1">
				<div id="modal-add-payout-set-address" class="modal-content">	
					<div class="panel-header">
						<button type="button" class="close" data-dismiss="modal"></button>
							Contact Number
					</div>
					<div class="payout_popup_view">
						<div class="payout_input_field">
							<label for="payout_info_payout_country"> 
								<em  id=pop_up_mobile_number>
								</em> 
							</label>
						</div>
					</div>
				</div>
			</div>

			
@push('scripts')
	<script type="text/javascript">
		$("a[name=mobile_number_tab]").on("click", function () { 
	    var mobile_number = $(this).attr("data-index");
	    console.log(mobile_number);
	    $("#pop_up_mobile_number").text(mobile_number);
		});
	</script>
@endpush
