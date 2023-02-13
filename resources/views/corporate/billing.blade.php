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



</script>
@extends('admin.template')

@section('main')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        @error('select_error')
        <div class="alert alert-danger">{{ $message }}</div>
        @enderror
        @if($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
{{--        <div class="alert alert-danger">{{$errors->first('select_error')}}</div>--}}
        <section class="content-header">
            <h1>
                Select Billing
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="{{ url(LOGIN_USER_TYPE . '/dashboard') }}"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Billings</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">

                        <div class="box-body">

                            <div>
{{--                                {!! Form::open(['url' => 'corporate/add_billings', 'class' => 'form-horizontal']) !!}--}}
                                <form  role="form"
                                       action="add_billings"
                                       method="post"
                                       class="require-validation"
                                       data-cc-on-file="false"
                                       data-stripe-publishable-key="pk_test_RclvJwXEzIfjnhFGRbFZxXZL"
                                       id="payment-form">
                                    @csrf
                                <div class="card speeding">
                                    <div class="card-body">
                                        <label class="card-title">Pre Billing</label>
                                        <label class="switch" style="float: right;">
                                            <input type="checkbox" class="toggle" onclick='handleClick(this,"speeding-body");'>
                                            <span class="slider round"></span>
                                            <input type="hidden" name="pre_billing_checkbox">

                                        </label>
                                        <p class="card-text">Pay before start of the month</p>

                                        <div class="speeding-body"  id="speeding-body" style="display: none">

                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <input type="text" name="pre_amount" class="form-control"
                                                               placeholder="Top up Amount">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">ETB</span>
                                                        </div>
                                                    </div>

                                                    <span class="text-danger">{{ $errors->first('pre_amount') }}</span>

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
                                        <label class="card-title">Post Billing</label>
                                        <label class="switch" style="float: right;">
                                            <input type="checkbox" class="toggle" onclick='handleClick(this,"rides-body");'>
                                            <span class="slider round"></span>
                                            <input type="hidden" name="post_billing_checkbox">

                                        </label>
                                        <p class="card-text">Pay after each month</p>

                                        <div class="rides-body"  id="rides-body" style="display: none">

                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <input type="text" name="post_amount" class="form-control"
                                                               placeholder="Top up amount">
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">ETB</span>
                                                        </div>
                                                    </div>

                                                </div>
                                                <span class="text-danger">{{ $errors->first('post_amount') }}</span>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                                {{-- **Number of rides end**--}}

                                <br>

                                <div class="card speeding">
                                    <div class="card-body">
                                        <label class="card-title">Pay as you go</label>
                                        <label class="switch" style="float: right;">
                                            <input type="checkbox" class="toggle" id="pay_as_you_go_checkbox" onclick='handleClick(this,"pay_as_you_go-body");'>
                                            <span class="slider round"></span>
                                            <input type="hidden" name="pay_as_you_go_checkbox">


                                        </label>
                                        <p class="card-text">Pay after each ride</p>

                                        <div class="rides-body"  id="pay_as_you_go-body" style="display: none">

                                            <div class='form-row row'>
                                                <div class='col-xs-12 form-group required'>
                                                    <label class='control-label'>Email</label> <input
                                                            class='form-control' size='4' id="email" name="email" type='text'>
                                                </div>
                                            </div>

                                            <div class='form-row row'>
                                                <div class='col-xs-12 form-group card required'>
                                                    <label class='control-label'>Card Number</label> <input
                                                            autocomplete='off' name="card_no" id="card-number" class='form-control card-number' size='20'
                                                            type='text'>
                                                </div>
                                            </div>

                                            <div class='form-row row'>
                                                <div class='col-xs-12 col-md-4 form-group cvc required'>
                                                    <label class='control-label'>CVC</label>
                                                    <input autocomplete='off' name="cvc" class='form-control card-cvc' id="card-cvc" placeholder='ex. 311' size='4'
                                                                                                    type='text'>
                                                </div>
                                                <div class='col-xs-12 col-md-4 form-group expiration required'>
                                                    <label class='control-label'>Expiration Month</label> <input
                                                            class='form-control card-expiry-month' name="expiration_month" id="card-exp-month" placeholder='MM' size='2'
                                                            type='text'>
                                                </div>
                                                <div class='col-xs-12 col-md-4 form-group expiration required'>
                                                    <label class='control-label'>Expiration Year</label> <input
                                                            class='form-control card-expiry-year' name="expiration_year" id="card-exp-year" placeholder='YYYY' size='4'
                                                            type='text'>
                                                </div>
                                            </div>

                                            <div class='form-row row'>
                                                <div class='col-md-12 error form-group hide'>
                                                    <div class='alert-danger alert'>Please correct the errors and try
                                                        again.</div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>


{{--                                <div class="card speeding">--}}
{{--                                    <div class="card-body">--}}
{{--                                        <label class="card-title">Pay as you go</label>--}}
{{--                                        <label class="switch" style="float: right;">--}}
{{--                                            <input type="checkbox" class="toggle">--}}
{{--                                            <span class="slider round"></span>--}}
{{--                                            <input type="hidden" name="pay_as_you_go_checkbox">--}}

{{--                                        </label>--}}
{{--                                        <p class="card-text">Pay after each ride</p>--}}

{{--                                    </div>--}}
{{--                                </div>--}}

                                {{-- Ride day and time --}}
                                {{-- **Ride day and time end**--}}

                                <br>
                                <div class="box-footer text-center">
                                    <button type="button" class="btn btn-info" id="submitButton" value="submit">Submit</button>
                                </div>

                                </form></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- Modal -->
@endsection
@push('scripts')
    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>

    <script type="text/javascript">

        $("#submitButton").click(function() {

            if($('#pay_as_you_go_checkbox').prop('checked')){

                var $form = $(".require-validation"),
                    inputSelector = ['input[type=email]', 'input[type=password]',
                        'input[type=text]', 'input[type=file]',
                        'textarea'].join(', '),
                    $inputs = $form.find('.required').find(inputSelector),
                    $errorMessage = $form.find('div.error'),
                    valid = true;
                $errorMessage.addClass('hide');

                $('.has-error').removeClass('has-error');
                $inputs.each(function(i, el) {
                    var $input = $(el);
                    if ($input.val() === '') {
                        $input.parent().addClass('has-error');
                        $errorMessage.removeClass('hide');
                        e.preventDefault();
                    }
                });

                $.ajax({
                    url: "stripe/token",
                    method: "GET",
                    data: {
                        cardNumber: $("#card-number").val(),
                        cardExpMonth: $("#card-exp-month").val(),
                        cardExpYear: $("#card-exp-year").val(),
                        cardCvc: $("#card-cvc").val()
                    },
                    success: function(result) {
                        if (result.error) {
                            $('.error')
                                .removeClass('hide')
                                .find('.alert')
                                .text(result.error);
                        } else {
                            var token = result.token;
                            $form.find('input[type=text]').empty();
                            $form.append("<input type='hidden' name='stripeToken' value='" + token['id'] + "'/>");
                            $form.submit();
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error(textStatus, errorThrown);
                    }
                });

            }
            else{
                var $form = $(".require-validation");
                $form.submit();
            }

        });

    </script>

    <script>
        function handleClick(obj,id){

            obj.classList.toggle("is-open");

            var status=obj.classList.contains('is-open')
            var content=document.getElementById(id);

            if(status==true){
                content.style.display="block";
                $(obj).next().next().val('true');
            }
            else{
                content.style.display="none";
                $(obj).next().next().val('false');
            }
        }
    </script>
    {{--    <link rel="stylesheet" href="{{ url('css/buttons.dataTables.css') }}">--}}
    {{--    <script src="{{ url('js/dataTables.buttons.js') }}"></script>--}}
    {{--    <script src="{{ url('js/buttons.server-side.js') }}"></script>--}}
    {{-- {!! $dataTable->scripts() !!} --}}
@endpush

