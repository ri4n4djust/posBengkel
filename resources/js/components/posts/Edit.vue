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
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" @blur="letterValue()" v-model="post.hrgPokok"
                                        placeholder="Harga Pokok" required>
                                </div>
                                <div class="col-sm-3">     
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
                                <a href="#"  class="btn btn-primary btn-success">Print Barcode</a>
                                <router-link :to="{ name: 'posts' }" class="btn btn-primary btn-success">KEMBALI</router-link>
                            
                            </div>

                    </form>

            </div>

            <div v-for="x in qtys" :key="x">

            </div>
    </div>

</template>

<script>
    export default {

        data() {
            return {
                post: {},
                qtys: '',
                validation: [],
                selected : '',
                country: 0,
                countries: {},
                kdh: [],
                str: [],
                hrg: [],
                codeHrg: [],
                avatar: '',

                
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
                var hr = this.post.hrgPokok.length;
                var a = [];
                //for (var a=1;a<=hr;a++) {
                    var convert = this.post.hrgPokok.split("");
                    const kdh = Object.keys(this.hrg);
                    let len = this.hrg.length;
                for (convert of this.post.hrgPokok.split("")) {
                    var a = a += convert;
                    alert(kdh)
                    
                }
                //console.log(this.hr)
                //}

                
            },
            avatarChange(e) {
            //console.log(e.target.files[0])
            var fileReader = new FileReader()
            fileReader.readAsDataURL(e.target.files[0])
            fileReader.onload = (e) => {
              this.avatar = e.target.result
            }
            //console.log(this.item)
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
