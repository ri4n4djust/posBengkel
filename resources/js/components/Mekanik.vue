<template>
<div class="card-body">

                        <h3>
                        <a href="#" @click="modalTambah = true" class="btn btn-md btn-success">TAMBAH MEKANIK</a>
                        </h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode</th>
                                    <th>Nama Mekanik</th>
                                    <th>Alamat</th>
                                    <th>Jabatan</th>
                                    <th>No. Tlp</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kdMekanik }}</td>
                                    <td>{{ post.namaMekanik }}</td>
                                    <td>{{ post.alamatMekanik }}</td>
                                    <td>{{ post.jabatanMekanik }}</td>
                                    <td>{{ post.noTlpMekanik  }}</td>
                                    <td class="text-center">
                                        <a href="#" @click="detailMekanik(id= post.id)" class="btn btn-sm btn-primary">Edit</a>
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
                                <input type="text" class="form-control" v-model="insert.kdMekanik" disabled>
                            </div>

                            <div class="form-group">
                                <label>Nama Mekanik</label>
                                <input type="text" class="form-control" v-model="insert.namaMekanik"
                                       placeholder="Masukkan Nama" required>
                            </div>

                            <div class="form-group">
                                <label>Alamat</label>
                                <input type="text" class="form-control" v-model="insert.alamatMekanik"
                                       placeholder="Alamat" required>
                            </div>
                            <div class="form-group">
                                <label>Jabatan</label>
                                <input type="text" class="form-control" v-model="insert.jabatanMekanik"
                                       placeholder="Jabatan" required>
                            </div>
                            <div class="form-group">
                                <label>No. Tlp</label>
                                <input type="text" class="form-control" v-model="insert.noTlpMekanik"
                                       placeholder="No Tlp" required>
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
                                <input type="text" class="form-control" v-model="edit.kdMekanik" disabled>
                            </div>
                            <div class="form-group">
                                <label>Nama Mekanik</label>
                                <input type="text" class="form-control" v-model="edit.namaMekanik"
                                       placeholder="Masukkan Nama" required>
                            </div>

                            <div class="form-group">
                                <label>Alamat</label>
                                <input type="text" class="form-control" v-model="edit.alamatMekanik"
                                       placeholder="Alamat" required>
                            </div>
                            <div class="form-group">
                                <label>Jabatan</label>
                                <input type="text" class="form-control" v-model="edit.jabatanMekanik"
                                       placeholder="Jabatan" required>
                            </div>
                            <div class="form-group">
                                <label>No. Tlp</label>
                                <input type="text" class="form-control" v-model="edit.noTlpMekanik"
                                       placeholder="No Tlp" required>
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
            this.loadMekanik();
            this.loadKdMekanik();
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        methods: {
            PostUpdate() {
                let uri = '/api/mekanik/update/'+this.edit.kdMekanik;
                this.axios.post(uri, this.edit)
                    .then((response) => {
                        //this.$router.push({name: 'pelanggan'});
                        this.modalEdit = false;
                        this.loadMekanik();
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            detailMekanik(id){
                this.modalEdit = true;
                let uri = '/api/mekanik/'+ id;
                this.axios.get(uri).then((response) => {
                this.edit = response.data.data;
                });
            },
            loadKdMekanik:function(){
                let uri = `/api/kodeMekanik/`;
                this.axios.get(uri).then(response => {
                this.insert.kdMekanik = response.data.kodeMekanik;
                
            });
            },
            loadMekanik(){
                let uri = '/api/mekanik';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                });
            },
            PostStore() {
                let uri = '/api/mekanik/store';
                this.axios.post(uri, this.insert)
                    .then((response) => {
                        //this.$router.push({ name: 'pelanggan' });
                        this.loadMekanik();
                        this.loadKdMekanik();
                        this.modalTambah = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            PostDelete(id, index)
            {
            if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/mekanik/${id}`)
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