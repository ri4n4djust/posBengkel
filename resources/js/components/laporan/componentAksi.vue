<template>
    <div >
        <button  @click="loadDetailPenjualan()">
            <i class="fa fa-eye"></i>
        </button>
       

                        <div v-if="showModalPenjualan">
                            <transition name="modal">
                            <div class="modal-mask">
                                <div class="modal-wrapper">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" @click="showModalPenjualan=false">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h4 class="modal-title">Detail Penjualan</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="row invoice-info">
                                            <div class="col-sm-4 invoice-col">
                                           
                                            <address>
                                                <strong>Customer :</strong> {{data.namaPelanggan}}<br>
                                                <b> Tgl : </b>{{data.tglNota}}<br>
                                                <b> Mekanik : </b>{{data.mekanikNota}}<br>
                                                <b>Type Bayar: </b> <span v-if="data.typeBayarNota === '1'">
                                                                    Cash
                                                                </span>
                                                                <span v-else-if="data.typeBayarNota === '2'">
                                                                    Debit / Credit<br>
                                                                </span>
                                            </address>
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 invoice-col">
                                            <b>No Invoice : </b>{{data.noNota}}<br>
                                            <b>Kasir : </b>{{data.name}}<br>
                                            <b>Lift : </b>{{data.liftNo}}
                                            
                                            </div>
                                            <!-- /.col -->
                                            <div class="col-sm-4 invoice-col">
                                                <b>Pajak : </b>{{data.taxNota | currency}}<br>
                                                <b>Diskon : </b>{{data.diskonNota | currency}}<br>
                                                <b>Type Nota: </b> <span v-if="data.typeNota === '1'">
                                                                    Cash
                                                                </span>
                                                                <span v-else-if="data.typeNota === '2'">
                                                                    Kredit<br>
                                                                    Bayar : {{ data.bayarNota  || 0 | currency }} <br> 
                                                                    Sisa Hutang :  {{ data.piutangNota  || 0 | currency }}
                                                                </span>
                                            </div>
                                        </div>
                                        <h3 class="profile-username text-left">
                                            Total : {{ data.totalNota  || 0 | currency }} </h3>
                                        
                                        <div v-if="adminuser === 'Admin'">
                                            <a href="#"  @click="rePrint()" class="btn btn-md btn-success"><b>Re-Print</b></a>
                                            <a href="#"  @click="showModalMenu = true" class="btn btn-md btn-success"><b>Edit</b></a>
                                            <a href="#"   @click.prevent="DeletePenjualan(id=data.id)" class="btn btn-md btn-success"><b>Delete</b></a>
                                        </div>
                                        <div v-else-if="adminuser === 'Operator'">
                                            <a href="#"  @click="rePrint()" class="btn btn-md btn-success"><b>Re-Print</b></a>
                                            <a href="#"  @click="showModalMenu = true" class="btn btn-md btn-success"><b>Edit</b></a>
                                        </div>
                                        <div v-else-if="adminuser === 'Kasir'">
                                            <a href="#"  @click="rePrint()" class="btn btn-md btn-success"><b>Re-Print</b></a>
                                        </div>
                                        <br>
                                        <div class="box box-danger">
                                            <div class="box-header with-border">
                                            <h3 class="box-title">Detail Barang</h3>
                                        
                                            </div>
                                                    <table class="table table-hover table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>Nama </th>
                                                            <th>Qty</th>
                                                            <th>Harga</th>
                                                            <th>Total</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr v-for="pe in pem" :key="pe.id">
                                                            <td>{{ pe.nmBarang }} </td>
                                                            <td>{{ pe.qtyJual}}</td>
                                                            <td>{{ pe.hrgJual | currency }}</td>
                                                            <td>{{ pe.qtyJual * pe.hrgJual | currency }}</td>

                                                        </tr>
                                                        </tbody>
                                                    </table>
                                        </div>
                                        <div class="box box-danger">
                                            <div class="box-header with-border">
                                            <h3 class="box-title">Detail Jasa</h3>
                                        
                                            </div>
                                                    <table class="table table-hover table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>No </th>
                                                            <th>Jasa</th>
                                                            <th>Harga</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr v-for="(pe, no) in jas" :key="pe.id">
                                                            <td>{{ no+1 }} </td>
                                                            <td>{{ pe.namaJasa}}</td>
                                                            <td>{{ pe.biayaJasa | currency }}</td>

                                                        </tr>
                                                        </tbody>
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
export default {
    name: "ActionButtons",
    data() {
            return {
                posts: [],
                pem: [],
                jas: [],
                showModalPenjualan: false,
                np: this.data.noNota,
                sukses: '',
                
            }

        },
    created() {
            this.loadData()
            //this.something()
            //this.loadDetailPenjualan()
            this.adminuser = this.$session.get('roleID');
        },
   
       
    methods: {
        rePrint: function(){
                window.print(printMe);
            },
            DeletePenjualan(id)
            {
                if(confirm("Do you really want to delete?" + id)){
                this.axios.delete(`/api/hapuspenjualan/${id}`)
                    .then(response => {
                        alert('penjualan berhasil dihapus');
                        //this.posts.splice(index, 1);
                        this.loadData()
                        this.showModalPenjualan = false;
                       //this.$emit('event-name');
                       this.$emit('bindings', this.loadData())
                    }).catch(error => {
                    alert('system error!');
                });
                }
            },
            something() {
                return new Promise((resolve) => {
                resolve('np:'+ this.data.noNota);
                });
            },
            loadData:function(){
                let uri = '/api/penjualan';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
                
            });
            },
            loadDetailPenjualan:function(){
                this.showModalPenjualan = true;
                this.loadDetailPenjualanJasa();
                let uri = '/api/detailpenjualan/'+ this.data.noNota;
                this.axios.post(uri).then(response => {
                    this.pem = response.data.data;
                   // alert('no nota '+ this.data.noNota);
                });
            },
            loadDetailPenjualanJasa:function(){
                //this.showModalPenjualan = true;
                let uri = '/api/detailpenjualanjasa/'+ this.data.noNota;
                this.axios.post(uri).then(response => {
                    this.jas = response.data.data;
                   // alert('no nota '+ this.data.noNota);
                });
            },

                      
        },
    props: {
        data: {
            type: Object,
            required: true,
        },
    },
    //props: ['value'],
};
</script>