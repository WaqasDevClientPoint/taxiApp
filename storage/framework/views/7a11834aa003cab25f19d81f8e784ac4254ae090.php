<title>Group</title>

<?php $__env->startSection('main'); ?>
    <h1>Hello group</h1>
    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 flexbox__item page-content" style="padding:0px;" ng-controller="trip" ng-cloak>
        <input type="hidden" name="user_id" value="<?php echo e(@Auth::user()->id); ?>" id="user_id">
        <div class="hidden--palm">
            <div class="page-lead text-left">
                <div class="flexbox displayflex">
                    <div class="flexbox__item col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <h1 class="cls_profiletitle">
                            Group
                         </h1>
                    </div>
                   
                    <div class="flexbox__item col-lg-6 col-md-6 col-sm-6 col-xs-12 text--right">
                        <button type="button" data-toggle="modal" data-target="#exampleModalCenter" class="btn btn--primary btn-blue doc-button trip-filter__origin-link collapsed hide-sm-760"><span class="icon icon_plus color--dark soft-half--right"></span>
                            Filter Rides    
                        </button>
                    </div>
                </div>
            </div>

        </div>
        
      
       
    </div>
  
    </main>

   <!-- Modal -->
   <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Add Group</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          </button>
        </div>
        <div class="modal-body">
            <form>
                <div class="form-group">
                  <label for="exampleFormControlInput1">Email address</label>
                  <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                </div>
                <div class="form-group">
                  <label for="exampleFormControlSelect1">Example select</label>
                  <select class="form-control" id="exampleFormControlSelect1">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="exampleFormControlSelect2">Example multiple select</label>
                  <select multiple class="form-control" id="exampleFormControlSelect2">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="exampleFormControlTextarea1">Example textarea</label>
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
              </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>

    <script>
      
        

    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('template_dashboard_corporate', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\taxiApp\resources\views/dashboard/group.blade.php ENDPATH**/ ?>