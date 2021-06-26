<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createKategori' }" class="btn btn-md btn-success">TAMBAH KATEGORI</router-link>
                        </h3>

                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode </th>
                                    <th>Nama Kategori</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kodeKtg }}</td>
                                    <td>{{ post.namaKtg }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editKategori', params: { id: post.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
                                        <button @click.prevent="PostDelete(post.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                        
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            

                           
        

                        


                        
    </div>

                

</template>

<script>
    export default {

        data() {
            return {
                posts: {},
                categories : [],
                parentId: '',
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
            let uri = '/api/kategori';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
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
                return this.nmMerek = this.merek.nmMerek;
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
            
            PostDelete(id, index)
            {
                if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/kategori/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
                }f
            }
        }
    }
</script>