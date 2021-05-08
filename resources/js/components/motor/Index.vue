<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createMotor' }" class="btn btn-md btn-success">TAMBAH MOTOR</router-link>
                        </h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode </th>
                                    <th>Plat Motor</th>
                                    <th>Kenis Motor</th>
                                    <th>Pemilik</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kdMotor }}</td>
                                    <td>{{ post.platMotor }}</td>
                                    <td>{{ post.namaMotor }}</td>
                                    <td>{{ post.namaPelanggan }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editMotor', params: { id: post.id }}" class="btn btn-sm btn-primary">EDIT</router-link>
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
                posts: {}
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            let uri = '/api/motor';
            this.axios.get(uri).then(response => {
                this.posts = response.data.data;
            });
        },
        methods: {
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