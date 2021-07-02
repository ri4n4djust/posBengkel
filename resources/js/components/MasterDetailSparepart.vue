<template>

<div class="card-body">
    <!-- SELECT2 EXAMPLE -->
        <shoping-cart></shoping-cart>
        <!-- /.box-header -->
        <div class="box-body">
        <h3 class="box-title">DETAIL SPARE PART MOTOR</h3>
          <div class="row">
            <div class="col-md-6">
               {{post.nmDetail}} 
               {{post.warnaDetail}} 
                <button @click="modalTambahSp = true" class="btn btn-md btn-primary">TAMBAH KATEGORI SPARE PART</button>
                <router-link :to="{name: 'mastersparepart'}" class="btn btn-md btn-primary">MENU UTAMA</router-link>
               
            </div>
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->

      <!-- /.box -->  
                        <div v-for="(det, index) in listkatsp" :key="det.id" class="col-lg-3 col-xs-8" >
                                            <!-- small box -->
                            <div>
                                <div class="small-box bg-green">
                                    <div class="inner">
                                    
                                    <h4 class="box-title">{{ det.nmKatSp }} </h4>
                                    <button @click.prevent="PostDeleteKatSp(id = det.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                        <router-link :to="{name: 'mastersdetailpart', params: { id: det.kdKatSp }}" class="btn btn-sm btn-primary">
                                            <img :src="`../image/foto/katsp/${det.gbrKatSp}`" class="img-responsive">
                                        </router-link>
                                    </div>
                                    <div class="icon">
                                    </div>
                                </div>
                            </div>
                        </div>   

        <div class="card-body">
        

<!-- /ModalTambah -->
 <div v-if="modalTambahSp">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalTambahSp=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Tambah Kat SP</h4>
              </div>
              <div class="modal-body">
                
                        <form @submit.prevent="PostStoreKatSp">
                            <input type="text" class="form-control" v-model="post.kdDetail" disabled>
                            <input type="text" class="form-control" v-model="post.kdDetailMotor" disabled>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">Kode &nbsp;</span>
                                <input type="text" class="form-control" v-model="insert.kdKatSp" disabled>
                            </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">Nama Kategori Saprepart</span>
                                <input type="text" class="form-control" v-model="insert.nmKatSp"
                                       placeholder="Masukkan Nama" required>
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
                post : [],
                kdMerek: '',
                modalTambahSp: false,
                insert: {},
                kodeDetMotor: '',
                image: '',
                kdKatSp: '',
                listkatsp: [],
                isicart: 0,
                crt: [],
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            this.loadKdSp();
            this.loadDetMotor();
            this.listSpMotor();
            this.crt = localStorage.getItem('cartItems');
        },
        computed: {
            //newKode: function () {
            //return this.newKode = this.kdMerek + this.kdJenis + this.kdType + this.kdTahun
            //}
        },
        mounted(){
            this.listSpMotor();
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
            loadKdSp:function(){
                let uri = `/api/kodespmotor/`;
                this.axios.get(uri).then(response => {
                this.insert.kdKatSp = response.data.kdKatSp;
                });
            },
            listSpMotor:function(){
                let uri = `/api/listspmotor/${this.$route.params.id}`;
                this.axios.get(uri).then(response => {
                this.listkatsp = response.data.data;
                });
            },
            loadDetMotor:function(){
                let uri = `/api/motor/${this.$route.params.id}`;
                this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            },
            PostStoreKatSp() {
                let uri = '/api/katspmotor/create';
                this.axios.post(uri, {
                    kdDetail: this.post.kdDetail,
                    kdDetailMotor: this.post.kdDetailMotor,
                    kdKatSp: this.insert.kdKatSp,
                    nmKatSp: this.insert.nmKatSp,
                    image: this.image,
                }).then((response) => {
                        this.loadKdSp();
                        this.loadDetMotor();
                        this.listSpMotor();
                        this.modalTambahSp = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            
            PostDeleteKatSp(id, index)
            {
            if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/listspmotor/${id}`)
                    .then(response => {
                        this.listkatsp.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            }
            }
           
        }
    }
</script>