@extends('admin.template')

@section('main')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Manage Corporate Billings
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="{{ url(LOGIN_USER_TYPE.'/dashboard') }}"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Manage Corporate Billings</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <!-- <h3 class="box-title">Manage Company</h3> -->
{{--                            @if(Auth::guard('admin')->user()->can('create_corporate'))--}}
{{--                                <div style="float:right;"><a class="btn btn-success" href="{{ url('admin/add_corporate') }}">Add Corporate</a></div>--}}
{{--                            @endif--}}
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body companey-list">
                            {!! $dataTable->table() !!}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
@push('scripts')
    <style type="text/css">
        .company_driver_list {
            width: 300px;
            overflow-wrap: break-word;
        }
    </style>
    <link rel="stylesheet" href="{{ url('css/buttons.dataTables.css') }}">
    <script src="{{ url('js/dataTables.buttons.js') }}"></script>
    <script src="{{ url('js/buttons.server-side.js') }}"></script>
    {!! $dataTable->scripts() !!}
@endpush
