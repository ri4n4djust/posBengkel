<template>

                    <div class="card-body">
                         <h3>Laporan Hutang Pembelian</h3>
                        <div class="col-md-12">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                            <li class="active"><a href="#activity" data-toggle="tab">All Report</a></li>
                            <li><a href="#timeline" data-toggle="tab">Periodik</a></li>
                            <li><a href="#settings" data-toggle="tab">Settings</a></li>
                            </ul>
                            <div class="tab-content">
                            <div class="active tab-pane" id="activity">

                                <div>
                                <data-table v-bind="bindings" @actionTriggered="ActionButtons"/>
                                </div>
                                
                               
                                
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="timeline">
                                <!-- The timeline -->
                                
                                <form  @submit.prevent="lapPenjualan" >
                                    
                                        <p class="text-muted text-left">
                                        <label>Start Date</label>
                                    <date-picker v-model="startDate" value-type="format" format="YYYY/MM/DD" :required="true"></date-picker>
                                        </p>
                                        <p class="text-muted text-left">
                                        <label>End Date</label>
                                    <date-picker v-model="endDate" value-type="format" format="YYYY/MM/DD" :required="true"></date-picker>
                                        </p>
                                        <p class="text-muted text-left">
                                        <label>Jenis Nota</label>
                                            <select class='form-control' v-model='typeNota' >
                                            <option  value='0'>Semua</option>
                                            <option value='1' >Cash</option>
                                            <option value='2' >Kredit</option>
                                            </select>
                                        </p>
                                        <p class="text-muted text-left">
                                        <label>Jenis Pembayaran</label>
                                            <select class='form-control' v-model='typeBayarNota' >
                                            <option  value='0'>Semua</option>
                                            <option value='1' >Cash</option>
                                            <option value='2' >Debit / Credit Card</option>
                                            </select>
                                        </p>
                                        <p class="text-muted text-left">
                                    <button type="submit" class="btn btn-md btn-success">View Data</button> 
                                        </p>                       
                                    
                                </form>
                                  
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th>No Nota</th>
                                        <th>Customer</th>
                                        <th>Tgl</th>
                                        
                                        <th>Type Nota</th>
                                        <th>Type Bayar</th>
                                        <th>Bayar Nota</th>
                                        <th>Diskon</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="post1 in posts1" :key="post1.id">
                                        <td>{{ post1.noNota }}</td>
                                        <td>{{ post1.namaPelanggan }}</td>
                                        <td>{{ post1.tglNota }}</td>
                                        <td>
                                            <span v-if="post1.typeNota === '1'">
                                                Cash
                                            </span>
                                            <span v-else-if="post1.typeNota === '2'">
                                                Kredit
                                            </span>
                                        </td>
                                        <td>
                                            <span v-if="post1.typeBayarNota === '1'">
                                                Cash
                                            </span>
                                            <span v-else-if="post1.typeBayarNota === '2'">
                                                Debit / Credit Card
                                            </span>
                                        </td>
                                        <td>{{ post1.bayarNota | currency }}</td>
                                        <td>{{ post1.diskonNota | currency }}</td>
                                        <td>{{ post1.totalNota | currency}}</td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            
                                            <th></th>
                                            <th></th>
                                            <th>{{bayarS | currency}}</th>
                                            <th>{{diskonS | currency}}</th>
                                            <th>{{totalS | currency}}</th>
                                        </tr>
                                    </tfoot>
                                </table>

                                <div id="printMe" >
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th>No Nota</th>
                                        <th>Customer</th>
                                        <th>Tgl</th>
                                        
                                        <th>Type Nota</th>
                                        <th>Type Bayar</th>
                                        <th>Bayar Nota</th>
                                        <th>Diskon</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="post1 in posts1" :key="post1.id">
                                        <td>{{ post1.noNota }}</td>
                                        <td>{{ post1.namaPelanggan }}</td>
                                        <td>{{ post1.tglNota }}</td>
                                        <td>
                                            <span v-if="post1.typeNota === '1'">
                                                Cash
                                            </span>
                                            <span v-else-if="post1.typeNota === '2'">
                                                Kredit
                                            </span>
                                        </td>
                                        <td>
                                            <span v-if="post1.typeBayarNota === '1'">
                                                Cash
                                            </span>
                                            <span v-else-if="post1.typeBayarNota === '2'">
                                                Debit / Credit Card
                                            </span>
                                        </td>
                                        <td>{{ post1.bayarNota | currency }}</td>
                                        <td>{{ post1.diskonNota | currency }}</td>
                                        <td>{{ post1.totalNota | currency}}</td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            
                                            <th></th>
                                            <th></th>
                                            <th>{{bayarS | currency}}</th>
                                            <th>{{diskonS | currency}}</th>
                                            <th>{{totalS | currency}}</th>
                                        </tr>
                                    </tfoot>
                                </table>
                                </div>
                                <!-- OUTPUT -->
                                <button type="button" class="btn btn-primary" @click="print('printMu')">Print</button>

                            </div>
                            <!-- /.tab-pane -->

                            <div class="tab-pane" id="settings">

                                
                            </div>
                            <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <!-- /.nav-tabs-custom -->
                        </div>

                       

                            


                    </div>

                

</template>

<style type="text/css">

    #printMe { display: none; }

    @media print
    {
  body * {
    visibility: hidden;
  }
  #printMe, #printMe * {
    visibility: visible;
    font-size: 11px;
  }
  #printMe {
    position: absolute;
    left: 0;
    top: 0;
    font-size: 8px;
    width: 100%;
  }
}
    </style>

<script>
import Vue from 'vue';
import "@andresouzaabreu/vue-data-table/dist/DataTable.css";
import DataTable from "@andresouzaabreu/vue-data-table";

import DatePicker from 'vue2-datepicker';
import 'vue2-datepicker/index.css';
import VueSingleSelect from "vue-single-select";


import ActionButtons from './componentAksi.vue';
Vue.component("data-table", DataTable);
    export default {
        components: { DatePicker, VueSingleSelect,  },
        data() {
            return {
                posts: [],
                posts1: [],
                startDate: '',
                endDate: '',
                ActionButtons: null,
                validation: null,
                //actionTriggered: null,
                totalS: [],
                pajakS: [],
                diskonS: [],
                bayarS: [],
                typeNota: '0',
                typeBayarNota: '0',
                //totalSum: '',
            }

        },
        computed: {
            bindings() {
                return {
                    actionMode: "multiple",
                    //name: "ActionButtons",
                    columns: [
                        {
                            key: "noNota",
                            title: "No Nota",
                            sortable: false,
                        },
                        {
                            key: "namaPelanggan",
                            title: "Pelanggan",
                            sortable: false,
                        },
                        {
                            key: "tglNota",
                            title: "Tgl Nota",
                            sortable: false,
                        },
                        {
                            key: "taxNota",
                            title: "PPn",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "diskonNota",
                            title: "Diskon",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "totalNota",
                            title: "Total",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "bayarNota",
                            title: "Bayar",
                            sortable: false,
                            searchable: false,
                        },
                        {
                            key: "piutangNota",
                            title: "Piutang",
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
            let uri = '/api/laporanpiutang';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
        methods: {

            print () {
                window.print(printMe)
            },
            
            PostDelete(id, index)
            {
                this.axios.delete(`/api/penjualan/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            },
            lapPenjualan() {
                let uri = '/api/lapPenjualan';
                this.axios.post(uri, 
                {
                    startDate: this.startDate,
                    endDate: this.endDate,
                    typeNota: this.typeNota,
                    typeBayarNota: this.typeBayarNota,
                })
                    .then((response) => {
                        this.posts1 = response.data.data;
                        this.totalS = response.data.notaSum;
                        this.pajakS = response.data.pajakSum;
                        this.diskonS = response.data.diskonSum;
                        this.bayarS = response.data.bayarSum;
                        //alert('Data Ditampilkan');
                        //this.loadDataSorting()
                        //this.loadTotal()
                    });
                
            },
            //print () {
            // Pass the element id here
            //this.$htmlToPaper('printMe');
            //}
           
        },
        
    }
</script>