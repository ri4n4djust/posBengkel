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
                                        <h4 class="modal-title">Detail Penjualan Jasa</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="row invoice-info">
                                            <div class="col-sm-4 invoice-col">
                                           
                                            Detail
                                        
                                       
                                            </div>
                                                    
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
};
</script>