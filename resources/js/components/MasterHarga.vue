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
              
              <div v-for="(post, index) in posts" :key="post.id">
                <form id="form1" @submit.prevent="updateData(index)" >
              <div class="row">
                <div class="col-xs-6">
                  <input type="hidden" class="form-control" v-model="posts[index].id" placeholder="Value">
                  <input type="text" class="form-control" v-model="posts[index].noHrg" placeholder="Value" required>
                </div>
                <div class="col-xs-6">
                  <input type="text" class="form-control" v-model="posts[index].codeHrg"  placeholder="Code" required>
                </div>
              </div>
              </form>
              </div>
                <br>
                <p class="text-muted text-center">
                <button type="submit" @click="updateData()" class="btn btn-primary btn-block">Simpan</button>
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
               posts: [],
               post: [],
               index: '',
            }
        },

       created() {
          //this.get();
          this.loadKdHarga();
        },

        methods: {
          loadKdHarga(){
                let uri = '/api/setup';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                });
            },
          updateData: function(index) {
                
                for (var index of Object.keys(this.posts)) {
                    let uri = '/api/updatesetup';
                    this.axios.post(uri, {
                      id: this.posts[index].id,
                      noHrg: this.posts[index].noHrg, 
                      codeHrg: this.posts[index].codeHrg, 
                      }).then(response => {
                        
                    }).catch(error => {
                        console.log(error.response)
                    });
                }
                this.loadKdHarga();
              alert('Setup Complete')

          },
            
        },
        
    }
</script>

