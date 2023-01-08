
<?php $__env->startSection('main'); ?>
    <div class="content-wrapper" ng-controller="destination_admin">
        <section class="content-header">
            <h1> Edit Rider </h1>
            <ol class="breadcrumb">
                <li><a href="<?php echo e(url(LOGIN_USER_TYPE.'/dashboard')); ?>"><i class="fa fa-dashboard"></i> Home </a></li>
                <li><a href="<?php echo e(url(LOGIN_USER_TYPE.'/group')); ?>"> Groups </a></li>
                <li class="active"> Edit </li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Edit Rider Form</h3>
                        </div>
                        <?php echo Form::open(['url' => 'corporate/edit_group/'.$result->id, 'class' => 'form-horizontal']); ?>

                        <div class="box-body">
                            <span class="text-danger">(*)Fields are Mandatory</span>
                            <div class="form-group">
                                <label for="input_first_name" class="col-sm-3 control-label">Name<em class="text-danger">*</em></label>
                                <div class="col-md-7 col-sm-offset-1">
                                    <?php echo Form::text('first_name', $result->name, ['class' => 'form-control', 'id' => 'input_first_name', 'placeholder' => 'Group Name']); ?>

                                    <span class="text-danger"><?php echo e($errors->first('name')); ?></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_first_name" class="col-sm-3 control-label">Description<em class="text-danger">*</em></label>
                                <div class="col-md-7 col-sm-offset-1">
                                    <?php echo Form::textarea('description', $result->description, ['class' => 'form-control', 'id' => 'input_description', 'placeholder' => 'Group Description']); ?>

                                    <span class="text-danger"><?php echo e($errors->first('description')); ?></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="input_first_name" class="col-sm-3 control-label">Policy<em class="text-danger">*</em></label>
                                <div class="col-md-7 col-sm-offset-1">
                                    <select class ='form-control' id = 'policy' name='policy' >
                                        <option value="">Select Policy</option>
                                        <option value="1" selected>Managers</option>
                                        <option value="2">Workers</option>

                                    </select>
                                    <span class="text-danger"><?php echo e($errors->first('policy')); ?></span>
                                </div>
                            </div>
                            <?php echo Form::hidden('corporate_id', auth('corporate')->id(), array('id'=>'corporate_id')); ?>


                        </div>

                        <div class="box-footer text-center">
                            <button type="submit" class="btn btn-info" name="submit" value="submit">Submit</button>
                            <button type="submit" class="btn btn-default" name="cancel" value="cancel">Cancel</button>
                        </div>
                        <?php echo Form::close(); ?>

                    </div>
                </div>
            </div>
        </section>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.template', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xamp\htdocs\pool\taxiApp\resources\views/admin/group/edit.blade.php ENDPATH**/ ?>