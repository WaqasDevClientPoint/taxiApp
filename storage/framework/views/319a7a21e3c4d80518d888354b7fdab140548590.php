<title>Rides</title>

<?php $__env->startSection('main'); ?>
    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 flexbox__item page-content" style="padding:0px;" ng-controller="trip" ng-cloak>
        <input type="hidden" name="user_id" value="<?php echo e(@Auth::user()->id); ?>" id="user_id">
        <div class="hidden--palm">
            <div class="page-lead text-left">
                <div class="flexbox displayflex">
                    <div class="flexbox__item col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <h1 class="cls_profiletitle">
                            My Rides
                         </h1>
                    </div>
                   
                    <div class="flexbox__item col-lg-6 col-md-6 col-sm-6 col-xs-12 text--right">
                        <a data-toggle="collapse" id="show-filter" href="#trip-filterer" class="btn btn--primary btn-blue doc-button trip-filter__origin-link collapsed hide-sm-760"><span class="icon icon_settings-alt color--dark soft-half--right"></span>
                            Filter Rides    
                        </a>
                    </div>
                </div>
            </div>
            <div class="separated--bottom soft--ends text--center hide-md-760">
                <div data-toggle="collapse" data-target="#trip-filterer" class="btn btn--primary btn--large trip-filter__origin-btn collapsed">
                    <span class="icon icon_settings-alt alpha"></span>
                </div>
            </div>
        </div>
        
        <div id="trip-filters" class="trip-filters">
            <div id="trip-filters-active" class="trip-filters__active"></div>
            <form id="trip-filterer" data-replace="data-replace" data-button-loader="#trip-filterer-loader" data-button-loader-parent="#trip-filterer-button" class="trip-filters__form trip-filter collapse" style="height: auto;">
                <div class="trip-filter__item" style="overflow:hidden;">
                    <div class="grid">
                        <div class="drive-trip-filter">
                            <div class="flexbox displayflex">
                                <div class="flexbox__item col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <label for="">Months</label>
                                    <select class="form-control">
                                        <option>January</option>
                                        <option>February</option>
                                        <option>March</option>
                                        <option>April</option>
                                    </select>
                                </div>
                                <div class="flexbox__item col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <label for="">Riders</label>
                                    <select class="form-control">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </div>
                                <div class="flexbox__item col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <label for="">All Groups</label>
                                    <select class="form-control">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </div>
                               
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 trip-filter__item trip-filter-value">
                            <button ng-click="getTrips()" id="trip-filterer-button" type="submit" class="btn btn--primary btn--full btn--large btn-blue"><span class="btn-loader collapse" id="trip-filterer-loader"><span class="icon icon_spinner alpha"></span></span><span><?php echo e(trans('messages.profile.filter')); ?></span></button>
                        </div>
                    </div>
                </div>
                <div class="trip-filter__item" ng-if="selected_filter">
                    <div class="grid grid--full">
                        <div class="grid__item eleven-twelfths cf">
                            <div data-button-loader="#month-filter-loader" data-button-loader-parent="false" class="btn-group btn-group--bordered btn-group--joined inline-group push--right float--left">
                                <div class="cls_litags" style="">
                                    <a href="<?php echo e(url('driver_trip')); ?>" data-replace="data-replace" class="custom-clas"><span class="btn-loader collapse" id="month-filter-loader">
                                        <span class="icon icon_spinner"></span></span>
                                        <div id="selected_month" class="btn-input btn--uniform push--right month-filter filter-checked"></div><span class="icon icon_delete micro" ></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div id="no-more-tables" class="more-table-trips">
            <table class="col-sm-12 table-bordered table-striped table-condensed cf">
                <thead class="cf">
                    <tr>
                        <th></th>
                        <th class="width-60"><?php echo e(trans('messages.profile.pickup')); ?></th>
                        <th class="hide-sm"><?php echo e(trans('messages.profile.rider')); ?></th>
                        <th class="width-20"><?php echo e(trans('messages.profile.fare')); ?></th>
                        <th class="width-20"><?php echo e(trans('messages.profile.car')); ?></th>
                        <th class="hide-sm"><?php echo e(trans('messages.profile.location')); ?></th>
                        <th class="hide-sm"><?php echo e(trans('messages.dashboard.payment_methods')); ?></th>
                    </tr>
                </thead>
                <tbody class="all-trips-table" ng-repeat="trip in trips" ng-cloak>
                    <tr class="trip-expand__origin collapsed"  data-toggle="collapse" data-target="#trip-{{ trip.id}}" ng-cloak>
                        <td class="text--center"><span class="icon icon_right-arrow micro trip-expand__arrow"></span></td>
                        <td data-title="Pickup">{{ trip.begin_date|date:'MM/dd/yyyy'}}</td>
                        <td class="hide-sm" data-title="Driver">{{ trip.rider_name}}</td>
                        <td data-title="Fare"><span ng-bind-html="trip.currency.original_symbol"></span>&nbsp;{{ trip.company_driver_earnings }}<br><span class="text-danger">{{ trip.status }}</span></td>
                        <td data-title="Car">{{ trip.vehicle_name}}</td>
                        <td data-title="City" class="hide-sm">{{ trip.pickup_location }}</td>
                        <td class="hide-sm" data-title="Payment Method">
                            
                            <span class="soft-half--sides">{{ trip.payment_mode }} </span>
                        </td>
                        
                    </tr>
                    <tr class="hard">
                        <td colspan="8">
                            <div id="trip-{{ trip.id }}" class="collapse" style="height: auto;">
                                <div class="trip-expand trip-expand--completed">
                                    <div id="trip-{{ trip.id }}-expand" class="flexbox">
                                        <div class="col-lg-12">
                                            <div class="displayflex" style="border-bottom: 1px solid #ddd;margin-bottom: 20px;">
                                                <div class="col-lg-8">
                                                    <div class="cls_flexbox">
                                                        <h3 class="alpha push-half--bottom">
                                                           {{ trip.payment_mode }}
                                                        <span ng-bind-html="trip.currency.original_symbol"></span>&nbsp;{{ trip.company_driver_earnings }}</h3>
                                                        <h6 class="soft-half--ends separated--bottom color--neutral">{{ trip.pickup_date_time }}</h6>
                                                    </div>
                                                    </div>
                                                <div class="col-lg-4">
                                                    <div class="cls_flexboxbtn text--right">
                                                         <a href="<?php echo e(url('driver_trip_detail')); ?>/{{ trip.id}}" class="btn-group ">
                                                            <button type="submit" class="btn btn--primary btn-blue"><span class="icon icon_search"></span><?php echo e(trans('messages.profile.view_detail')); ?></button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flexbox__item col-lg-6 col-md-6 col-sm-12 hidden--portable hide-sm-760" style="height: 200px">
                                            <div id="trip-map-{{ trip.id }}"></div>
                                            <div class="fixed-ratio fixed-ratio--1-1" style="height: 100%">
                                                <img style="object-fit: cover" ng-src="{{ trip.trip_image }}" alt="Map image" class="hide-sm-760img--full img--flush img--bordered fixed-ratio__content sr_radio"  >
                                            </div>
                                        </div>
                                        <div class="flexbox__item col-lg-6 col-md-6 col-sm-12 palm-one-whole lap-one-half soft--sides">
                                            <div class="text--left">
                                                <div class="trip-address grid grid--full soft-double--bottom">
                                                    <div class="trip-address__path"></div>
                                                    <div class="grid__item one-tenth" style="margin:6px 0px;">
                                                        <div class="icon icon_route-dot color--positive"></div>
                                                    </div>
                                                    <div class="grid__item nine-tenths">
                                                        <p class="flush">{{ trip.pickup_time }}</p>
                                                        <h6 class="color--neutral flush">{{ trip.pickup_location }}</h6>
                                                    </div>
                                                </div>
                                                <div class="trip-address grid grid--full">
                                                    <div class="grid__item one-tenth" style="margin:6px 0px;">
                                                        <div class="icon icon_route-dot color--negative"></div>
                                                    </div>
                                                    <div class="grid__item nine-tenths">
                                                        <p class="flush">{{ trip.drop_time }}</p>
                                                        <h6 class="color--neutral flush">{{ trip.drop_location }}</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                       </div></div></div></td></tr>
                                                </tbody>
                                                <tbody class="all-trips-table">
                                                    <tr >
                                                        <td ng-show="trips.length==0" colspan="7" style="height: 46px;text-align: center;">
                                                            <?php echo e(trans('messages.dashboard.no_details')); ?>.
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="padding:25px;">
                                            <div class="pagination-buttons-container row-space-8 float--right" ng-cloak>
                                                <div class="results_count pagination inline-group btn-group btn-group--bordered" style="float: right;margin-top: 20px;">
                                                    <div class="inline-group__item" ng-show="trips.length>1">
                                                    <posts-pagination></posts-pagination>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </main>

  

    <script>
      
        

    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('template_dashboard_corporate', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xamp\htdocs\pool\taxiApp\resources\views/dashboard/rides.blade.php ENDPATH**/ ?>