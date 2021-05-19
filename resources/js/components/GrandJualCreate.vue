<template>
    <div class="mt-3">

        <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Grand Jual</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

                <p class="text-muted text-center">
                <date-picker v-model="tglGrandJual" value-type="format" format="YYYY/MM/DD"></date-picker>
                </p>
                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">Cust.</span>
                <vue-single-select
                            v-model="post"
                            :options="posts"
                            :required="true"
                            optionLabel="namaPelanggan"
                            optionKey="kodePelanggan"
                            
                ></vue-single-select>
                  </div>
               
                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">INV.</span>
                <input type="text" class="form-control" v-model="noNotaGrandJual" placeholder="No">
                  </div>
                
                <h3 class="profile-username text-center">Total {{ total  || 0 | currency }}</h3>
                <h3 class="profile-username text-center">Total Bayar {{ totalExpense  || 0 | currency }}</h3>
                
                <p class="text-muted text-center">
                  <form @submit.prevent="loadPiutang">
                    <input type="hidden" class="form-control" v-model="post.kodePelanggan" placeholder="No nota">
                   <button type="submit"  class="btn btn-primary btn-block">Cari Nota</button>
                  </form>
                  <br>
                    <a href="#" @click="paymentGrandJual()" class="btn btn-primary btn-block"><b>Payment</b></a>
                
              
            </div>
            <!-- /.box-body -->

          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          

                <div class="box box-danger">
                    <div class="box-header with-border">
                    <h3 class="box-title">Cari Invoice</h3>
                    </div>
                    <div class="box-body">

                 
                  
                    </div>
                    
                    <!-- /.box-body -->
                   </div>
                   
                <!-- /.box -->
                
              
                
                <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>No Nota </th>
                                    <th>Tgl Nota</th>
                                    <th>Jth Tempo</th>
                                    <th>Total Piutang</th>
                                    <th>Bayar Nota</th>
                                    <th>Sisa Piutang</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(pe, index) in pem" :key="pe.index">
                                  
                                    <td ><input type="text" class="form-control xs-3" v-model="pem[index].noNota" disabled /> </td>
                                    <td ><input type="text" class="form-control xs-3" v-model="pem[index].tglNota" disabled /></td>
                                    <td ><input type="text" class="form-control xs-3" v-model="pem[index].jthTempoNota" disabled /></td>
                                    <td>{{ pe.piutangNota | currency }}</td>
                                    <td><input type="text" v-model="bayar[index]" @keyup="getTotalPay()"></td>
                                    <td>{{ pe.piutangNota - bayar[index] | currency }} </td>
                                </tr>
                                </tbody>
                            </table>
                
                      <div v-for="(pe, index) in pem" :key="pe.index">
                        <form id="form1" @submit.prevent="updateData(index)" >
                          <input type="text" class="form-control xs-3" v-model="pem[index].noNota" disabled /> <br>
                          <input type="text" class="form-control xs-3" v-model="pem[index].tglNota" disabled /><br>
                          <input type="text" class="form-control xs-3" v-model="pem[index].jthTempoNota" disabled /><br>
                          <input type="text" v-model="bayar[index]" @keyup="getTotalPay()">
                          <input type="text" class="form-control xs-3" :value="pem[index].piutangNota - bayar[index]" :name="sisaPiu[index]" disabled /><br>
                        

                        </form>
                      </div>
                  <button type="submit" form="form1"  class="btn btn-md btn-success" >Bayar</button>

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
                
                <form  @submit.prevent="PostGrandPenjualan" >
                  <input type="hidden" class="form-control" v-model="tglGrandJual" >
                <input type="text" class="form-control" v-model="post.kodePelanggan" placeholder="Customer">
                <input type="hidden" class="form-control" v-model="totalExpense">
                

                <p class="text-muted text-center">
                <h3 class="profile-username ">Total </h3>
              <br>
                            <select class='form-control' v-model='pembayaran' >
                                <option value='1' selected>Cash</option>
                                <option value='2'>Debit / Bank Transfer</option>
                                <option value='3'>E-Money</option>
                            </select>
                            <br>
                            <div v-if="pembayaran === '1'">
                              <div class="input-group">
                                    <span class="input-group-addon">Rp.</span>
                                    <input type="number" class="form-control" v-model="totalBayar" @change="bayar()" placeholder="Bayar" required>
                                  </div>
                                  
                                  <p class="text-muted text-center">
                                  <button type="submit"  class="btn btn-md btn-success" >Bayar</button> 
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '2'">
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
                                  </p>
                            </div>
                            <div v-else-if="pembayaran === '3'">
                              Emoney
                            </div>

               
              </form>

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
                users: {},
                pem: [],
                sisaPiu: [],
                hasilJson: [],
                totalBayar: '',
                subtotal: '',
                ntp:'',
                pembayaran: '1',
                pelanggan: 'PL-2021-1',
                piutangPenjualan: '',
                bayarpiutang: {},

                totalx: '',
                noNotaGrandJual: '',
                totalPenjualan: '',
                tglGrandJual: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                validation: [],
                showModal: false,
                showModalMenu: false,
                showModalBayar: false,
                totalBayar:'',
                bayar: [],
                sum:'',
                totalExpense: 0,
            }
        },

       watch: {
          post: function() {
            this.$emit('input', this.post);
          },
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

        computed: {
                total: function() {
                    if (!this.pem) {
                        return 0;
                    }
                    return this.pem.reduce(function (piutangNota, pe) {
                        return piutangNota + Number(pe.piutangNota);
                    }, 0);
                }
          },
          

        methods: {
          updateData: function(index) {
                var datas = [];
                for (var index of Object.keys(this.pem)) {
                    datas = JSON.stringify({
                      kdGrandJual: this.noNotaGrandJual, 
                      noNota: this.pem[index].noNota, 
                      tglNota: this.pem[index].tglNota, 
                      bayar: this.bayar[index],
                      });
                    //console.log(datas);

                    let uri = '/api/insertgrandjual';
                    this.axios.post(uri, {
                      kdGrandJual: this.noNotaGrandJual, 
                      noNota: this.pem[index].noNota, 
                      tglNota: this.pem[index].tglNota, 
                      bayar: this.bayar[index],
                      }).then(response => {
                      
                    //this.subtotal = response.data.subTotalJual;
                    }).catch(error => {
                        console.log(error.response)
                    });
                    //console.log("id" + " : " + this.pem[index].id);
                    //console.log("noNota" + " : " + this.pem[index].noNota);
                    //console.log("tglNota" + " : " + this.pem[index].tglNota);
                    //console.log("jumlahBayar" + " : " + this.bayar[index]);
                    //console.log("sisaPiu" + " : " + this.pem[index].piutangNota - this.bayar[index]);
                }
              alert('grand jual berhasil di input')

          },
           getTotalPay() {
             this.totalExpense = this.bayar.reduce((sum, val) => {
                return Number(sum) + Number(val);
              });
          },
          paymentGrandJual() {
            this.showModalBayar = true;
            //alert("hahaha" + id);
            this.getTotalPay();

        },
        
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
                    ntp: this.noNotaGrandJual,
                }).then(response => {
                  //alert('mount' + this.noNotaPembelian)
                this.subtotal = response.data.subTotalJual;
                }).catch(error => {
                    console.log(error.response)
                });
            },
            loadNoGrandJual:function(){
                let uri = `/api/notaGrandJual`;
                this.axios.get(uri).then(response => {
                this.noNotaGrandJual = response.data.noNotaGrandJual;
                
            });
            },
            LoadPelanggan() {
              let uri = '/api/pelanggan';
              this.axios.get(uri).then(response => {
                  this.posts = response.data.data;
              });
            },
            loadPiutang:function(){
                let uri = '/api/dataPiutang';
                this.axios.post(uri, {
                  pelanggan: this.post.kodePelanggan,
                }).then(response => {
                    this.pem = response.data.data;
                    //this.totalAmount();
                   // alert('no nota '+ this.data.noNota);
                }).catch(error => {
                    console.log(error.response)
                });
            },
            PostDeleteTrx(id)
            {
              if(confirm("Do you really want to delete?" + id)){
                this.axios.delete(`/api/penjualanDelete/${id}`)
                    .then(response => {
                        alert('Berhasil Di Hapus');
                        this.loadTotal()
                        this.loadTransaksiPenjualan()
                    }).catch(error => {
                    
                });
              }
            },
            
            PostGrandJual() {
                let uri = '/api/addPenjualan/store';
                this.axios.post(uri, 
                {
                    noNota: this.noNotaGrandJual,
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

        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            };
            //this.loadNotaPenjualan();
        },
        created() {
            this.loadNoGrandJual();
            //this.loadBarang();
            this.LoadPelanggan();
            //this.loadPiutang();

        },
    }
</script>
