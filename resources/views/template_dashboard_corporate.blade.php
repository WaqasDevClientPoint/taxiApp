@include('common.head')
@include('common.dashboard_header')

<main id="main">
@include('common.dashboard_side_menu_corporate')
@yield('main')
</main>


@include('common.footer')
@include('common.foot')