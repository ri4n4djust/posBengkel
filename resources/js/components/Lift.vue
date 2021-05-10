<template>
<div class="card-body">

                        <h3>
                        <a href="#" @click="modalTambah = true" class="btn btn-md btn-success">TAMBAH LIFT</a>
                        </h3>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>Kode</th>
                                    <th>No Lift</th>
                                    <th>Mekanik</th>
                                    <th>Status</th>
                                    <th>AKSI</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(post, index) in posts" :key="post.id">
                                    <td>{{ post.kdLift }}</td>
                                    <td>{{ post.noLift }}</td>
                                    <td>{{ post.mekanikLift }}</td>
                                    <td>{{ post.statusLift }}</td>
                                    <td class="text-center">
                                        <a href="#" @click="detailLift(id= post.id)" class="btn btn-sm btn-primary">Edit</a>
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
                                <input type="text" class="form-control" v-model="insert.kdLift" disabled>
                            </div>

                            <div class="form-group">
                                <label>No Lift</label>
                                <input type="text" class="form-control" v-model="insert.noLift"
                                       placeholder="Masukkan No" required>
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
                                <input type="text" class="form-control" v-model="edit.kdLift" disabled>
                            </div>
                            <div class="form-group">
                                <label>No Lift</label>
                                <input type="text" class="form-control" v-model="edit.noLift"
                                       placeholder="Masukkan Nama" required>
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
            this.loadLift();
            this.loadKdLift();
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        methods: {
            PostUpdate() {
                let uri = '/api/lift/update/'+this.edit.kdLift;
                this.axios.post(uri, this.edit)
                    .then((response) => {
                        //this.$router.push({name: 'pelanggan'});
                        this.modalEdit = false;
                        this.loadLift();
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            detailLift(id){
                this.modalEdit = true;
                let uri = '/api/lift/'+ id;
                this.axios.get(uri).then((response) => {
                this.edit = response.data.data;
                });
            },
            loadKdLift:function(){
                let uri = `/api/kodeLift/`;
                this.axios.get(uri).then(response => {
                this.insert.kdLift = response.data.kodeLift;
                
            });
            },
            loadLift(){
                let uri = '/api/lift';
                this.axios.get(uri).then(response => {
                this.posts = response.data.data;
                });
            },
            PostStore() {
                let uri = '/api/lift/store';
                this.axios.post(uri, this.insert)
                    .then((response) => {
                        //this.$router.push({ name: 'pelanggan' });
                        this.loadLift();
                        this.loadKdLift();
                        this.modalTambah = false;
                    }).catch(error => {
                    this.validation = error.response.data.data;
                });
            },
            PostDelete(id, index)
            {
            if(confirm("Do you really want to delete?")){
                this.axios.delete(`/api/lift/${id}`)
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