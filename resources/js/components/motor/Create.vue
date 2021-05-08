<template>
    <div class="mt-3">
                    <div class="card-header">TAMBAH MOTOR</div>

                    <div class="card-body">

                        <form @submit.prevent="PostStore">

                            <div class="form-group">
                                <label>Kode Motor</label>
                                <input type="text" class="form-control" v-model="post.kdMotor" disabled>
                            </div>

                            <div class="form-group">
                                <label>Plat Motor</label>
                                <input type="text" class="form-control" v-model="post.platMotor"
                                       placeholder="Plat Motor">
                            </div>
                            <div class="form-group">
                                <label>Jenis Motor</label>
                                <input type="text" class="form-control" v-model="post.jenisMotor"
                                       placeholder="Jenis Motor">
                                <input type="text" class="form-control" v-model="post1.kodePelanggan">
                            </div>
                            <div class="form-group">
                                <label>Pemilik Motor</label>
                                <vue-single-select
                                            v-model="post1"
                                            :options="posts"
                                            :required="true"
                                            optionLabel="namaPelanggan"
                                ></vue-single-select>
                            </div>

                            

                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                                <button type="reset" class="btn btn-md btn-danger">RESET</button>
                            </div>


                        </form>


                    </div>
                </div>
      
  
  
</template>


<script>
 import VueSingleSelect from "vue-single-select";
    export default {
        components: {  VueSingleSelect },  
        data() {
            return {
                post: [],
                post1: [],
                posts: [],
                validation: [],
                kdMotor: '',
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created: function(){
            this.loadKodeMtr()
            this.LoadPelanggan()
        },
        methods: {
            PostStore() {
                let uri = '/api/motor/store';
                this.axios.post(uri, {
                    kdMotor: this.post.kdMotor,
                    platMotor: this.post.platMotor,
                    namaMotor: this.post.jenisMotor,
                    pemilikMotor: this.post1.kodePelanggan,
                })
                    .then((response) => {
                        this.$router.push({
                            name: 'motor'
                        });
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadKodeMtr:function(){
                let uri = '/api/kodeMotor/';
                this.axios.get(uri).then(response => {
                this.post.kdMotor = response.data.kodeMtr;
                
            });
            },
            LoadPelanggan() {
              let uri = '/api/pelanggan';
              this.axios.get(uri).then(response => {
                  this.posts = response.data.data;
              });
            },
        }
    }
</script>
