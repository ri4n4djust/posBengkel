<template>

                    <div class="card-body">
                        <h3>
                        <router-link :to="{ name: 'createUser' }" class="btn btn-md btn-success">TAMBAH USER</router-link>
                        </h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Nama</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.name }}</td>
                                    <td>{{ post.username }}</td>
                                    <td>{{ post.email  }}</td>
                                    <td>{{ post.role }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editMenu', params: { id: post.username }}" class="btn btn-sm btn-primary">EDIT</router-link>
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
            let uri = '/api/user';
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
                this.axios.delete(`/api/user/${id}`)
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