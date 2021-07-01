<template>

        <div class="card-body">
          <h3>DETAIL MOTOR</h3>
          <shoping-cart></shoping-cart>
                           
                            <div class="form-group">
                            <label class="col-sm-3 control-label">Merek:</label>
                            <a href="#" @click="modalTambahMerek = true" class="btn btn-md btn-success">Tambah Merek</a>
                            <div class="col-sm-4">
                            <select class='form-control' v-model='kdMerek' required @click="getJenis(kdMerek)">
                                <option v-for='data in merek' :value='data.kdMerek' :key='data.id'>{{ data.nmMerek }}</option>
                            </select>
                            </div>
                            </div>
                            
                            <div class="form-group">
                            <label class="col-sm-3 control-label">Jenis:</label>
                            <a href="#" @click="modalTambahJenis = true" class="btn btn-md btn-success">Tambah Jenis&nbsp;&nbsp;</a>
                            <div class="col-sm-4">
                            <select class='form-control' v-model='kdJenis' required @click="getType(kdJenis)">
                                <option v-for='data in jenis' :value='data.kdJenis' :key='data.id'>{{ data.nmJenis }}</option>
                            </select>
                            </div>
                            </div> 

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Type Motor:</label>
                            <a href="#" @click="modalTambahType = true" class="btn btn-md btn-success">Tambah Type&nbsp;&nbsp;</a>
                            <div class="col-sm-4">
                            <select class='form-control' v-model='kdType' required @click="getTahun(kdType)">
                                <option v-for='data in type' :value='data.kdType' :key='data.id'>{{ data.nmType }}</option>
                            </select>
                            </div>
                            </div>

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Tahun Motor:</label>
                            <a href="#" @click="modalTambahTahun = true" class="btn btn-md btn-success">Tambah Tahun</a>
                            <div class="col-sm-4">
                            <select class='form-control' v-model='kdTahun' required @click="pilihTahun(kdTahun)">
                                <option v-for='data in tahun' :value='data.kdTahun' :key='data.id'>{{ data.nmTahun }}</option>
                            </select>
                            </div>
                            </div> 

                            <div class="form-group">
                            <div class="col-sm-8">
                            <button type="submit" @click="PostCari(newKode= kdMerek + kdJenis +kdType + kdTahun)" class="btn btn-md btn-success">Cari</button>
                            <span v-if="newKode= kdMerek + kdJenis +kdType + kdTahun.length <= 22 ">
                                <button type="submit"  class="btn btn-md btn-success disabled">Tambah Motor</button>
                            </span>
                            <span v-else>
                                <button type="submit" @click="modalTambahMotor = true" class="btn btn-md btn-success">Tambah Motor</button>
                            </span>
                            </div>
                            </div>
                            

        <div class="card-body">
        
        <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Type </th>
                                    <th>Tahun</th>
                                    <th>Nama</th>
                                    <th>Warna</th>
                                    <th>Gambar</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(det, index) in detailmotor" :key="det.id">
                                    <td>{{ det.kdType }}</td>
                                    <td>{{ det.kdTahun }}</td>
                                    <td>{{ det.nmDetail }}</td>
                                    <td>{{ det.warnaDetail }}</td>
                                    <td><img :src="`../image/foto/${det.gbrDetail}`" class="img-responsive" height="70" width="90"></td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'mastersdetailparepart', params: { id: det.kdDetailMotor }}" class="btn btn-sm btn-primary">Detail</router-link>
                                        <button @click.prevent="PostDeleteMotor(id = det.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                        
                                    </td>
                                </tr>
                                </tbody>
                            </table>

<!-- /ModalTambah -->
 <div v-if="modalTambahMerek">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalTambahMerek=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Tambah Merek</h4>
              </div>
              <div class="modal-body">
                
                        <form @submit.prevent="PostStoreMerek">
                            <div class="input-group">
                                <span class="input-group-addon">Kode Merek &nbsp;</span>
                                <input type="text" class="form-control" v-model="insert.kdMerek" disabled>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">Nama Merek</span>
                                <input type="text" class="form-control" v-model="insert.nmMerek"
                                       placeholder="Masukkan Nama" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                            </div>
                        </form>


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!-- /ModalTambah -->
  <!-- /ModalTambah -->
 <div v-if="modalTambahJenis">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalTambahJenis=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Tambah Jenis Motor</h4>
              </div>
              <div class="modal-body">
                
                        <form @submit.prevent="PostStoreJenis">
                            <div class="form-group">
                            <label >Merek:</label>
                            <select class='form-control' v-model='insert.kdMerek' required >
                                <option v-for='data in merek' :value='data.kdMerek' :key='data.id'>{{ data.nmMerek }}</option>
                            </select>
                            </div>
                            <div class="form-group">
                                <label>Kode Jenis </label>
                                <input type="text" class="form-control" v-model="insert.kdJenis" disabled>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Nama Jenis</span>
                                <input type="text" class="form-control" v-model="insert.nmJenis"
                                       placeholder="Masukkan Nama Jenis" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                            </div>
                        </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!-- /ModalTambah -->
  <!-- /ModalTambah -->
 <div v-if="modalTambahType">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalTambahType=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Tambah Type Motor</h4>
              </div>
              <div class="modal-body">
                
                        <form @submit.prevent="PostStoreType">
                            <div class="form-group">
                            <label >Merek:</label>
                            <select class='form-control' v-model='insert.kdMerek' required @click="getJenis(kdMerek = insert.kdMerek)">
                                <option v-for='data in merek' :value='data.kdMerek' :key='data.id'>{{ data.nmMerek }}</option>
                            </select>
                            </div>
                            <div class="form-group">
                            <label >Jenis:</label>
                            <select class='form-control' v-model='insert.kdJenis' required >
                                <option v-for='data in jenis' :value='data.kdJenis' :key='data.id'>{{ data.nmJenis }}</option>
                            </select>
                            </div>
                            <div class="form-group">
                                <label>Kode Type </label>
                                <input type="text" class="form-control" v-model="insert.kdType" disabled>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Nama Type</span>
                                <input type="text" class="form-control" v-model="insert.nmType"
                                       placeholder="Masukkan Nama Type" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                            </div>
                        </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!-- /ModalTambah -->
  <!-- /ModalTambah -->
 <div v-if="modalTambahTahun">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalTambahTahun=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Tambah Tahun Motor</h4>
              </div>
              <div class="modal-body">
                
                        <form @submit.prevent="PostStoreTahun">
                            <div class="form-group">
                            <label >Merek:</label>
                            <select class='form-control' v-model='insert.kdMerek' required @click="getJenis(kdMerek = insert.kdMerek)">
                                <option v-for='data in merek' :value='data.kdMerek' :key='data.id'>{{ data.nmMerek }}</option>
                            </select>
                            </div>
                            <div class="form-group">
                            <label >Jenis:</label>
                            <select class='form-control' v-model='insert.kdJenis' required @click="getType(kdJenis = insert.kdJenis)" >
                                <option v-for='data in jenis' :value='data.kdJenis' :key='data.id'>{{ data.nmJenis }}</option>
                            </select>
                            </div>
                            <div class="form-group">
                            <label>Type Motor:</label>
                            <select class='form-control' v-model='insert.kdType' required @click="getTahun(kdType = insert.kdType)">
                                <option v-for='data in type' :value='data.kdType' :key='data.id'>{{ data.nmType }}</option>
                            </select>
                            </div>
                            <div class="form-group">
                                <label>Kode Tahun </label>
                                <input type="text" class="form-control" v-model="insert.kdTahun" disabled>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Tahun</span>
                                <input type="text" class="form-control" v-model="insert.nmTahun"
                                       placeholder="Masukkan Nama Type" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                            </div>
                        </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!-- /ModalTambah -->
  <!-- /ModalTambah -->
 <div v-if="modalTambahMotor">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalTambahMotor=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Tambah Motor</h4>
              </div>
              <div class="modal-body">
                
                        <form @submit.prevent="PostStoreMotor" enctype="multipart/form-data" >
                            <div class="form-group">
                                <input type="text" class="form-control" :value="kdMerek + kdJenis +kdType + kdTahun" :name="kodeDetMotor" disabled>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Kode</span>
                                <input type="text" class="form-control" v-model="insert.kdDetailMotor"
                                       placeholder="Masukkan Nama Type" required>
                                <input type="text" class="form-control" v-model="dataTahun.nmTahun" required>
                                <input type="text" class="form-control" v-model="dataNama.nmType" required>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">Nama</span>
                                <input type="text" class="form-control" v-model="nmMotor"
                                       placeholder="Masukkan Nama Type" required>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">Warna</span>
                                <input type="text" class="form-control" v-model="warnaMotor" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Gambar</label>
                                <div class="col-sm-8">
                                <input type="file" v-on:change="onImageChange" class="form-control">
                                <div class="col-md-3" v-if="image">
                                  <img :src="image" class="img-responsive" height="70" width="90">
                              </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                            </div>
                        </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!-- /ModalTambah -->
        
        </div>
                        


                        
    </div>

                

</template>

<script>
    export default {

        data() {
            return {
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
                newKode: '',
                detailmotor: [],
                modalTambahMerek: false,
                modalTambahJenis: false,
                modalTambahType: false,
                modalTambahTahun: false,
                modalTambahMotor: false,
                insert: {},
                kodeDetMotor: '',
                dataNama: '',
                dataTahun: '',
                nmMotor: '',
                warnaMotor: '',
                image: '',
                gamb: '@/image/foto/',
                
                
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            this.getMerek();
            this.loadKdMerek();
            this.loadKdJenis();
            this.loadKdType();
            this.loadKdTahun();
            this.loadKdDetMotor();
        },
        computed: {
            //newKode: function () {
            //return this.newKode = this.kdMerek + this.kdJenis + this.kdType + this.kdTahun
            //}
        },
        mounted(){
            //this.getCategories()
        },
        methods: {
            onImageChange(e) {
                let files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                this.createImage(files[0]);
            },
            createImage(file) {
                let reader = new FileReader();
                let vm = this;
                reader.onload = (e) => {
                    vm.image = e.target.result;
                };
                reader.readAsDataURL(file);
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
            PostCari(newKode){

               let uri = '/api/detailmotor/'+ newKode;
                this.axios.get(uri)
                    .then((response) => {
                        this.detailmotor = response.data.data;
                        //this.gamb = '@/image/foto/'+ this.detailmotor.gbrDetail;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            loadKdMerek:function(){
                let uri = `/api/kodemerek/`;
                this.axios.get(uri).then(response => {
                this.insert.kdMerek = response.data.kdMerek;
                
            });
            },
            loadKdJenis:function(){
                let uri = `/api/kodejenis/`;
                this.axios.get(uri).then(response => {
                this.insert.kdJenis = response.data.kdJenis;
                
            });
            },
            loadKdType:function(){
                let uri = `/api/kodetype/`;
                this.axios.get(uri).then(response => {
                this.insert.kdType = response.data.kdType;
                
            });
            },
            loadKdTahun:function(){
                let uri = `/api/kodetahun/`;
                this.axios.get(uri).then(response => {
                this.insert.kdTahun = response.data.kdTahun;
                
            });
            },
            loadKdDetMotor:function(){
                let uri = `/api/kodedetmotor/`;
                this.axios.get(uri).then(response => {
                this.insert.kdDetailMotor = response.data.kdDetailMotor;
                
            });
            },
            PostStoreMerek() {
                let uri = '/api/merek/create';
                this.axios.post(uri, this.insert)
                    .then((response) => {
                        //this.$router.push({ name: 'pelanggan' });
                        this.getMerek();
                        this.loadKdMerek();
                        this.loadKdJenis();
                        this.loadKdType();
                        this.loadKdTahun();
                        this.loadKdDetMotor();
                        this.modalTambahMerek = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            PostStoreJenis() {
                let uri = '/api/jenis/create';
                this.axios.post(uri, this.insert)
                    .then((response) => {
                        //this.$router.push({ name: 'pelanggan' });
                        this.getMerek();
                        this.getJenis();
                        this.loadKdMerek();
                        this.loadKdJenis();
                        this.loadKdType();
                        this.loadKdTahun();
                        this.modalTambahJenis = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            PostStoreType() {
                let uri = '/api/type/create';
                this.axios.post(uri, this.insert)
                    .then((response) => {
                        //this.$router.push({ name: 'pelanggan' });
                        this.getMerek();
                        this.getJenis();
                        this.getType();
                        this.loadKdMerek();
                        this.loadKdJenis();
                        this.loadKdType();
                        this.loadKdTahun();
                        this.modalTambahType = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },

            PostStoreTahun() {
                let uri = '/api/tahun/create';
                this.axios.post(uri, this.insert)
                    .then((response) => {
                        //this.$router.push({ name: 'pelanggan' });
                        this.getMerek();
                        this.getJenis();
                        this.getType();
                        this.getTahun();
                        this.loadKdMerek();
                        this.loadKdJenis();
                        this.loadKdType();
                        this.loadKdTahun();
                        this.modalTambahTahun = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },

            PostStoreMotor() {
                var newKode = this.kdMerek + this.kdJenis + this.kdType + this.kdTahun;
                //alert(this.image)
                let uri = '/api/motor/create';
                this.axios.post(uri, {
                      newKode : newKode,
                      kdDetailMotor: this.insert.kdDetailMotor,
                      tahun: this.dataTahun.nmTahun,
                      nama: this.dataNama.nmType,
                      nmDetail: this.nmMotor,
                      warnaDetail: this.warnaMotor,
                      image: this.image,
                  }).then((response) => {
                      this.loadKdDetMotor();
                       this.nmMotor = '';
                       this.warnaMotor = '';
                        this.modalTambahMotor = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },

            PostDeleteMotor(id, index)
            {
            if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/motor/${id}`)
                    .then(response => {
                        this.detailmotor.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            }
            }
           
        }
    }
</script>