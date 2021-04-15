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

                <p class="text-muted text-center">
                <date-picker v-model="tglPenjualan" value-type="format" format="YYYY/MM/DD"></date-picker>
                </p>
                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">Cust.</span>
                <vue-single-select
                            v-model="post"
                            :options="posts"
                            :required="true"
                            optionLabel="namaPelanggan" 
                ></vue-single-select>
                  </div>
               
                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">INV.</span>
                <input type="text" class="form-control" v-model="noNotaPenjualan" placeholder="No nota">
                  </div>
               
                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">Type</span>
                      <select class='form-control' v-model='typePenjualan' required>
                          <option  value='1'>Cash</option>
                          <option value='2' >Kredit</option>
                        </select>
                  </div>
                  <p class="text-muted text-center">
                  <div v-if="typePenjualan === '2'">
                    <div class="input-group">
                    <span class="input-group-addon">Term</span>
                    <input type="text" class="form-control" v-model="termPenjualan" >
                    </div>
                  </div>
                  <div class="input-group">
                  <span class="input-group-addon">Mekanik</span>
                      <input type="text" class="form-control" v-model="mekanikNota" >
                  </div>
                  <p>
                  <div class="input-group">
                  <span class="input-group-addon">Lift :</span>
                      <input type="text" class="form-control" v-model="liftNo" >
                  </div>
                
                
                <input type="hidden" class="form-control" :value="subtotal" :name="totalPenjualan" >
                <h3 class="profile-username text-center">Total {{ subtotal  || 0 | currency }}</h3>
                
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
                    <h3 class="box-title">Cari Barang</h3>
                    </div>
                    <div class="box-body">

                 
                  <form  @submit.prevent="PostItemPenjualan" id="anyName" >
                    <vue-single-select
                            v-model="post1"
                            :options="users"
                            :required="true"
                            optionLabel="nmBarang" 
                            optionKey="barcode"
                    ></vue-single-select>

                    <div class="row">
                        <div class="col-xs-2">
                          <label>Satuan</label>
                        <input type="text" v-model="post1.satuanBarang" class="form-control" placeholder="Satuan" disabled>
                        </div>
                        <div class="col-xs-2">
                          <label>Harga</label>
                        <input type="text" v-model="post1.hrgJual" class="form-control" placeholder="Harga" @keypress="onlyNumber">
                        </div>
                        <div class="col-xs-2">
                          <label>Qty</label>
                        <input type="text" v-model="qtyJual" class="form-control" placeholder="Qty" @keypress="onlyNumber">
                        </div>
                        <div class="col-xs-2">
                          <label>Total</label>
                        <input type="text" :value="(post1.hrgJual * qtyJual) || 0" :name="subTotal" class="form-control" placeholder="Total">
                        </div>

                        <div class="col-xs-2">
                          <label>Aksi</label>
                          <button type="submit" class="btn btn-md btn-success form-control">Add</button>                        
                        </div>
                    </div>
                    
                    </form>
                    </div>
                    
                    <!-- /.box-body -->
                   </div>
                   
                <!-- /.box -->
                

                <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Nama </th>
                                    <th>Qty</th>
                                    <th>Harga</th>
                                    <th>Total</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="pe in pem" :key="pe.id">
                                    <td>{{ pe.nmBarang }} </td>
                                    <td>{{ pe.qtyJual}}</td>
                                    <td>{{ pe.hrgJual | currency }}</td>
                                    <td>{{ pe.totalJual | currency }}</td>
                                    <td class="text-center">
                                        <button @click.prevent="PostDeleteTrx(pe.id)" class="btn btn-sm btn-danger">HAPUS</button>
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
                <input type="text" class="form-control" v-model="post.kodePelanggan" placeholder="Customer">
                <input type="hidden" class="form-control" v-model="noNotaPenjualan" placeholder="No nota">
                <input type="hidden" class="form-control" v-model="subtotal">
                <input type="hidden" class="form-control" v-model="liftNo">
                <input type="hidden" class="form-control" v-model="mekanikNota">
                <input type="hidden" class="form-control" v-model="typePenjualan">
                <input type="hidden" class="form-control" v-model="termPenjualan">
                <input type="hidden" class="form-control" :name="piutangPenjualan" :value="Math.abs(totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100)))">
                

                <p class="text-muted text-center">
                <input type="hidden" class="form-control" :value="((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 " :name="totalTransaksiBayar"  >
                <h3 class="profile-username ">Total {{ ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 | currency }}</h3>


                <div class="row input-group">
                <div class="col-md-4">
                  <span class="input-group-addon">Tax in %</span>
                  <input type="number" class="form-control " v-model="pajak" placeholder="Tax">
                  <input type="hidden" class="form-control" :value="(subtotal * pajak / 100 + subtotal)" :name="totalTransaksipjk" >
                </div>
               

                
                <div class="col-md-4">
                  <span class="input-group-addon">Disc in %</span>
                  <input type="number" class="form-control" v-model="diskon" placeholder="Diskon">
                  <input type="hidden" class="form-control" :value="((subtotal * pajak / 100 + subtotal) * diskon / 100)" :name="diskon1" >
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
                                    <input type="number" class="form-control" v-model="totalBayar" placeholder="Bayar" required>
                                  </div>
                                  
                                  <h3 class="profile-username ">Kembali : {{ totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 | currency }}</h3>
                                  <p class="text-muted text-center">
                                  <button type="submit"  class="btn btn-md btn-success" >Bayar</button>                
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '2'">
                              <div class="input-group">
                                    <span class="input-group-addon">Card Carge %</span>
                                    <input type="number" class="form-control" v-model="taxDebit" placeholder="0" >
                                  </div>
                                  <br>
                                  <div class="input-group">
                                    <span class="input-group-addon">Card No.</span>
                                    <input type="number" class="form-control" v-model="noDebit" placeholder="No Kartu" >
                                  </div>
                                  <br>
                                  <div class="input-group">
                                    <span class="input-group-addon">Rp.</span>
                                    <input type="number" class="form-control" v-model="totalBayar" placeholder="Bayar" required>
                                  </div>
                                  <br>
                                  <p class="text-muted text-center">
                                  <button type="submit"  class="btn btn-md btn-success" >Bayar</button>                
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
                                        <th>{{ ((subtotal * pajak / 100 + subtotal) * diskon / 100) | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">subTotal :</th>
                                        <th>{{ ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 | currency }}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Payment :</th>
                                        <th>{{totalBayar | currency}}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">Kembalian :</th>
                                        <th>{{ totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100))  || 0 | currency }}</th>
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
                post: {},
                posts: [],
                post1: {},
                users: [],
                pem: {},
                qtyJual: '',
                qtySa: '',
                hrgJual: '',
                subTotal: '',
                totalBayar: '',
                subtotal: '',
                ntp:'',
                satuanJual: '',
                pajak: '',
                diskon: '',
                pembayaran: '1',
                totalTransaksiBayar: '',
                totalTransaksipjk: '',
                diskon1: '',
                pelanggan: 'PL-2021-1',
                tglNota: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                liftNo: '1',
                mekanikNota: 'mekanik 1',
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
          onlyNumber ($event) {
                //console.log($event.keyCode); //keyCodes value
                let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                    $event.preventDefault();
                }   
            },
            loadTotal:function(){
                let uri = '/api/totalTrxPenjualan';
                this.axios.post(uri, {
                    ntp: this.noNotaPenjualan,
                }).then(response => {
                  //alert('mount' + this.noNotaPembelian)
                this.subtotal = response.data.subTotalJual;
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
              let uri = '/api/pelanggan';
              this.axios.get(uri).then(response => {
                  this.posts = response.data.data;
              });
            },
            loadBarang:function(){
                let uri = '/api/posts';
                this.axios.get(uri).then(response => {
                this.users = response.data.data;
                
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
            PostDeleteTrx(id)
            {
              if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/penjualanDelete/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadTotal()
                        this.loadTransaksiPenjualan()
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
                })
                    .then((response) => {
                        this.loadTotal()
                        this.loadTransaksiPenjualan()
                        alert('sukses donkkkkkkkk');
                        document.getElementById("anyName").reset();
                        //this.loadTransaksiPenjualan()
                        //this.loadTotal()
                    });
                
            },
            PostJasaPenjualan() {
                let uri = '/api/addJasaPenjualan/store';
                this.axios.post(uri, 
                {
                    noNotaPenjualan: this.noNotaPenjualan,
                    kdBarang: this.post1.kdBarang,
                    hrgJual: this.post1.hrgJual,
                    qtyJual: this.qtyJual,
                    totalJual: this.post1.hrgJual * this.qtyJual,
                    tglNotaPenjualan: this.tglPenjualan,
                })
                    .then((response) => {
                        this.loadTotal()
                        this.loadTransaksiPenjualan()
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
                    diskonNota: ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100),
                    totalNota: ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100)),
                    bayarNota: this.totalBayar,
                    userNota: this.$session.get('userId'),
                    mekanikNota: this.mekanikNota,
                    kembalianNota: this.totalBayar - ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100)),
                    typeNota: this.typePenjualan,
                    termNota: this.termPenjualan,
                    piutangNota: Math.abs(this.totalBayar - ((this.subtotal * this.pajak / 100 + this.subtotal) - ((this.subtotal * this.pajak / 100 + this.subtotal) * this.diskon / 100))), 
                    
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
          this.totalx = totalBayar - ((subtotal * pajak / 100 + subtotal) - ((subtotal * pajak / 100 + subtotal) * diskon / 100));
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            };
            //this.loadNotaPenjualan();
        },
        created() {
            this.loadNotaPenjualan();
            this.loadBarang();
            this.LoadPelanggan();
            this.loadTransaksiPenjualan();
            this.loadTotal();
        },
    }
</script>
