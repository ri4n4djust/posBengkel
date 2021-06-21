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

                        <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Buat Kategori Baru
                        </button>

                        <div class="collapse" id="collapseExample">
                        <div class="card card-body m-3">
                            <parent-form @add-parent="addParent"></parent-form>
                        </div>
                        </div>


                        <table class="table table-bordered">
                            <thead>
                            <tr >
                                <th scope="col">Kategori</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="category in categories" :key="category.id">
                                <td width="200">
                                |---> <b>{{category.name}}</b> 
                                <span v-for="childCat in category.children" :key="childCat.id">
                                    <p class="pl-4 m-0">  |---> {{childCat.name}}</p>
                                </span>
                                </td>
                                <td width="200">
                                <button class="btn btn-sm btn-primary" type="button" data-toggle="collapse" data-target="#addSub" aria-expanded="false" aria-controls="collapseExample">
                                Tambah Sub Kategori
                                </button>  
                                <div class="collapse" id="addSub">
                                    <div class="card card-body m-3">
                                    <parent-form @add-parent="addParent"></parent-form>
                                    </div>
                                </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
    </div>

                

</template>

<script>
import addParent from './ParentForm';
import ChildForm from './ChildForm'
    export default {
        //name: 'parent-form',
        components: { addParent, ChildForm },
        data() {
            return {
                posts: {},
                categories : [],
                parentId: '',
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
        },
        mounted(){
        this.getCategories()
        },
        methods: {
            addParentId(id){
                this.parentId = id;
            },
            getCategories(){
                this.axios.get('api/category/allCategories')
                .then(response => { 
                this.categories = response.data;
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
                });
            },
            addParent(category){
                this.axios.post('api/category/create', category)
                .then(response => { 
                    this.getCategories();
                    console.log(response.data)
                })
                .catch(error => {
                    console.error(error);
                });
            },
            addChild(category){
                this.axios.post('api/category/create', category)
                .then(response => { 
                this.getCategories();
                this.parentId = '';
                console.log(response.data)
                })
                .catch(error => {
                console.error(error);
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