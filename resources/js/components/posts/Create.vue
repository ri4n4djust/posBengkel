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
                                <input type="text" class="form-control" :value="post.kdBarang" :name="kdBarang" disabled >
                                 </div>
                             </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Nama Barang</label>
                                <div class="col-sm-6">
                                <input type="text" class="form-control" v-model="post.nmBarang"
                                       placeholder="Masukkan Title">
                                <div v-if="validation.nmBarang">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.nmBarang[0] }}
                                    </div>
                                </div>
                                </div>
                            </div>

                            <span v-if="adminuser === 'Admin'">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Harga. Beli</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.hrgPokok"
                                       placeholder="Harga Pokok" @keypress="onlyNumber">
                                <div v-if="validation.hrgPokok">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.hrgPokok[0] }}
                                    </div>
                                </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Harga. Jual</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.hrgJual"
                                       placeholder="Harga Jual" @keypress="onlyNumber">
                                <div v-if="validation.hrgJual">
                                    <div class="alert alert-danger mt-1" role="alert">
                                        {{ validation.hrgJual[0] }}
                                    </div>
                                </div>
                                </div>
                            </div>
                            </span>
                            <span v-else>
                                Harga
                            </span>

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

                            <div class="form-group">
                                <input type="checkbox" id="promo" v-model="checked">
                                <label for="promo">Catalog</label>
                            </div>
                            {{merek}}
                            <div v-if="checked">
                                <!-----Awal Katalog ---->
                                <div class="form-group">
                                <label class="col-sm-3 control-label">Merek:</label>
                                <div class="col-sm-4">
                                <select class='form-control' v-model='kdMerek' required @click="getJenis(kdMerek)">
                                    <option v-for='data in merek' :value='data.kdMerek' :key='data.id'>{{ data.nmMerek }}</option>
                                </select>
                                </div>
                                </div>
                                <div class="form-group">
                                <label class="col-sm-3 control-label">Jenis:</label>
                                <div class="col-sm-4">
                                <select class='form-control' v-model='kdJenis' required @click="getType(kdJenis)">
                                    <option v-for='data in jenis' :value='data.kdJenis' :key='data.id'>{{ data.nmJenis }}</option>
                                </select>
                                </div>
                                </div> 
                                <div class="form-group">
                                <label class="col-sm-3 control-label">Type Motor:</label>
                                <div class="col-sm-4">
                                <select class='form-control' v-model='kdType' required @click="getTahun(kdType)">
                                    <option v-for='data in type' :value='data.kdType' :key='data.id'>{{ data.nmType }}</option>
                                </select>
                                </div>
                                </div>

                                <div class="form-group">
                                <label class="col-sm-3 control-label">Tahun Motor:</label>
                                <div class="col-sm-4">
                                <select class='form-control' v-model='kdTahun' required @click="pilihTahun(kdTahun)">
                                    <option v-for='data in tahun' :value='data.kdTahun' :key='data.id'>{{ data.nmTahun }}</option>
                                </select>
                                </div>
                                </div> 
                                <!------EndKatalog ------>
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
                kdBarang: '',
                //barcode: this.post.kdBarang,
                inputs: [{
                    name: '',
                    party: ''
                }],
                checked: false,
                merek : [],
                kdMerek: '',
                nmMerek: '',
                jenis: [],
                kdJenis: '',
                nmJenis: '',
                type: [],
                kdType: '',
                tahun: [],
                kdTahun: '',
            }
            
        },
        created(){
            this.loadKdBarang();
            this.getCountries();
            this.getMerek();
            this.adminuser = this.$session.get('roleID');
            
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        

        methods: {
            add () {
            this.inputs.push({
                name: '',
                party: ''
            })
            console.log(this.inputs)
            },

            remove (index) {
            this.inputs.splice(index, 1)
            },
            
            CangeKd () {
                this.post.barcode = this.post.kdBarang;
            },

            addCandidate () {
            axios
                .post('/candidates', {
                my_prop_name: JSON.stringify(this.inputs)
                })
                .then(response => {})
                .catch(error => {})
            },
            getMerek(){
                this.axios.get('api/merek')
                .then(response => { 
                this.merek = response.data.data;
                this.nmMerek = this.merek.nmMerek;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            getJenis(kdMerek){
                this.axios.get('api/jenis/'+ kdMerek)
                .then(response => { 
                this.jenis = response.data.data;
                this.nmJenis = this.jenis.nmJenis;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            getType(kdJenis){
                this.axios.get('api/type/'+ kdJenis)
                .then(response => { 
                this.type = response.data.data;
                
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            getTahun(kdType){
                this.axios.get('api/tahun/'+ kdType)
                .then(response => { 
                this.tahun = response.data.data;
                this.dataNama = response.data.nmType;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            pilihTahun(kdTahun){
              //alert(kdTahun);
                //this.kdTahun = kdTahun;
                this.axios.get('api/pilihtahun/'+ kdTahun)
                .then(response => { 
                //this.tahun = response.data.data;
                this.dataTahun = response.data.nmTahun;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            PostStore() {
                let uri = '/api/posts/store';
                this.axios.post(uri, this.post)
                    .then((response) => {
                        const path = '/barang/create'
                        this.$router.push(path)
                        this.loadKdBarang()
                        //this.loadData()
                        document.getElementById("anyName").reset();
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

