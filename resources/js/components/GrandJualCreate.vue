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
                            optionKey="kodePelanggan"
                            
                ></vue-single-select>
                  </div>
               
                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">INV.</span>
                <input type="text" class="form-control" v-model="noNotaPenjualan" placeholder="No nota">
                  </div>
               
                
                <input type="hidden" class="form-control" :value="subtotal" :name="totalPenjualan" >
                <h3 class="profile-username text-center">Total {{ subtotal  || 0 | currency }}</h3>
                
                <p class="text-muted text-center">
                  <form @submit.prevent="loadPiutang">
                    <input type="hidden" class="form-control" v-model="post.kodePelanggan" placeholder="No nota">
                   <button type="submit"  class="btn btn-primary btn-block">Cari Nota</button>
                  </form>
                  <br>
                    <a href="#" @click="showModalBayar = true" class="btn btn-primary btn-block"><b>Payment</b></a>
                
              
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
                                    <th>Total Piutang</th>
                                    <th>Bayar Nota</th>
                                    <th>Sisa Piutang</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="pe in pem" :key="pe.id">
                                    <td >{{ pe.noNota }} </td>
                                    <td >{{ pe.tglNota}}</td>
                                    <td>{{ pe.piutangNota}}</td>
                                    <td><input type="text" @keyup="edit(id= pe.id)" :name="bayarpiutang"></td>
                                    <td>{{ pe.piutangNota - bayarpiutang | currency }}</td>
                                    <td class="text-center">
                                        <button @click.prevent="PostDeleteTrx(id= pe.id)" class="btn btn-sm btn-danger">HAPUS</button>
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
                pem: {},
                qtyJual: '',
                qtySa: '',
                hrgJual: '',
                subTotal: '',
                totalBayar: '',
                subtotal: '',
                ntp:'',
                pembayaran: '1',
                pelanggan: 'PL-2021-1',
                tglNota: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                piutangPenjualan: '',
                bayarpiutang: {},

                totalx: '',
                //noNotaPenjualan: '',
                totalPenjualan: '',
                tglPenjualan: new Date().toJSON().slice(0,10).replace(/-/g,'/'),
                validation: [],
                showModal: false,
                showModalMenu: false,
                showModalBayar: false,
                totalBayar:'',
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
          edit(id) {
            alert("hahaha" + id);

            // how to update with reloading all the phone list?
            //this.phones.splice(index, 1, updatedPhone)
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
            loadPiutang:function(){
                let uri = '/api/dataPiutang';
                this.axios.post(uri, {
                  pelanggan: this.post.kodePelanggan,
                }).then(response => {
                    this.pem = response.data.data;
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

        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            };
            this.loadNotaPenjualan();
        },
        created() {
            this.loadNotaPenjualan();
            this.loadBarang();
            this.LoadPelanggan();
            //this.loadPiutang();
            this.loadTotal();
        },
    }
</script>
