<template>

        <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createKategori' }" class="btn btn-md btn-success">TAMBAH KATEGORI</router-link>
                        </h3>

                            
                           
                            <div class="form-group">
                            <label class="col-sm-3 control-label">Merek:</label>
                            <a href="#" @click="modalTambahMerek = true" class="btn btn-md btn-success">Tambah Merek</a>
                            <div class="col-sm-4">
                            <select class='form-control' v-model='kdMerek' required @change="getJenis(kdMerek)">
                                <option v-for='data in merek' :value='data.kdMerek' :key='data.id'>{{ data.nmMerek }}</option>
                            </select>
                            </div>
                            </div>
                            
                            <div class="form-group">
                            <label class="col-sm-3 control-label">Jenis:</label>
                            <a href="#" @click="modalTambahJenis = true" class="btn btn-md btn-success">Tambah Jenis</a>
                            <div class="col-sm-4">
                            <select class='form-control' v-model='kdJenis' required @change="getType(kdJenis)">
                                <option v-for='data in jenis' :value='data.kdJenis' :key='data.id'>{{ data.nmJenis }}</option>
                            </select>
                            </div>
                            </div> 

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Type Motor:</label>
                            <a href="#" @click="modalTambahType = true" class="btn btn-md btn-success">Tambah Type</a>
                            <div class="col-sm-4">
                            <select class='form-control' v-model='kdType' required @change="getTahun(kdType)">
                                <option v-for='data in type' :value='data.kdType' :key='data.id'>{{ data.nmType }}</option>
                            </select>
                            </div>
                            </div>

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Tahun Motor:</label>
                            <a href="#" @click="modalTambahMerek = true" class="btn btn-md btn-success">Tambah Tahun</a>
                            <div class="col-sm-4">
                            <select class='form-control' v-model='kdTahun' required>
                                <option v-for='data in tahun' :value='data.kdTahun' :key='data.id'>{{ data.nmTahun }}</option>
                            </select>
                            </div>
                            </div> 

                            <div class="form-group">
                            <div class="col-sm-8">
                            <button type="submit" @click="PostCari(newKode= kdMerek + kdJenis +kdType + kdTahun)" class="btn btn-md btn-success">Cari</button>
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
                                    <td>{{ det.gbrDetail }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editKategori', params: { id: det.id }}" class="btn btn-sm btn-primary">Detail</router-link>
                                        <router-link :to="{name: 'editKategori', params: { id: det.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="PostDelete(det.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                        
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
                            <div class="form-group">
                                <label>Kode Merek </label>
                                <input type="text" class="form-control" v-model="insert.kdMerek" disabled>
                            </div>
                            <div class="form-group">
                                <label>Nama Merek</label>
                                <input type="text" class="form-control" v-model="insert.nmMerek"
                                       placeholder="Masukkan No" required>
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
                            <div class="form-group">
                                <label>Nama Jenis</label>
                                <input type="text" class="form-control" v-model="insert.nmJenis"
                                       placeholder="Masukkan No" required>
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
                insert: {},
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
            //this.getJenis()
        },
        computed: {
            //newKode: function () {
            //return newKode = kdMerek + kdJenis + kdType + kdTahun
            //}
        },
        mounted(){
            //this.getCategories()
        },
        methods: {
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
            PostStoreMerek() {
                let uri = '/api/merek/create';
                this.axios.post(uri, this.insert)
                    .then((response) => {
                        //this.$router.push({ name: 'pelanggan' });
                        this.getMerek();
                        //this.loadKdLift();
                        this.modalTambahMerek = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
           
        }
    }
</script>