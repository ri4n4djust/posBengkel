<template>
    <div class="mt-3">

        <section class="content">
        <div class="text-right"><button class="btn btn-primary" data-toggle="modal" data-target="#cartModal">Cart ({{cartItems.length}})</button></div>
      <div class="row">
        <div class="col-md-4">
          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Katalog {{listkatsp.kdDetailMotor}}</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">


                <p class="text-muted text-center">
                  <div class="form-group">

                  </div>
                <div class="row">
                    <div class="box-body">
                    <button @click="modalTambahBarang = true" class="btn btn-md btn-primary">TAMBAH BARANG</button>
                    <router-link :to="{ name: 'mastersdetailparepart', params: { id: listkatsp.kdDetailMotor } }" class="btn btn-md btn-primary">KEMBALI</router-link>
                    </div>
                </div>
                <div class="row">
                    <div class="box-body">
                        <div>
                            <table class="table table-cart">
                                <tr v-for="item in crt" :key="item.id">
                                <td>{{item.nmBarang}}</td>
                                <td>QTY:
                                    <input v-model="item.qty" class="form-control input-qty" type="number">
                                </td>
                                <td>
                                    <button @click="removeItem(id = item.id)"><span class="glyphicon glyphicon-trash"></span></button>
                                </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.container -->
                    </div>
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
                        <tr v-for="(kat) in listkatalog" :key="kat.id">
                            <td>{{ kat.noBarang }}</td>
                            <td>{{ kat.barcode }}</td>
                            <td>{{ kat.nmBarang }}</td>
                            <td><input v-model="kat.qty" type="number" class="form-control" placeholder="Qty" required/></td>
                            <td>
                             <button @click="addToCart(kat)" class="btn btn-xs btn-primary"><i class="fa fa-fw fa-cart-plus"></i></button>
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
                        <h4 class="box-title">{{ listkatsp.nmKatSp }}  | {{listkatsp.gbrKatSp}}</h4>
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

<!-- Modal --> 
   <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">          <span aria-hidden="true">&times;</span></button>
               <h4 class="modal-title" id="myModalLabel">Cart</h4>
            </div>
            <div class="modal-body">
                        <div>
                            <table class="table table-cart">
                                <tr v-for="item in crt" :key="item.id">
                                <td>{{item.nmBarang}}</td>
                                <td>{{item.barcode}}</td>
                                <td>QTY:
                                    <input v-model="item.qty" class="form-control input-qty" type="number">
                                </td>
                                <td>
                                    <button @click="removeItem(id = item.id)"><span class="glyphicon glyphicon-trash"></span></button>
                                </td>
                                </tr>
                                <tr v-show="crt.length === 0">
                                <td colspan="4" class="text-center">Cart is empty</td>
                                </tr>
                                <tr v-show="crt.length > 0">
                                </tr>
                            </table>
                        </div>
                        <!-- /.container -->
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>

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
            const products = this.listkatalog;
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
                cartItems: [],
                items : products,
                qty: 1,
                lists: [],
                crt:[],
                
                
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
            this.getCart();
            if (this.crt === null){
                        this.crt = [];
                    }
        },
        computed: {
            //newKode: function () {
            //return this.newKode = this.kdMerek + this.kdJenis + this.kdType + this.kdTahun
            //}
            
        },
        watch:{
           
        },
        mounted(){
            this.$session.start('prd')
            this.listSpMotor();
           // thi.localStorage.getItem('barcode')
           this.axios.get('/api/list')
            .then((response)=>{
            this.lists= response.data
            });
        },
        methods: {
            addToCart(itemToAdd) {
            let found = false;
            // Add the item or increase qty
            let itemInCart = this.cartItems.filter(item => item.id===itemToAdd.id);
            let isItemInCart = itemInCart.length > 0;
            //var itemSes = this.$session.get('prd');
           
                    if (isItemInCart === false) {
                        this.cartItems.push(Vue.util.extend({}, itemToAdd));
                    } else {
                        itemInCart[0].qty += itemToAdd.qty;
                    }
                    
                    //itemToAdd.qty + 1;
                    //alert('sukses');
                    
                  
                    let cartItems;
                    if (localStorage.getItem('cartItems')===null){
                        cartItems = [];
                    }else{
                        cartItems = JSON.parse(localStorage.getItem('cartItems'));	
                    }
                    
                    cartItems.push(itemToAdd);	
                    		
                    localStorage.setItem('cartItems',JSON.stringify(cartItems));
                    this.getCart();
                    alert(itemToAdd.nmBarang + " berhasil disimpan")
                    //alert(localStorage.length + "length")
            },
            removeItem(id) {
                //alert(id)
                var arrayFromStroage = JSON.parse(localStorage.getItem('cartItems'));
                const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.id !== id);
                localStorage.setItem('cartItems', JSON.stringify(filtered));
                //this.items.splice(index, 1)
                this.crt = JSON.parse(localStorage.getItem('cartItems'))
                alert('berhasil dihapus')
                
            },
            
            getCart: function() {
                this.crt = JSON.parse(localStorage.getItem('cartItems'))
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