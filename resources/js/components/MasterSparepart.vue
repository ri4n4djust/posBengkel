<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createKategori' }" class="btn btn-md btn-success">TAMBAH KATEGORI</router-link>
                        </h3>

                            
                           
                            <div class="form-group">
                            <label class="col-sm-3 control-label">Merek:</label>
                            <div class="col-sm-8">
                            <select class='form-control' v-model='kdMerek' required @change="getJenis(kdMerek)">
                                <option v-for='data in merek' :value='data.kdMerek' :key='data.id'>{{ data.nmMerek }}</option>
                            </select>
                            </div>
                            </div>
                            <br>
                            <div class="form-group">
                            <label class="col-sm-3 control-label">Jenis:</label>
                            <div class="col-sm-8">
                            <select class='form-control' v-model='kdJenis' required @change="getType(kdJenis)">
                                <option v-for='data in jenis' :value='data.kdJenis' :key='data.id'>{{ data.nmJenis }}</option>
                            </select>
                            </div>
                            </div> 
                            <br>

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Type Motor:</label>
                            <div class="col-sm-8">
                            <select class='form-control' v-model='kdType' required @change="getTahun(kdType)">
                                <option v-for='data in type' :value='data.kdType' :key='data.id'>{{ data.nmType }}</option>
                            </select>
                            </div>
                            </div>

                            <div class="form-group">
                            <label class="col-sm-3 control-label">Tahun Motor:</label>
                            <div class="col-sm-8">
                            <select class='form-control' v-model='kdTahun' required>
                                <option v-for='data in tahun' :value='data.kdTahun' :key='data.id'>{{ data.nmTahun }}</option>
                            </select>
                            </div>
                            </div> 

                            <div class="form-group">
                            <div class="col-sm-8">
                            <button type="submit" @click="PostCari(newKode= kdMerek + kdJenis +kdType + kdTahun)" class="btn btn-md btn-success">Cari</button>
                            </div>
                            </div>
                            


        <div class="card-body">
        
        <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Type </th>
                                    <th>Tahun</th>
                                    <th>Nama</th>
                                    <th>Warna</th>
                                    <th>Gambar</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(det, index) in detailmotor" :key="det.id">
                                    <td>{{ det.kdType }}</td>
                                    <td>{{ det.kdTahun }}</td>
                                    <td>{{ det.nmDetail }}</td>
                                    <td>{{ det.warnaDetail }}</td>
                                    <td>{{ det.gbrDetail }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editKategori', params: { id: det.id }}" class="btn btn-sm btn-primary">Detail</router-link>
                                        <router-link :to="{name: 'editKategori', params: { id: det.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="PostDelete(det.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                        
                                    </td>
                                </tr>
                                </tbody>
                            </table>
        
        </div>
                        


                        
    </div>

                

</template>

<script>
    export default {

        data() {
            return {
                merek : [],
                kdMerek: '',
                nmMerek: '',
                jenis: [],
                kdJenis: '',
                nmJenis: '',
                type: [],
                kdType: '',
                tahun: [],
                kdTahun: '',
                newKode: '',
                detailmotor: [],
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            this.getMerek()
            //this.getJenis()
        },
        computed: {
            //newKode: function () {
            //return newKode = kdMerek + kdJenis + kdType + kdTahun
            //}
        },
        mounted(){
            //this.getCategories()
        },
        methods: {
            getMerek(){
                this.axios.get('api/merek')
                .then(response => { 
                this.merek = response.data.data;
                this.nmMerek = this.merek.nmMerek;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            getJenis(kdMerek){
                this.axios.get('api/jenis/'+ kdMerek)
                .then(response => { 
                this.jenis = response.data.data;
                this.nmJenis = this.jenis.nmJenis;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            getType(kdJenis){
                this.axios.get('api/type/'+ kdJenis)
                .then(response => { 
                this.type = response.data.data;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            getTahun(kdType){
                this.axios.get('api/tahun/'+ kdType)
                .then(response => { 
                this.tahun = response.data.data;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            PostCari(newKode){
               let uri = '/api/detailmotor/'+ newKode;
                this.axios.get(uri)
                    .then((response) => {
                        this.detailmotor = response.data.data;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            
           
        }
    }
</script>