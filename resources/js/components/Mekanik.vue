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
                                    <td>{{ post.alamatAlamt }}</td>
                                    <td>{{ post.jabatanMekani }}</td>
                                    <td>{{ post.noTlpMekanik  }}</td>
                                    <td class="text-center">
                                        <router-link :to="{name: 'editPelanggan', params: { id: post.kodePelanggan }}" class="btn btn-sm btn-primary">EDIT</router-link>
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
                modalTambah: false,
                modalEdit: false,
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