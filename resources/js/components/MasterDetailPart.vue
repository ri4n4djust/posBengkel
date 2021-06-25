<template>
    <div class="mt-3">

        <section class="content">

      <div class="row">
        <div class="col-md-4">
           

{{listkatsp.kdDetailMotor}}
          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Kategori Part</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">


                <p class="text-muted text-center">
                  <div class="form-group">
                      <select class='form-control' @click="listSpMotor()" v-model='listkatsp.kdKatSp' v-on:change="changeRoute" required>
                          <option  v-for="det in listkatspmotor" :data="det.kdKatSp" :key="det.id">
                                
                                  {{det.nmKatSp}}<a href="#"> detail </a>
                               
                              </option>
                        </select>
                  </div>
                <div class="row">
                   <button @click="modalTambahBarang = true" class="btn btn-md btn-primary">TAMBAH BARANG</button>
                </div>
                <div class="row">
                    cart
                    {{ item }}

                    <button type="button" @click="removeStorage()" class="btn btn-md btn-success">Remove</button>
                </div>
                <div class="row">
                    
                    <!-- TABLE: LATEST ORDERS -->
                    <div class="box-header with-border">
                    <h3 class="box-title">List Part</h3>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                    <div class="table-responsive">
                        <table class="table no-margin">
                        <thead>
                        <tr>
                            <th>No</th>
                            <th>Barcode</th>
                            <th>Nama</th>
                            <th>Qty</th>
                            <th>Aksi</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(kat, index) in listkatalog" :key="kat.id">
                            <td>{{ kat.noBarang }}</td>
                            <td>{{ kat.barcode }}</td>
                            <td>{{ kat.nmBarang }}</td>
                            <td>1{{ index+1 }}</td>
                            <td>
                             <a href="#" @click="cart(brg = kat.barcode )"><i class="fa fa-fw fa-cart-plus"></i></a>
                             <i class="fa fa-fw fa-eye"></i>
                            </td>
                        </tr>
                        </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                    </div>
                    <!-- /.box-body -->

                
                </div>
                  
              
            </div>
            <!-- /.box-body -->

          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-8">
          

                <div class="box box-danger">
                    <div class="box-header with-border">
                    <h3 class="box-title">Cari Barang</h3>
                    </div>
                    <div class="box-body">

                        <img :src="`../image/foto/katsp/${listkatsp.gbrKatSp}`" class="img-responsive">
                    </div>
                    
                    <!-- /.box-body -->
                   </div>
                   
                <!-- /.box -->
                

               
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
<!-- /ModalTambah -->
 <div v-if="modalTambahBarang">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalTambahBarang=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Tambah Barang</h4>
              </div>
              <div class="modal-body">
                
                        <form @submit.prevent="PostStoreBarang">
                                <input type="hidden" class="form-control" v-model="insert.kdKatSp" disabled>
                            <div class="input-group">
                                <span class="input-group-addon">No Pada Gmbr</span>
                                <input type="text" class="form-control" v-model="insert.noBarang"
                                       placeholder="Masukkan Nama" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <input type="text" class="form-control" v-model="insert.nmBarang">
                            </div>
                            
                            <div class="input-group">
                                <span class="input-group-addon">Barcode</span>
                                <input type="text" ref="brg" v-model="brg" v-on:keyup="get_brg" class="form-control " >
                                <span v-if="barangs.lenght === 0">
                                </span>
                                <span v-else>
                                    <ul class="list-group">
                                    <li v-for="(brg, id) in barangs" @click="select_brg(brg)" :key="brg.id" class="list-group-item autocomplete-box-li">
                                        {{ id+1 }}
                                        {{ brg.barcode }}
                                        {{ brg.nmBarang }}
                                    </li>
                                    </ul>
                                </span>
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
 

    
    </div>
</template>

<script>
    export default {

        data() {
            return {
                post : [],
                kdMerek: '',
                modalTambahSp: false,
                modalTambahBarang: false,
                insert: {},
                kodeDetMotor: '',
                image: '',
                kdKatSp: '',
                listkatsp: [],
                listkatspmotor: [],
                barangs: [],
                brg: '',
                listkatalog: [],
                item: [],
                
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
            this.listKatalog();
            this.listDetSpMotor();
            this.listSpMotor();
            localStorage.removeItem('barcode')
        },
        computed: {
            //newKode: function () {
            //return this.newKode = this.kdMerek + this.kdJenis + this.kdType + this.kdTahun
            //}
            
        },
        
        mounted(){
            this.listSpMotor();
           // thi.localStorage.getItem('barcode')
        },
        methods: {
            cart(brg){
                let uri = '/api/caribarcode/'+brg;
                this.axios.get(uri).then(response => {
                //this.listkatalog = response.data.data;
                    localStorage.setItem('barcode', JSON.stringify(response.data.data));
                    console.log(localStorage)
                    this.item = localStorage.getItem('barcode')
                    alert(this.item)
                 });
            },
            removeStorage(){
                localStorage.removeItem('barcode')
                localStorage.removeItem('qty')
                console.log(localStorage)
                this.item = localStorage.getItem('barcode')
            },
            changeRoute() {
                let currentPath = this.$route.path;
                this.$router.push({path: currentPath, param: { id: 'KATSP005' }})
                alert(currentPath);
            },
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
            select_brg(brg){
                this.insert.nmBarang = brg.nmBarang
                this.brg = brg.barcode
                this.barangs = [];
            },
            get_brg(){
                if(this.brg.length == 0){
                    this.barangs = [];
                }
                if(this.brg.length > 0){
                    axios.get('/api/caribarang',{params: {brg: this.brg}}).then(response => {
                        this.barangs = response.data.data;
                    });
                }
            },
            loadKdSp:function(){
            //    let uri = `/api/kodespmotor/`;
            //    this.axios.get(uri).then(response => {
                this.insert.kdKatSp = `${this.$route.params.id}`;
            //    });
            },
            listKatalog:function(){
                let uri = `/api/listkatalog/${this.$route.params.id}`;
                this.axios.get(uri).then(response => {
                this.listkatalog = response.data.data;
                });
            },
            listSpMotor:function(){
                let uri = '/api/listspmotor/'+ this.listkatsp.kdDetailMotor;
                this.axios.get(uri).then(response => {
                this.listkatspmotor = response.data.data;
                //this.$router.push({name: 'mastersdetailpart', params: { id: listkatspmotor.kdKatSp }});
                });
            },
            listDetSpMotor:function(){
                let uri = `/api/listdetspmotor/${this.$route.params.id}`;
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
            PostStoreBarang(){
                let uri = '/api/katalog/create';
                this.axios.post(uri, {
                    kdKatSp: this.insert.kdKatSp,
                    barcode: this.brg,
                    noBarang: this.insert.noBarang,
                    nmBarang: this.insert.nmBarang,
                }).then((response) => {
                        //this.loadDetMotor();
                        this.brg = '';
                        this.insert.noBarang = '';
                        this.insert.nmBarang = '';
                        this.listKatalog();
                        this.modalTambahBarang = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            }
            
        }
    }
</script>