<template>
    <div class="mt-3">

        <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Penjualan</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

                
                <date-picker v-model="tglPenjualan" value-type="format" format="YYYY/MM/DD"></date-picker>
                <div class="box-header">
                  <h5 >Pelanggan / Plat Motor</h5>
                </div>
                <div class="input-group">
                  <vue-single-select
                              v-model="post"
                              :options="posts"
                              :required="true"
                              selected="0000"
                              optionLabel="platMotor"
                              optionKey="namaPelanggan" 
                  ></vue-single-select>
                </div>
               
                <p class="text-muted text-center">
                  <div class="input-group">
                    <span class="input-group-addon">INV.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span>
                    <input type="text" class="form-control" v-model="noNotaPenjualan" placeholder="No nota">
                  </div>
               
                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">Type&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span>
                      <select class='form-control' v-model='typePenjualan' required>
                          <option  value='1'>Cash</option>
                          <option value='2' >Kredit</option>
                        </select>
                  </div>
                  <p class="text-muted text-center">
                  <div v-if="typePenjualan === '2'">
                    <div class="input-group">
                    <span class="input-group-addon">Term&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span>
                    <input type="text" class="form-control" v-model="termPenjualan" >
                    </div>
                  </div>
                  <p>
                  <div class="input-group">
                    <span class="input-group-addon">Total Barang.</span>
                    <input type="text" class="form-control" :value="subtotals" >
                  </div>
                  <p>
                  <div class="input-group">
                    <span class="input-group-addon">Total Jasa.&nbsp; &nbsp; &nbsp; </span>
                    <input type="text" class="form-control" :value="subtotalJasa" :name="subtotalJasa" >
                  </div>                  
                
                <input type="hidden" class="form-control" :value="subtotal" :name="totalPenjualan" >
                <h3 class="profile-username text-center">Total Nota {{ subtotal || 0 | currency }}</h3>
               
                <p class="text-muted text-center">
                <a href="#" @click="showModalBayar = true" class="btn btn-primary btn-block"><b>Payment</b></a>
                </p>
              
            </div>
            <!-- /.box-body -->

          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          

                <div class="box box-danger">
                    <div class="box-header with-border">
                    <h3 class="box-title">Detail Penjualan</h3>
                   
                    </div>
                    <div class="box-body">
                      <div class="row">
                        <div class="col-xs-2">
                        <label class="control-label" ><i class="fa fa-check"></i>Mekanik</label>
                        <select class='form-control' v-model='mekanikNota' required>
                          <option v-for='mk in mekaniks' :value='mk.kdMekanik' :key='mk.id'>{{ mk.namaMekanik }}</option>
                        </select>
                        </div>
                        <div class="col-xs-2">
                        <label class="control-label" ><i class="fa fa-check"></i>Lift</label>
                        <select class='form-control' v-model='liftNo' required>
                          <option v-for='lf in lifts' :value='lf.kdLift' :key='lf.id'>{{ lf.noLift }}</option>
                        </select>
                        </div>
                        <div class="col-xs-2">
                        <label class="control-label" ><i class="fa fa-check"></i>Jenis Motor</label>
                        <input type="text" class="form-control" v-model="post.namaMotor" disabled>
                        </div>
                      </div>
                    </div>

                  

                    <div class="box-body">
                 
                  <form  @submit.prevent="PostItemPenjualan" id="anyName" >
                    

                    <div class="row">
                        <div class="col-xs-4">
                          <label>Nama / Barcode Barang</label>
                          <vue-single-select
                                  v-model="post1"
                                  :options="users"
                                  :required="true"
                                  autocomplete
                                  setFocus
                                  optionLabel="nmBarang" 
                                  optionKey="barcode"
                                  @input="PostItemPenjualan()"
                          ></vue-single-select>                        
                          </div>
                        <div class="col-xs-2">
                          <label>Qty</label>
                        <input type="hidden" v-model="post1.nmBarang" class="form-control input-sm" >
                        <input type="text" v-model="qtyJual" class="form-control input-sm" placeholder="Qty">
                        </div>
                        <div class="col-xs-2">
                          <label>Total</label>
                        <input type="text" :value="(post1.hrgJual * qtyJual) || 0" :name="subTotal" class="form-control input-sm" placeholder="Total">
                        </div>
                    </div>
                    </form>

                    <form  @submit.prevent="PostJasaPenjualan" id="anyName" >
                    <div class="row">
                        <div class="col-xs-4">
                          <label>Jasa</label>
                          <vue-single-select
                                  v-model="post2"
                                  :options="jasas"
                                  autocomplete
                                  optionLabel="namaJasa" 
                          ></vue-single-select>
                          <select class='form-control' v-model='post2.kdJasa' required>
                            <option v-for='mk in jasas' :value='mk.kdJasa' :key='mk.id'>{{ mk.namaJasa }}</option>
                          </select>     
                          <input type="hidden" v-model="qtyJualJasa" class="form-control input-sm" placeholder="Qty"> 
                          <input type="hidden" :value="(post2.biayaJasa * qtyJualJasa) || 0" :name="subTotal" class="form-control input-sm" placeholder="Total">                  
                          </div>

                        <div class="col-xs-2">
                          <label>Aksi</label>
                          <button type="submit" class="btn btn-sm btn-success form-control">Add</button>                        
                        </div>
                    </div>
                    </form>

                    </div>

                    
                    
                    
                    <!-- /.box-body -->
                   </div>
                   
                <!-- /.box -->
                            <div class="box-header with-border">
                                <h3 class="box-title">Detail Jasa</h3>
                                </div>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nama Jasa </th>
                                    <th>Harga</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(pe, no) in jas" :key="pe.id">
                                    <td>{{ no+1 }}</td>
                                    <td>{{ pe.namaJasa }} </td>
                                    <td>{{ pe.totalJasa | currency }}</td>
                                    <td class="text-center">
                                        <button @click.prevent="PostDeleteJasa(id= pe.id)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                
                            <div class="box-header with-border">
                                <h3 class="box-title">Detail Barang</h3>
                                </div>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(pe, no) in pem" :key="pe.id">
                                    <td>{{ no+1 }}</td>
                                    <td>{{ pe.nmBarang }} </td>
                                    <td>{{ pe.qtyJual}}</td>
                                    <td>{{ pe.hrgJual | currency }}</td>
                                    <td>{{ pe.totalJual | currency }}</td>
                                    <td class="text-center">
                                        <button @click.prevent="PostDeleteBrg(id= pe.id)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
              
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>

 <!-- /Modal -->
 <div v-if="showModalBayar">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="showModalBayar=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Add Payment</h4>
              </div>
              <div class="modal-body">
                <form  @submit.prevent="PostTransaksiPenjualan" >
                  <input type="hidden" class="form-control" v-model="tglPenjualan" >
                <input type="hidden" class="form-control" v-model="post.kodePelanggan" placeholder="Customer">
                <input type="hidden" class="form-control" v-model="noNotaPenjualan" placeholder="No nota">
                <input type="hidden" class="form-control" v-model="subtotal">
                <input type="hidden" class="form-control" v-model="liftNo">
                <input type="hidden" class="form-control" v-model="mekanikNota">
                <input type="hidden" class="form-control" v-model="typePenjualan">
                <input type="hidden" class="form-control" v-model="termPenjualan">
                <input type="hidden" class="form-control" :name="piutangPenjualan" :value="Math.abs(totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100)))">
                

                <p class="text-muted text-center">
                <input type="text" class="form-control" :value="Math.floor(((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100)) + ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100)) * taxDebit / 100) || 0 " :name="totalTransaksiBayar"  >
                <h3 class="profile-username ">Total {{ Math.floor(((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100)) + ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100)) * taxDebit / 100)  || 0 | currency }}</h3>


                <div class="row input-group">
                <div class="col-md-4">
                  <span class="input-group-addon">Tax in %</span>
                  <input type="number" class="form-control " v-model="pajak" placeholder="Tax">
                  <input type="hidden" class="form-control" :value="(subtotal * pajak / 100 + subtotal)" :name="totalTransaksipjk" >
                </div>
               

                
                <div class="col-md-4">
                  <span class="input-group-addon">Disc in %</span>
                  <input type="number" class="form-control" v-model="post.diskonPelanggan" placeholder="Diskon">
                  <input type="hidden" class="form-control" :value="((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100)" :name="diskon1" >
                </div>
              </div>
              <br>
                            <select class='form-control' v-model='pembayaran' >
                                <option value='1' selected>Cash</option>
                                <option value='2'>Debit</option>
                                <option value='3'>E-Money</option>
                            </select>
                            <br>
                            <div v-if="pembayaran === '1'">
                              <div class="input-group">
                                    <span class="input-group-addon">Rp.</span>
                                    <input type="number" class="form-control" v-model="totalBayar" @change="bayar()" placeholder="Bayar" required>
                                  </div>
                                  
                                  <h3 class="profile-username ">Kembali : {{ Math.floor(totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100)))  || 0 | currency  }}</h3>
                                  <p class="text-muted text-center">
                                   
                                  <button type="submit"  class="btn btn-md btn-success" >Bayar</button> 
                                  <a href="#"  @click="printBill(printMe)" class="btn btn-md btn-success" >Print Bill</a>               
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '2'">
                              <div class="input-group">
                                    <span class="input-group-addon">Card Carge %</span>
                                    <input type="number" step=".01" class="form-control" v-model="taxDebit" placeholder="0" >
                                    <input type="hidden" class="form-control" :value="((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100)) * taxDebit / 100 " :name="pajakKartu" >
                                  </div>
                                  <p>
                                  <div class="input-group">
                                    <span class="input-group-addon">Card No.</span>
                                    <input type="number" class="form-control" v-model="noDebit" placeholder="No Kartu" >
                                  </div>
                                  <p>
                                  <div class="input-group">
                                    <span class="input-group-addon">Rp.</span>
                                    <input type="number" class="form-control" v-model="totalBayar" @keyup="bayar()" placeholder="Bayar" required>
                                  </div>
                                  <br>
                                  <p class="text-muted text-center">
                                  
                                  <button type="submit"  class="btn btn-md btn-success" >Bayar</button>       
                                  <a href="#"  @click="printBill(printMe)" class="btn btn-md btn-success" >Print Bill</a>         
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '3'">
                              Emoney
                            </div>

               
              </form>

              <div id="printMe">
                <!-- info row -->
               <address>
                    <strong>Bengkel Kita.</strong><br>
                    Jimbaran<br>

                    Phone: (804) 123-5432<br>
                    Email: info@almasaeedstudio.com
                  </address>
              <div class="row">
                <div class="col-md-4 invoice-col">
                  <address>
                    <strong>Customer :</strong> {{pelanggan}}<br>
                    <b> Tgl : </b>{{tglNota}}<br>
                    <b> Lift : </b>1<br>
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-md-4 invoice-col">
                  <address>
                  <b>No Inv: </b>{{noNotaPenjualan}}<br>
                  <b>Kasir : </b>{{$session.get('user')}}
                  </address>
                </div>

                <div class="col-md-4 invoice-col">
                  <address>
                  <b>Waiter : </b>{{post.name}}<br>
                  <b>Type : </b>
                  <div v-if="pembayaran === '1'">
                    Cash
                  </div>
                  <div v-else-if="pembayaran === '2'">
                    Debit
                  </div>
                  <div v-else-if="pembayaran === '3'">
                    E-Money
                  </div>
                  </address>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
                
                  <table width="90%" border="1" style="border:1px solid black; border-collapse: collapse;">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="trx in pem" :key="trx.id">
                                    <td>{{ trx.kdBarang }} </td>
                                    <td>{{ trx.qtyJual}}</td>
                                    <td>{{ trx.hrgJual | currency }}</td>
                                    <td>{{ trx.totalJual | currency }}</td>
                                </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{subtotal | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Tax & Service :</th>
                                        <th>{{ (subtotal * pajak / 100 ) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Discount</th>
                                        <th>{{ ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{ ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100))  || 0 | currency }}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Payment :</th>
                                        <th>{{totalBayar | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Kembalian :</th>
                                        <th>{{ totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * post.diskonPelanggan / 100))  || 0 | currency }}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="5">Terima Kasih Telah Berbelanja</th>

                                    </tr>
                                </tfoot>
                            </table>

    </div>
              


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>

    
    </div>

      
  
  
</template>


<script>
  import DatePicker from 'vue2-datepicker';
  import 'vue2-datepicker/index.css';
  import VueSingleSelect from "vue-single-select";
 
  
    export default {
        components: { DatePicker, VueSingleSelect },         
        data() {
            return {
                post: [],
                posts: [],
                post2:'Bongkar Mesin',
                post1: [],
                users: [],
                jasas: [],
                mekaniks:[],
                lifts:[],
                pem: {},
                jas: {},
                qtyJual: '1',
                qtyJualJasa: '1',
                //kodePelanggan: 'PL-2021-1',
                qtySa: '',
                hrgJual: '',
                subTotal: '',
                totalBayar: '',
                //subtotal: '',
                subtotals: '',
                subtotalJasa: 0,
                ntp:'',
                satuanJual: '',
                pajak: '0',
                taxDebit: '0',
                noDebit: '0',
                chargeNota: '0',
                pajakKartu:'',
                rbayar: '0',
                pembayaran: '1',
                totalTransaksiBayar: '',
                totalTransaksipjk: '',
                diskon1: '',
                pelanggan: 'PL-2021-1',
                tglNota: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                liftNo: 'LF-2021-1',
                mekanikNota: 'MK-2021-1',
                typePenjualan: '1',
                termPenjualan: '0',
                piutangPenjualan: '',
                totalx: '',
                noNotaPenjualan: '',
                //noNotaPenjualan: '',
                totalPenjualan: '',
                tglPenjualan: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                validation: [],
                showModal: false,
                showModalMenu: false,
                showModalBayar: false,
            }
        },

       watch: {
          post: function() {
            this.$emit('input', this.post);
          }
        },
        //props: ['value'],
        props: {
          value: { require: true },
          options: {
            type: Array,
            required: false,
            default: () => []
          },
          optionLabel: {
            type: String,
            required: false,
            default: () => null
          },
          optionKey: {
            type: String,
            required: false,
            default: () => null
          },
          placeholder: {
            type: String,
            required: false,
            default: () => "Cari Barang"
          },
          getOptionDescription: {
            type: Function,
            default(option) {
              if (this.optionKey && this.optionLabel) {
                return option[this.optionKey] + " - " + option[this.optionLabel];
              }
              if (this.optionLabel) {
                return option[this.optionLabel];
              }
              if (this.optionKey) {
                return option[this.optionKey];
              }
                  return option;
            }
          },
          
          

        },

        methods: {
          bayar(){
            if(this.totalBayar > this.totalNota){
              return this.rbayar = this.totalNota;
            }else{
              return this.rbayar = this.totalBayar;
            }
          },
          onlyNumber ($event) {
                //console.log($event.keyCode); //keyCodes value
                let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                    $event.preventDefault();
                }   
            },
            printBill:function(){
              window.print(printMe);
            },
            loadTotal:function(){
                let uri = '/api/totalTrxPenjualan';
                this.axios.post(uri, {
                    ntp: this.noNotaPenjualan,
                }).then(response => {
                this.subtotals = response.data.subTotalJual;
                }).catch(error => {
                    console.log(error.response)
                });
            },
            loadTotalJasa:function(){
                let uri = '/api/totalTrxJasaPenjualan';
                this.axios.post(uri, {
                    ntp: this.noNotaPenjualan,
                }).then(response => {
                this.subtotalJasa = response.data.subTotalJual;
                }).catch(error => {
                    console.log(error.response)
                });
            },
            loadNotaPenjualan:function(){
                let uri = `/api/kodePenjualan`;
                this.axios.get(uri).then(response => {
                this.noNotaPenjualan = response.data.noNota;
                
            });
            },
            LoadPelanggan() {
              let uri = '/api/motor';
              this.axios.get(uri).then(response => {
                  this.posts = response.data.data;
              });
            },
            LoadMekanik() {
              let uri = '/api/mekanik';
              this.axios.get(uri).then(response => {
                  this.mekaniks = response.data.data;
              });
            },
            LoadLift() {
              let uri = '/api/lift';
              this.axios.get(uri).then(response => {
                  this.lifts = response.data.data;
              });
            },
            loadBarang:function(){
                let uri = '/api/posts';
                this.axios.get(uri).then(response => {
                this.users = response.data.data;
                
            });
            },
            loadJasa:function(){
                let uri = '/api/jasa';
                this.axios.get(uri).then(response => {
                this.jasas = response.data.data;
                
            });
            },
            loadTransaksiJasaPenjualan:function(){
                let uri = '/api/dataJasaPenjualan/'+ this.noNotaPenjualan;
                this.axios.get(uri).then(response => {
                    this.jas = response.data.data;
                }).catch(error => {
                    console.log(error.response)
                });
            },
            loadTransaksiPenjualan:function(){
                let uri = '/api/dataPenjualan/'+ this.noNotaPenjualan;
                this.axios.get(uri).then(response => {
                    this.pem = response.data.data;
                   // alert('no nota '+ this.data.noNota);
                }).catch(error => {
                    console.log(error.response)
                });
            },
            PostDeleteBrg(id)
            {
              if(confirm("Do you really want to delete?" + id)){
                this.axios.delete(`/api/hapusbarang/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadTotal()
                        this.loadTotalJasa()
                        this.loadTransaksiPenjualan()
                        this.loadTransaksiJasaPenjualan()
                    }).catch(error => {
                    
                });
              }
            },
            PostDeleteJasa(id)
            {
              if(confirm("Do you really want to delete?" + id)){
                this.axios.delete(`/api/hapusjasa/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadTotal()
                        this.loadTotalJasa()
                        this.loadTransaksiPenjualan()
                        this.loadTransaksiJasaPenjualan()
                    }).catch(error => {
                    
                });
              }
            },
            PostItemPenjualan() {
                let uri = '/api/addItemPenjualan/store';
                this.axios.post(uri, 
                {
                    noNotaPenjualan: this.noNotaPenjualan,
                    kdBarang: this.post1.kdBarang,
                    hrgJual: this.post1.hrgJual,
                    qtyJual: this.qtyJual,
                    totalJual: this.post1.hrgJual * this.qtyJual,
                    tglPenjualan: this.tglPenjualan,
                    satuanJual: this.post1.satuanBarang,
                    nmBarangJual: this.post1.nmBarang
                })
                    .then((response) => {
                        this.loadTotal()
                        this.loadTransaksiPenjualan()
                        this.loadTransaksiJasaPenjualan()
                        document.getElementById("anyName").reset();
                        //this.loadTransaksiPenjualan()
                        //this.loadTotal()
                    }).catch(error => {
                        alert('Barang tidak ditemukan');
                });
                
            },
            PostJasaPenjualan() {
                let uri = '/api/addJasaPenjualan/store';
                this.axios.post(uri, 
                {
                    noNotaPenjualan: this.noNotaPenjualan,
                    kdJasa: this.post2.kdJasa,
                    namaJasa: this.post2.namaJasa,
                    biayaJasa: this.post2.biayaJasa,
                    qtyJasa: this.qtyJualJasa,
                    totalJasa: this.post2.biayaJasa * this.qtyJualJasa,
                    tglPenjualan: this.tglPenjualan,
                })
                    .then((response) => {
                        this.loadTotal()
                        this.loadTotalJasa()
                        this.loadTransaksiPenjualan()
                        this.loadTransaksiJasaPenjualan()
                        alert('sukses donkkkkkkkk');
                        document.getElementById("anyName").reset();
                        //this.loadTransaksiPenjualan()
                        //this.loadTotal()
                    });
                
            },
            PostTransaksiPenjualan() {
                let uri = '/api/addPenjualan/store';
                this.axios.post(uri, 
                {
                    noNota: this.noNotaPenjualan,
                    liftNo: this.liftNo,
                    pelanggan: this.post.kodePelanggan,
                    tglNota: this.tglPenjualan,
                    taxNota: (this.subtotal * this.pajak / 100),
                    diskonNota: ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100),
                    totalNota: Math.floor(((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100)) + ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100)) * this.taxDebit / 100),
                    bayarNota: this.rbayar,
                    userNota: this.$session.get('userId'),
                    mekanikNota: this.mekanikNota,
                    kembalianNota: this.totalBayar - ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100)),
                    typeBayarNota: this.pembayaran,
                    termNota: this.termPenjualan,
                    piutangNota: Math.ceil(this.totalBayar - ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100))) - Math.ceil((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100)) * this.taxDebit / 100, 

                    typeNota: this.typePenjualan,
                    chargeNota: Math.floor((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100)) * this.taxDebit / 100,
                    pajakPembayaran: this.pajak,
                    diskonPembayaran: this.post.diskonPelanggan,
                    chargePembayaran: this.taxDebit,
                    noKartuPembayaran: this.noDebit,
                    
                })
                    .then((response) => {
                        alert('Transaksi Selesai');
                        this.$router.go(0);
                        //this.$router.push({name: 'pembelian'});
                    });
                
            }
        },
        mounted(){
          this.piutangPenjualan = this.subtotal;
          this.totalx = this.totalBayar - ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100));
        },
        computed: {
          // a computed getter
          subtotal: function () {
            // `this` mengarah ke instance vm
            return this.subtotals + this.subtotalJasa ;
          },
          totalNota: function(){
            return Math.floor(((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100)) + ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.post.diskonPelanggan / 100)) * this.taxDebit / 100);
          },
          
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            };
            //this.post2 = 'JS-2021-1'
            //this.loadNotaPenjualan();
        },
        created() {
            this.loadNotaPenjualan();
            this.loadBarang();
            this.loadJasa();
            this.LoadPelanggan();
            this.LoadMekanik();
            this.LoadLift();
            this.loadTransaksiPenjualan();
            this.loadTransaksiJasaPenjualan();
            this.loadTotal();
        },
    }
</script>
