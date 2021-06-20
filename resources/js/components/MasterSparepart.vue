<template>
    <div class="mt-3">
<section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Penjualan</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

               
               
                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">Type&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span>
                      <select class='form-control' v-model='typePenjualan' required>
                          <option  value='1'>Cash</option>
                          <option value='2' >Kredit</option>
                        </select>
                  </div>
                  
                  <p>
                  <div class="input-group">
                    <span class="input-group-addon">Total Barang.</span>
                    <input type="text" class="form-control" :value="subtotals" >
                  </div>
                  <p>
                  <div class="input-group">
                    <span class="input-group-addon">Total Jasa.&nbsp; &nbsp; &nbsp; </span>
                    <input type="text" class="form-control" :value="subtotalJasa" :name="subtotalJasa" >
                  </div>                  
                
               
                <p class="text-muted text-center">
                <a href="#"  class="btn btn-primary btn-block"><b>Cari</b></a>
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
                    <h3 class="box-title">Detail Penjualan</h3>
                   
                    </div>
                    <div class="box-body">
                      <div class="row">

                        
                      </div>
                    </div>

                  

                    <div class="box-body">
                 
                  box body

                    </div>

                    
                    
                    
                    <!-- /.box-body -->
                   </div>
                   
                <!-- /.box -->
                            
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>

 <!-- /Modal -->
 


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

