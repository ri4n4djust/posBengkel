<template>
    <div class="mt-3">
        <div class="card-header"><h3>EDIT BARANG</h3></div>
            <div class="card-body">
                <form @submit.prevent="PostUpdate" class="form-horizontal">
                    <div class="col-md-6">
          <!-- general form elements -->
                    <div class="box box-body">
                    
                            
                             <div class="form-group">
                                 <label class="col-sm-3 control-label">Kode Barang</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.kdBarang" disabled >
                                </div>
                             </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Nama Barang</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" v-model="post.nmBarang"
                                        placeholder="Masukkan Title" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Harga Pokok</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" v-model="post.hrgPokok"
                                        placeholder="Harga Pokok" required>
                                      {{kdh}}
                                      <a href="#" @click="letterValue()">klikkkk</a>
                                    <input type="text" class="form-control" v-model="str">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Harga Jual</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" v-model="post.hrgJual"
                                        placeholder="Harga Jual" required>
                                </div>
                            </div>

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Select Kategori:</label>
                            <div class="col-sm-8">
                                <select class='form-control' v-model='post.ktgBarang'>
                                    <option value='0' >Select Kategori</option>
                                    <option v-for='data in countries' :value='data.kodeKtg' :key='data.id'>{{ data.namaKtg }}</option>
                                </select>
                            </div>
                            </div>

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Barcode : </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.barcode">
                                <barcode v-model="post.barcode" :options="{ displayValue: true }"></barcode>
                            </div>
                            </div>

                    </div>
                    </div>
    

      
                <!-- left column -->
                    <div class="col-md-6">
            <!-- general form elements -->
                    <div class="box box-body">

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Stok</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.stkBarang"
                                       placeholder="Stok Barang" disabled>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Satuan</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.satuanBarang" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">QTY Min</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.qtyMin" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">QTY Max</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.qtyMax" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Merek</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.merek" required>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-3 control-label">KONTEN</label>
                                <div class="col-sm-8">
                                <textarea class="form-control" v-model="post.deskripsi" rows="5"
                                          placeholder="Masukkan Konten" required></textarea>
                                </div>
                            </div>
                        
                                         
                    
                    </div>
                    </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">UPDATE </button>
                                <button @click.prevent="PostDeleteTrx(post.id)" class="btn btn-md btn-danger">HAPUS</button>
                                <router-link :to="{ name: 'posts' }" class="btn btn-primary btn-success">KEMBALI</router-link>
                            
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
                selected : '',
                country: 0,
                countries: {},
                kdh: [],
                str: [],
                hrg: [],
                codeHrg: [],

                
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/posts/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
                this.getCountries()
                this.loadKdHarga()
            });
            
        },
        methods: {
            letterValue(){
                //var hr = this.post.hrgPokok;
                var convert = this.post.hrgPokok.split(" ");
                var kdh = [];
                var str = [];
                for (convert of this.post.hrgPokok) {
                    let uri = '/api/setup/'+ convert;
                    this.axios.get(uri).then(response => {
                    this.kdh = response.data.data.codeHrg;
                    
                        console.log(this.kdh)
                        //this.str = kdh ;
                        //return this.kdh;
                    });
                    
                }
                
                
                
            },
            loadKdHarga(){
                let uri = '/api/setup';
                this.axios.get(uri).then(response => {
                this.hrg = response.data.data;
                });
            },
            PostUpdate() {
                let uri = `/api/posts/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'posts'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            getCountries: function(){
                axios.get('/api/kategori')
                    .then(function (response) {
                        this.countries = response.data.data;
                    }.bind(this));
            },
            PostDeleteTrx(id)
            {
            if(confirm("Do you really want to delete?")){
               this.axios.delete(`/api/posts/${id}`)
                    .then(response => {
                        this.$router.push({name: 'posts'});
                        alert('Sukses Hapus' + this.post.nmBarang);
                    }).catch(error => {
                    alert('system error!');
                });
            }
            },
           
        },
       
    }
</script>
