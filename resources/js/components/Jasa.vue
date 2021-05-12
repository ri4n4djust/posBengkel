<template>
<div class="card-body">

                        <h3>
                        <a href="#" @click="modalTambah = true" class="btn btn-md btn-success">TAMBAH JASA</a>
                        </h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode</th>
                                    <th>Nama Jasa</th>
                                    <th>Biaya Jasa</th>
                                    <th>Des</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kdJasa }}</td>
                                    <td>{{ post.namaJasa }}</td>
                                    <td>{{ post.biayaJasa | currency }}</td>
                                    <td>{{ post.desJasa }}</td>
                                    <td class="text-center">
                                        <a href="#" @click="detailJasa(id= post.id)" class="btn btn-sm btn-primary">Edit</a>
                                        <button @click.prevent="PostDelete(post.id, index)" class="btn btn-sm btn-danger">HAPUS</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

<!-- /ModalTambah -->
 <div v-if="modalTambah">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalTambah=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Tambah Data</h4>
              </div>
              <div class="modal-body">
                
                  <form @submit.prevent="PostStore">

                            <div class="form-group">
                                <label>Kode </label>
                                <input type="text" class="form-control" v-model="insert.kdJasa" disabled>
                            </div>

                            <div class="form-group">
                                <label>Nama Jasa</label>
                                <input type="text" class="form-control" v-model="insert.namaJasa"
                                       placeholder="Masukkan Nama" required>
                            </div>

                            <div class="form-group">
                                <label>Biaya Jasa</label>
                                <input type="text" class="form-control" v-model="insert.biayaJasa"
                                       placeholder="Biaya" required>
                            </div>
                            <div class="form-group">
                                <label>Deskripsi Jasa</label>
                                <input type="text" class="form-control" v-model="insert.desJasa"
                                       placeholder="Des" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                            </div>
                        </form>

              


              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!-- /ModalTambah -->

<!-- /ModalEdit-->
 <div v-if="modalEdit">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" @click="modalEdit=false">
                  <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Edit Data</h4>
              </div>
              <div class="modal-body">

                        <form @submit.prevent="PostUpdate">
                            <div class="form-group">
                                <label>Kode </label>
                                <input type="text" class="form-control" v-model="edit.kdJasa" disabled>
                            </div>
                            <div class="form-group">
                                <label>Nama Jasa</label>
                                <input type="text" class="form-control" v-model="edit.namaJasa"
                                       placeholder="Masukkan Nama" required>
                            </div>

                            <div class="form-group">
                                <label>Biaya Jasa</label>
                                <input type="text" class="form-control" v-model="edit.biayaJasa"
                                       placeholder="Biaya" required>
                            </div>
                            <div class="form-group">
                                <label>Deskripsi</label>
                                <input type="text" class="form-control" v-model="edit.desJasa"
                                       placeholder="Des" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">SIMPAN</button>
                            </div>
                        </form>
              
              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
  <!-- /ModalEdit -->

</div>
</template>


<script>
    export default {
        data() {
            return {
                posts: [],
                insert: {},
                edit: {},
                modalTambah: false,
                modalEdit: false,
            }
        },
        created() {
            this.loadJasa();
            this.loadKdJasa();
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        methods: {
            PostUpdate() {
                let uri = '/api/jasa/update/'+this.edit.kdMekanik;
                this.axios.post(uri, this.edit)
                    .then((response) => {
                        //this.$router.push({name: 'pelanggan'});
                        this.modalEdit = false;
                        this.loadJasa();
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            detailJasa(id){
                this.modalEdit = true;
                let uri = '/api/jasa/'+ id;
                this.axios.get(uri).then((response) => {
                this.edit = response.data.data;
                });
            },
            loadKdJasa:function(){
                let uri = `/api/kodeJasa/`;
                this.axios.get(uri).then(response => {
                this.insert.kdJasa = response.data.kodeJasa;
                
            });
            },
            loadJasa(){
                let uri = '/api/jasa';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                });
            },
            PostStore() {
                let uri = '/api/jasa/store';
                this.axios.post(uri, this.insert)
                    .then((response) => {
                        //this.$router.push({ name: 'pelanggan' });
                        this.loadJasa();
                        this.loadKdJasa();
                        this.modalTambah = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            PostDelete(id, index)
            {
            if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/jasa/${id}`)
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