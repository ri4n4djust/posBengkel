<template>
    <div >
        <button  @click="loadDetailGrandJual()">
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
                                        <h4 class="modal-title">Detail Grand Jual</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="row invoice-info">
                                            <div class="col-sm-4 invoice-col">
                                           
                                            <address>
                                                <b>No  : </b>{{data.kdGrandJual}}<br>
                                                <strong>Customer :</strong> {{data.namaPelanggan}}<br>
                                                <b> Tgl : </b>{{data.tglGrandJual}}<br>
                                                <b>Type Bayar: </b> <span v-if="data.pembayaranGrandJual === '1'">
                                                                    Cash
                                                                </span>
                                                                <span v-else-if="data.pembayaranGrandJual === '2'">
                                                                    Debit / Credit<br>
                                                                </span>
                                            </address>
                                            </div>
                                            <!-- /.col -->
                                        </div>
                                        <h3 class="profile-username text-left">
                                            Total : {{ data.totalNota  || 0 | currency }} </h3>
                                        
                                        <div v-if="adminuser === 'Admin'">
                                            <a href="#"  @click="showModalMenu = true" class="btn btn-md btn-success"><b>Edit</b></a>
                                            <a href="#"   @click.prevent="DeletePenjualan(id=data.id)" class="btn btn-md btn-success"><b>Delete</b></a>
                                        </div>
                                        <div v-else-if="adminuser === 'Operator'">
                                            <a href="#"  @click="rePrint()" class="btn btn-md btn-success"><b>Re-Print</b></a>
                                            <a href="#"  @click="showModalMenu = true" class="btn btn-md btn-success"><b>Edit</b></a>
                                        </div>
                                        <br>
                                        <div class="box box-danger">
                                            <div class="box-header with-border">
                                            <h3 class="box-title">Detail Grand Jual</h3>
                                        
                                            </div>
                                                    <table class="table table-hover table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>No. Nota </th>
                                                            <th>Bayar</th>
                                                            <th>Type Bayar</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr v-for="(pe, i) in pem" :key="pe.id">
                                                            <td>{{ i+1 }}</td>
                                                            <td>{{ pe.noNotaPenjualan }} </td>
                                                            <td>{{ pe.totalGrandJual | currency}}</td>
                                                            <td>
                                                            <span v-if="pe.pembayaranGrandJual === '1'">
                                                                    Cash
                                                                </span>
                                                                <span v-else-if="pe.pembayaranGrandJual === '2'">
                                                                    Debit / Credit<br>
                                                                </span>
                                                            </td>

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
                np: this.data.kdGrandJual,
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
                if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/hapuspenjualan/${id}`)
                    .then(response => {
                        alert('penjualan berhasil dihapus');
                        //this.posts.splice(index, 1);
                        this.showModalPenjualan = false;
                       
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
                let uri = '/api/laporangrandjual';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
                
            });
            },
            loadDetailGrandJual:function(){
                this.showModalPenjualan = true;
                //this.loadDetailPenjualanJasa();
                let uri = '/api/detailgrandjual/'+ this.data.kdGrandJual;
                this.axios.post(uri).then(response => {
                    this.pem = response.data.data;
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
};
</script>