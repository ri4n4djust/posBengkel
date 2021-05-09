<template>
    <div class="mt-3">
                    <div class="card-header">EDIT KATEGORI</div>

                    <div class="card-body">

                        <form @submit.prevent="PostUpdate">

                            <div class="form-group">
                                <label>Kode Motor</label>
                                <input type="text" class="form-control" v-model="post.kdMotor" disabled>
                            </div>
                            <div class="form-group">
                                <label>Plat Motor</label>
                                <input type="text" class="form-control" v-model="post.platMotor"
                                       placeholder="Plat Motor">
                            </div>
                            <div class="form-group">
                                <label>Jenis Motor </label>
                                <input type="text" class="form-control" v-model="post.namaMotor"
                                       placeholder="Jenis Motor">
                            </div>
                            <div class="form-group">
                                <label>Pemilik</label>
                                {{post.namaPelanggan}}
                                <select class='form-control' v-model='post.pemilikMotor' required>
                                <option v-for='data in posts' :value='data.kodePelanggan' :key='data.id'>{{ data.namaPelanggan }}</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">UPDATE</button>
                                <router-link :to="{name: 'motor' }" class="btn btn-sm btn-primary">KEMBALI</router-link>
                                <button @click.prevent="PostDelete(post.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                            </div>

                        </form>

                    </div>
                </div>

</template>

<script>
import VueSingleSelect from "vue-single-select";
    export default {
components: {  VueSingleSelect }, 
        data() {
            return {
                post: {},
                posts:{},
                post1: '',
                validation: []
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = `/api/motor/${this.$route.params.id}`;
            this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            this.loadPelanggan();
        },
        methods: {
            loadPelanggan(){
                let uri = '/api/pelanggan/';
                this.axios.get(uri).then((response) => {
                this.posts = response.data.data;
            });
            },
            PostUpdate() {
                let uri = `/api/motor/update/${this.$route.params.id}`;
                this.axios.post(uri, this.post)
                    .then((response) => {
                        this.$router.push({name: 'motor'});
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            PostDelete(id, index)
            {
                if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/motor/${id}`)
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
