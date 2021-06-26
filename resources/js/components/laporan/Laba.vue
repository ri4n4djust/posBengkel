<template>

                    <div class="card-body">
                         <h3>Laporan Laba</h3>
                        <div class="col-md-12">
                        
                                <!-- The timeline -->
                                
                                <form  @submit.prevent="lapLaba" >
                                    
                                        <p class="text-muted text-left">
                                        <label>Start Date</label>
                                    <date-picker v-model="startDate" value-type="format" format="YYYY/MM/DD" :required="true"></date-picker>
                                        </p>
                                        <p class="text-muted text-left">
                                        <label>End Date</label>
                                    <date-picker v-model="endDate" value-type="format" format="YYYY/MM/DD" :required="true"></date-picker>
                                        </p>
                                    <p class="text-muted text-left">
                                    <button type="submit" class="btn btn-md btn-success">View Data</button> 
                                        </p>                           
                                    
                                </form>
                                  
                                <table class="table table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th>No </th>
                                        <th>Tgl</th>
                                        <th>Total Penjualan</th>
                                        <th>Total Pokok</th>
                                        <th>Laba</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="(post1, index) in posts1" :key="post1.id">
                                        <td>{{ index+1 }}</td>
                                        <td>{{ post1.tglNota }}</td>
                                        <td>{{ post1.total | currency }}</td>
                                        <td>{{ post1.totalPokok | currency }}</td>
                                        <td>{{ post1.total - post1.totalPokok  | currency }}</td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th>Total :</th>
                                            <th>{{totalS | currency}}</th>
                                            <th>{{totalP | currency}}</th>
                                            <th>{{labaS | currency}}</th>
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
                        <!-- /.nav-tabs-custom -->
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
                totalP: [],
                labaS: [],
                typeNota: '0',
                typeBayarNota: '0',
                //totalSum: '',
            }

        },
        
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = '/api/penjualan';
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
            lapLaba() {
                let uri = '/api/laplaba';
                this.axios.post(uri, 
                {
                    startDate: this.startDate,
                    endDate: this.endDate,
                })
                    .then((response) => {
                        this.posts1 = response.data.data;
                        this.totalS = response.data.notaSum;
                        this.totalP = response.data.pokokSum;
                        this.labaS = response.data.labas;
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