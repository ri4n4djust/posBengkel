<template>
    <div class="mt-3">
                    <div class="card-header">TAMBAH KATEGORI</div>

                    <div class="card-body">

                        <form @submit.prevent="PostStore">

                            <div class="form-group">
                                <label>Kode Kategori</label>
                                <input type="text" class="form-control" v-model="post.kodeKtg" disabled>
                            </div>

                            <div class="form-group">
                                <label>Nama Kategori</label>
                                <input type="text" class="form-control" v-model="post.namaKtg"
                                       placeholder="Nama Kategori">
                                <div v-if="validation.namaKtg">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.namaKtg[0] }}
                                    </div>
                                </div>
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
    export default {
        data() {
            return {
                post: {},
                validation: [],
                kodeKtg: '',
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created: function(){
            this.loadKodeKtg()
        },
        methods: {
            PostStore() {
                let uri = '/api/kategori/store';
                this.axios.post(uri, 
                {
                    kodeKtg: this.post.kodeKtg,
                    namaKtg: this.post.namaKtg,
                })
                    .then((response) => {
                        this.$router.push({
                            name: 'kategori'
                        });
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadKodeKtg:function(){
                let uri = '/api/kodeKategori/';
                this.axios.get(uri).then(response => {
                this.post.kodeKtg = response.data.kodeKtg;
                
            });
            },
        }
    }
</script>
