<template>
    <div class="mt-3">
      <div class="card-header">TAMBAH BARANG</div>
        <div class="card-body">
        
        <form  @submit.prevent="PostStore" id="anyName" class="form-horizontal">
        <!-- left column -->
            <div class="col-md-6">
          <!-- general form elements -->
                <div class="box-body">
                            
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
                                       placeholder="Masukkan Title">
                                <div v-if="validation.nmBarang">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.nmBarang[0] }}
                                    </div>
                                </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Harga. Beli</label>
                                <div class="col-sm-5">
                                <input type="text" class="form-control" v-model="post.hrgPokok"
                                       placeholder="Harga Pokok" @keypress="onlyNumber" @blur="letterValue()">
                                </div>
                                <div class="col-sm-3">
                                <input type="text" class="form-control" v-model="cPokok">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Harga. Jual</label>
                                <div class="col-sm-5">
                                <input type="text" class="form-control" v-model="post.hrgJual"
                                       placeholder="Harga Jual" @keypress="onlyNumber" @blur="codeJual()">
                                </div>
                                <div class="col-sm-3">
                                <input type="text" class="form-control" v-model="cJual">
                                </div>
                            </div>
                            <div class="form-group">
                            <label class="col-sm-3 control-label">Kategori:</label>
                            <div class="col-sm-8">
                            <select class='form-control' v-model='post.ktgBarang' required>
                                <option v-for='data in countries' :value='data.kodeKtg' :key='data.id'>{{ data.namaKtg }}</option>
                            </select>
                            </div>
                            </div> 

                            <div class="form-group">   
                                <label class="col-sm-3 control-label">Bacode</label>
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
                <div class="box-body">


                                <div class="form-group" >
                                    <label class="col-sm-3 control-label">Satuan</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" v-model="post.satuanBarang" placeholder="Satuan">
                                    </div>
                                </div>
                                
            

                            <div class="form-group">
                                <label class="col-sm-3 control-label">QTY Min</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.qtyMin">
                                <div v-if="validation.qtyMin" @keypress="onlyNumber">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.qtyMin[0] }}
                                    </div>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">QTY Max</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.qtyMax">
                                <div v-if="validation.qtyMax" @keypress="onlyNumber">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.qtyMax[0] }}
                                    </div>
                                </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Merek</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.merek">
                                <div v-if="validation.merek">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.merek[0] }}
                                    </div>
                                </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-3 control-label">KONTEN</label>
                                <div class="col-sm-8">
                                <textarea class="form-control" v-model="post.deskripsi" rows="5"
                                          placeholder="Masukkan Konten"></textarea>
                                <div v-if="validation.deskripsi">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.deskripsi[0] }}
                                    </div>
                                </div>
                                </div>
                            </div>


                              <div class="form-group">
                                <button type="submit"  class="btn btn-md btn-success">SIMPAN</button>
                                <router-link :to="{ name: 'posts' }" class="btn btn-primary btn-success">KEMBALI</router-link>
                            </div>

                        
                                         
                    
                </div>
            </div>
         </form>
    
   </div>

</div>
      
  
  
</template>


<script>
import Vue from 'vue';
import VueBarcode from '@chenfengyuan/vue-barcode';
Vue.component(VueBarcode.name, VueBarcode);
    export default {
        data() {
            return {
                post: {},
                kodes: {},
                validation: [],
                country: 0,
                countries: {},
                total: {},
                cPokok: '',
                cJual: '',
                kdh: [],
                hrg: [],
            }
            
        },
        created(){
            this.loadKdBarang();
            this.getCountries();
            this.adminuser = this.$session.get('roleID');
            this.loadKdHarga();
            
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        

        methods: {
            letterValue(){
                    var a = '';
                    let kdh = this.hrg;
                for (convert of this.post.hrgPokok.split("")) {
                    var convert;
                    var cc = kdh.find(o => o.noHrg === parseInt(convert));
                    var b = cc.codeHrg ;
                    var cd = a += b ;
                }
                return this.cPokok = cd ;
            },
            codeJual(){
                    var a = '';
                    let kdh = this.hrg;
                for (convert of this.post.hrgJual.split("")) {
                    var convert;
                    var cc = kdh.find(o => o.noHrg === parseInt(convert));
                    var b = cc.codeHrg ;
                    var cd = a += b ;
                }
                return this.cJual = cd ;
            },
            loadKdHarga(){
                let uri = '/api/setup';
                this.axios.get(uri).then(response => {
                this.hrg = response.data.data;
                });
            },
            PostStore() {
                let uri = '/api/posts/store';
                this.axios.post(uri, {
                    kdBarang: this.post.kdBarang,
                    nmBarang: this.post.nmBarang,
                    hrgPokok: this.post.hrgPokok,
                    hrgJual: this.post.hrgJual,
                    ktgBarang: this.post.ktgBarang,
                    barcode: this.post.barcode,
                    satuanBarang: this.post.satuanBarang,
                    qtyMin: this.post.qtyMin,
                    qtyMax: this.post.qtyMax,
                    merek: this.post.merek,
                    deskripsi: this.post.deskripsi,
                    cPokok: this.cPokok,
                    cJual: this.cJual,
                }).then((response) => {
                        const path = '/barang'
                        this.$router.push(path)
                        this.loadKdBarang()
                        //this.post = '',
                        //document.getElementById("anyName").reset();
                        alert('sukses Tambah Barang')
                        
                    }).catch(error => {
                    this.validation = error.response.data.data;
                    //this.post.kdBarang;
                });
            },
            PostDelete(id, index)
            {
                this.axios.delete(`/api/posts/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            },
            
            resetForm() {
                // this.$refs.formTambah.reset()
                //document.getElementById('nmBarang').value = ''
                document.getElementById("anyName").reset();
                alert('reset donkkkkkkkk');
                //this.$refs.formTambah.reset()
            },
            getCountries: function(){
                axios.get('/api/kategori')
                    .then(function (response) {
                        this.countries = response.data.data;
                    }.bind(this));
            },
            onlyNumber ($event) {
                //console.log($event.keyCode); //keyCodes value
                let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                    $event.preventDefault();
                }   
            },
            loadKdBarang:function(){
                let uri = `/api/kodeBarang/`;
                this.axios.get(uri).then(response => {
                this.post.kdBarang = response.data.kdBarang;
                
            });
            },
            
        },
   
        
        }
    
</script>

