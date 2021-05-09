<template>
    <div class="mt-3">
        <section class="content">
      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">

              <form @submit.prevent="PostUpdate">

                            <div class="form-group">
                                <label>Kode Pelanggan </label>
                                <input type="text" class="form-control" v-model="post.kodePelanggan" disabled>
                            </div>

                            <div class="form-group">
                                <label>Nama </label>
                                <input type="text" class="form-control" v-model="post.namaPelanggan"
                                       placeholder="Masukkan Nama">
                                <div v-if="validation.namaPelanggan">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.namaPelanggan[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Alamat</label>
                                <input type="text" class="form-control" v-model="post.alamatPelanggan"
                                       placeholder="Alamat">
                                <div v-if="validation.alamatPelanggan">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.alamatPelanggan[0] }}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Alamat</label>
                                <input type="text" class="form-control" v-model="post.diskonPelanggan"
                                       placeholder="Diskon">
                            </div>

                            <div class="form-group">
                                <label>No. Tlp</label>
                                <input type="text" class="form-control" v-model="post.noTlp"
                                       placeholder="No Tlp">
                                <div v-if="validation.noTlp">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.noTlp[0] }}
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <router-link :to="{ name: 'pelanggan' }" class="btn btn-primary btn-success">KEMBALI</router-link>
                                <button type="submit" class="btn btn-md btn-success">UPDATE</button>
                                <button type="reset" class="btn btn-md btn-danger">RESET</button>
                            </div>

                        </form>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          
        </div>
        <!-- /.col -->
       
      </div>
      <!-- /.row -->

    </section>




                    
</div>

</template>

<script>
 import VueSingleSelect from "vue-single-select";
    export default {
components: { VueSingleSelect },
        data() {

            return {
                post: {},
                validation: [],
                post1: null,
                komposisis: {},
                users: {},

            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/pelanggan/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            this.loadData()
        },
        watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        props: ['value'],

        mounted () {
            //this.intervalFetchData1();
            //this.intervalFetchData();
            //this.bindings()
            this.loadData()
        },

        methods: {
            PostUpdate() {
                let uri = `/api/pelanggan/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'pelanggan'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadData:function(){
                let uri = '/api/pelanggan';
                this.axios.get(uri).then(response => {
                this.users = response.data.data;
                
                });
            },
            
        }
    }
</script>
