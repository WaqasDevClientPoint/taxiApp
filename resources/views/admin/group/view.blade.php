@extends('admin.template')

@section('main')
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Manage Groups
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="{{ url(LOGIN_USER_TYPE.'/dashboard') }}"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Groups</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <!-- <h3 class="box-title">Manage Riders</h3> -->
                            @if(LOGIN_USER_TYPE=='corporate')
                                <div style="float:right;"><a class="btn btn-success" href="{{ url(LOGIN_USER_TYPE.'/add_group') }}">Add Group</a></div>
                            @endif
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            {!! $dataTable->table() !!}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@push('scripts')
    <link rel="stylesheet" href="{{ url('css/buttons.dataTables.css') }}">
    <script src="{{ url('js/dataTables.buttons.js') }}"></script>
    <script src="{{ url('js/buttons.server-side.js') }}"></script>
    {!! $dataTable->scripts() !!}
@endpush
