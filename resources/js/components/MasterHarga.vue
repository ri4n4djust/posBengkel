<template>
    <div class="mt-3">

        <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Setting Harga</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

                <div class="input-group">
                    <span class="input-group-addon">1</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">2</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">3</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">4</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">5</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">6</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">7</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">8</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">9</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon">0</span>
                    <input type="text" class="form-control" placeholder="Username">
                  </div>
                
                <p class="text-muted text-center">
                <a href="#" @click="showModalBayar = true" class="btn btn-primary btn-block"><b>Payment</b></a>
                </p>
              
            </div>
            <!-- /.box-body -->

          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          

                <div class="box box-danger">
                    <div class="box-header with-border">
                    <h3 class="box-title">Detail Harga Setting</h3>
                    </div>
                    <div class="box-body">

  
                    </div>
                    
                    <!-- /.box-body -->
                   </div>
                   
                <!-- /.box -->
                

                <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
              
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>

 

    
    </div>

      
  
  
</template>

<script>
  export default {
        data() {
            return {
               
            }
        },

       created() {
          //this.get();
        },

        methods: {
            
        },
        
    }
</script>

