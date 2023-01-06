<?php $__env->startSection('main'); ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
     <?php echo e($main_title); ?>

    <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo e(url(LOGIN_USER_TYPE.'/dashboard')); ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Wallet</li>
    </ol>
  </section>
  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
            <!-- <h3 class="box-title"> <?php echo e($sub_title); ?> </h3> -->
            <div style="float:right;"><a class="btn btn-success" href="<?php echo e(route('add_wallet',['user_type' => $user_type])); ?>">Add Wallet </a></div>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <?php echo $dataTable->table(); ?>

          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
  <script src="<?php echo e(url('admin_assets/plugins/datatables/jquery.dataTables.min.js')); ?>"></script>
  <script src="<?php echo e(url('admin_assets/plugins/datatables/dataTables.bootstrap.min.js')); ?>"></script>
  <link rel="stylesheet" href="<?php echo e(url('css/buttons.dataTables.css')); ?>">
  <script src="<?php echo e(url('js/dataTables.buttons.js')); ?>"></script>
  <script src="<?php echo e(url('js/buttons.server-side.js')); ?>"></script>
  <?php echo $dataTable->scripts(); ?>

<?php $__env->stopPush(); ?>
<?php echo $__env->make('admin.template', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xamp\htdocs\taxiApp\resources\views/admin/wallet/index.blade.php ENDPATH**/ ?>