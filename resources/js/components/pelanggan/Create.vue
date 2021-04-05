<template>
    <div class="mt-3">
                    <div class="card-header">TAMBAH PELANGGAN</div>

                    <div class="card-body">

                        <form @submit.prevent="PostStore">

                            <div class="form-group">
                                <label>Kode Pelanggan </label>
                                <input type="text" class="form-control" v-model="post.kodePelanggan" disabled>
                            </div>

                            <div class="form-group">
                                <label>Nama Pelanggan </label>
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
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                                <router-link :to="{ name: 'pelanggan' }" class="btn btn-primary btn-success">KEMBALI</router-link>

                            </div>


                        </form>


                    </div>
                </div>
      
  
  
</template>


<script>
    export default {
        data() {
            return {
                post: {},
                validation: [],
                kodePelanggan: '',
            }
        },
        
        created: function(){
            this.loadKdPelanggan()
            //this.loadUsername()
        },
        methods: {
            loadKdPelanggan:function(){
                let uri = `/api/kodePelanggan/`;
                this.axios.get(uri).then(response => {
                this.post.kodePelanggan = response.data.kodePelanggan;
                
            });
            },
            
            PostStore() {
                let uri = '/api/pelanggan/store';
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({
                            name: 'pelanggan'
                        });
                        //this.loadKdMenu()
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            
        },
        
    }
</script>
