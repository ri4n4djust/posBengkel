<template>
<div class="mt-3">
  

      <div class="row">
        <div class="col-md-3">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h5 class="box-title">
                  Login As {{ this.$session.get('user') }} | Role : {{ this.$session.get('roleID') }} 
                  <button type="button" class="btn-sm btn-success" @click="logout()">Log Out</button>
              </h5>
            </div>
            <!-- /.box-header -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>


                    <div class="card-body">
                        <h3>Daftar barang</h3>
                        <h3> 
                        <router-link :to="{ name: 'create' }" class="btn btn-md btn-success">TAMBAH BARANG</router-link>
                        
                        </h3>
                            
                            <div>
                                
                                <data-table v-bind="bindings" @actionTriggered="ActionButtons"/>
                                
                            </div>
                    


                    </div>
</div>
</template>
<style >
.data-table {
	display: grid;
	width: 100%;
	height: 100%;
	
}
</style>

</style>

<script>
import Vue from 'vue';

import DataTable from "@andresouzaabreu/vue-data-table";

import VueBarcode from '@chenfengyuan/vue-barcode';

import ActionButtons from './componentAksi.vue';
Vue.component("data-table", DataTable, VueBarcode);
    export default {
        data() {
            return {
                posts: [],
                ActionButtons: '',
                actionTriggered: null,
                //showModal: false,
            }

        },
        computed: {
            bindings() {
                return {
                    actionMode: "multiple",
                    name: "ActionButtons",
                    columns: [
                        {
                            key: "kdBarang",
                        },
                        {
                            key: "nmBarang",
                            title: "Nama Barang",
                            sortable: false,
                        },
                        {
                            key: "barcode",
                            title: "Barcode",
                            sortable: false,
                        },
                        {
                            key: "stkBarang",
                            title: "Stok",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "satuanBarang",
                            title: "Satuan",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "namaKtg",
                            title: "Kategori",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "deskripsi",
                            title: "Keterangan",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            title: "Action",
                            sortable: false,
                            searchable: false,
                            /* this will make this column appear to the right of the table
                            since its index is greater than others*/
                            
                            component: ActionButtons,
                            index:100,
                        },
                        
                    ],
                    data: this.posts,
                    /* other props...*/
                    
                }
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            this.loadData()
            //this.pollData()
            //setInterval(this.loadData(),60000)
            
        },
        methods: {
            
            loadData:function(){
                let uri = '/api/posts';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                
                }).catch(error => {
                        console.log(error.response)
                    });
            },
            
            intervalFetchData: function () {
            setInterval(() => {    
                this.loadData();
                }, 3000);    
            },

            logout: function () {
            this.$session.destroy()
            this.$router.push('/')
            },
        },
        mounted () {
            //this.intervalFetchData1();
            //this.intervalFetchData();
            //this.bindings()
            this.loadData()
        },

        beforeDestroy () {
            clearInterval(this.posts)
        },
        
    }
</script>