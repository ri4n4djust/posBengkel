<template>
    <div class="mt-3">
        <div class="card-header"><h3>EDIT BARANG</h3></div>
            <div class="card-body">
                <form @submit.prevent="PostUpdate" class="form-horizontal">
                    <div class="col-md-6">
          <!-- general form elements -->
                    <div class="box box-body">
                    
                            
                             <div class="form-group">
                                 <label class="col-sm-3 control-label">Kode Barang</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.kdBarang" disabled >
                                </div>
                             </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Nama Barang</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" v-model="post.nmBarang"
                                        placeholder="Masukkan Title" required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Harga Pokok</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" @blur="letterValue()" v-model="post.hrgPokok"
                                        placeholder="Harga Pokok" required>
                                </div>
                                <div class="col-sm-3">     
                                    <input type="text" class="form-control" v-model="post.cPokok">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Harga Jual</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" @blur="codeJual()" v-model="post.hrgJual"
                                        placeholder="Harga Jual" required>
                                </div>
                                <div class="col-sm-3">     
                                    <input type="text" class="form-control" v-model="post.cJual">
                                </div>
                            </div>

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Select Kategori:</label>
                            <div class="col-sm-8">
                                <select class='form-control' v-model='post.ktgBarang'>
                                    <option value='0' >Select Kategori</option>
                                    <option v-for='data in countries' :value='data.kodeKtg' :key='data.id'>{{ data.namaKtg }}</option>
                                </select>
                            </div>
                            </div>

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Barcode : </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.barcode">
                                <barcode v-model="post.barcode" :options="{ width: 1, height: 40 }" tag="img"></barcode>
                                
                            </div>
                            </div>

                    </div>
                    </div>
    

      
                <!-- left column -->
                    <div class="col-md-6">
            <!-- general form elements -->
                    <div class="box box-body">

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Stok</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.stkBarang"
                                       placeholder="Stok Barang" disabled>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Satuan</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.satuanBarang" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">QTY Min</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.qtyMin" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">QTY Max</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.qtyMax" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Merek</label>
                                <div class="col-sm-8">
                                <input type="text" class="form-control" v-model="post.merek" required>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-3 control-label">KONTEN</label>
                                <div class="col-sm-8">
                                <textarea class="form-control" v-model="post.deskripsi" rows="5"
                                          placeholder="Masukkan Konten" required></textarea>
                                </div>
                            </div>

                                <button type="submit" class="btn btn-md btn-success">UPDATE </button>
                                <button @click.prevent="PostDeleteTrx(post.id)" class="btn btn-md btn-danger">HAPUS</button>
                                <button type="button" class="btn btn-primary btn-success" data-toggle="modal" data-target=".bd-example-modal-lg">Print Barcode</button>
                                <router-link :to="{ name: 'posts' }" class="btn btn-primary btn-success">KEMBALI</router-link>
                                         
                    
                    </div>
                    </div>

                    </form>

            </div>

                    <div class="row" id="printBar">
                    <div v-for="qt in jlm" :key="qt"  >
                        <div class="col-md-4" >
                            <barcode v-model="post.barcode" :options="{ displayValue: true, width: 1, height: 35 }" tag="img"></barcode>
                        </div>
                    </div>
                    </div>

            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Default Modal</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                    <form @submit.prevent="PreviewBarcode" class="form-horizontal">
                        <div class="form-group">
                            
                            <div class="col-sm-8">
                                <label class="col-sm-8 control-label">name : {{post.nmBarang}}</label>
                                <label class="col-sm-8 control-label">Code : {{cJual}}</label>
                                <barcode  v-model="post.barcode" :options="{ displayValue: true, width: 1, height: 20  }" ></barcode>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label ">QTY Print</label>
                            <div class="col-sm-3">
                            <input type="text" class="form-control" v-model="qtyPrint" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3">
                            <button type="submit" class="btn btn-md btn-success">VIEW</button>
                            </div>
                        </div>
                    </form>
                    </div>
                    <div class="row">
                    <div v-for="qt in jlm" :key="qt"  >
                        <div class="col-md-4">
                            <barcode v-model="post.barcode" :options="{ displayValue: true, width: 1, height: 35 }" tag="img"></barcode>
                        </div>
                    </div>
                    </div>
                </div>
                <div></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button @click="printBarcode(printBar)" class="btn btn-default">Print Order</button>
                </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
    </div>

</template>
<style scoped>
    #printBar { display: block; }
    @media print
    {
      @page{
        margin: 0;
      }
      body * {
        visibility: hidden;
      }
      #printBar {
        display: block;
        font-size: 12px;
      }
      table { font-size: 12px; }
     }
</style>
<script>
    export default {

        data() {
            return {
                post: {},
                qtys: '',
                validation: [],
                selected : '',
                country: 0,
                countries: {},
                kdh: [],
                cPokok: [],
                cJual: [],
                hrg: [],
                codeHrg: [],
                avatar: '',
                qtyPrint: '',
                jlm: [],
                printBar: '',
                
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/posts/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
                this.getCountries();
                this.loadKdHarga();
            });
            
        },
        methods: {
            
            letterValue(){
                    var a = '';
                    let kdh = this.hrg;
                for (convert of this.post.hrgPokok.split("")) {
                    var convert;
                    var cc = kdh.find(o => o.noHrg === parseInt(convert));
                    var b = cc.codeHrg ;
                    var cd = a += b ;
                }
                return this.post.cPokok = cd ;
            },
            codeJual(){
                    var a = '';
                    let kdh = this.hrg;
                for (convert of this.post.hrgJual.split("")) {
                    var convert;
                    var cc = kdh.find(o => o.noHrg === parseInt(convert));
                    var b = cc.codeHrg ;
                    var cd = a += b ;
                }
                return this.post.cJual = cd ;
            },
            avatarChange(e) {
            //console.log(e.target.files[0])
            var fileReader = new FileReader()
            fileReader.readAsDataURL(e.target.files[0])
            fileReader.onload = (e) => {
              this.avatar = e.target.result
            }
            //console.log(this.item)
          },
            PreviewBarcode(){
                for(var i = 1;i < this.qtyPrint; i++){
                    this.jlm = i;
                }
            },
            loadKdHarga(){
                let uri = '/api/setup';
                this.axios.get(uri).then(response => {
                this.hrg = response.data.data;
                });
            },
            PostUpdate() {
                let uri = `/api/posts/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'posts'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            getCountries: function(){
                axios.get('/api/kategori')
                    .then(function (response) {
                        this.countries = response.data.data;
                    }.bind(this));
            },
            printBarcode(printBar) {
               var contents = document.getElementById("printBar").innerHTML;
                var frame1 = document.createElement('iframe');
                frame1.name = "frame1";
                frame1.style.position = "absolute";
                frame1.style.top = "-1000000px";
                document.body.appendChild(frame1);
                var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
                frameDoc.document.open();
                frameDoc.document.write(contents);
                frameDoc.document.close();
                setTimeout(function () {
                    window.frames["frame1"].focus();
                    window.frames["frame1"].print();
                    document.body.removeChild(frame1);
                }, 500);
                return false;
            },

            PostDeleteTrx(id)
            {
            if(confirm("Do you really want to delete?")){
               this.axios.delete(`/api/posts/${id}`)
                    .then(response => {
                        this.$router.push({name: 'posts'});
                        alert('Sukses Hapus' + this.post.nmBarang);
                    }).catch(error => {
                    alert('system error!');
                });
            }
            },
           
        },
       
    }
</script>
