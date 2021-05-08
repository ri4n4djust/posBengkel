<template>
    <div class="mt-3">
                    <div class="card-header">TAMBAH MOTOR</div>

                    <div class="card-body">

                        <form @submit.prevent="PostStore">

                            <div class="form-group">
                                <label>Kode Motor</label>
                                <input type="text" class="form-control" v-model="post.kodeMtr" disabled>
                            </div>

                            <div class="form-group">
                                <label>Plat Motor</label>
                                <input type="text" class="form-control" v-model="post.platMotor"
                                       placeholder="Plat Motor">
                            </div>
                            <div class="form-group">
                                <label>Jenis Motor</label>
                                <input type="text" class="form-control" v-model="post.namaMotor"
                                       placeholder="Jenis Motor">
                            </div>
                            <div class="form-group">
                                <label>Pemilik Motor</label>
                                <input type="text" class="form-control" v-model="post.pemilikMotor"
                                       placeholder="Pemilik Motor">
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
                kodeMtr: '',
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
                let uri = '/api/motor/store';
                this.axios.post(uri, this.post)
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
                this.post.kodeMtr = response.data.kodeMtr;
                
            });
            },
        }
    }
</script>
