<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createPelanggan' }" class="btn btn-md btn-success">TAMBAH PELANGGAN</router-link>
                        </h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode</th>
                                    <th>Nama</th>
                                    <th>Alamat</th>
                                    <th>No. Tlp</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kodePelanggan }}</td>
                                    <td>{{ post.namaPelanggan }}</td>
                                    <td>{{ post.alamatPelanggan }}</td>
                                    <td>{{ post.noTlp  }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editPelanggan', params: { id: post.kodePelanggan }}" class="btn btn-sm btn-primary">EDIT</router-link>
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
                posts: []
            }
        },
        created() {
            let uri = '/api/pelanggan';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        methods: {
            PostDelete(id, index)
            {
            if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/pelanggan/${id}`)
                    .then(response => {
                        this.posts.splice(index, 1);
                    }).catch(error => {
                    alert('system error!');
                });
            }
            }
        }
    }
</script>