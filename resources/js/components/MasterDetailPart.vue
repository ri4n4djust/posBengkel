<template>
    <div class="mt-3">

        <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Kategori Part</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">


                <p class="text-muted text-center">
                  <div class="input-group">
                  <span class="input-group-addon">Type</span>
                      <select class='form-control' v-model='kdKatSp' required>
                          <option  v-for="det in listkatsp" :data="det.kdKatSp" :key="det.id">{{det.nmKatSp}}</option>
                        </select>
                  </div>
                  
              
            </div>
            <!-- /.box-body -->

          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          

                <div class="box box-danger">
                    <div class="box-header with-border">
                    <h3 class="box-title">Cari Barang</h3>
                    </div>
                    <div class="box-body">

                      

                    </div>
                    
                    <!-- /.box-body -->
                   </div>
                   
                <!-- /.box -->
                

               
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>

 

    
    </div>
</template>

<script>
    export default {

        data() {
            return {
                post : [],
                kdMerek: '',
                modalTambahSp: false,
                insert: {},
                kodeDetMotor: '',
                image: '',
                kdKatSp: `${this.$route.params.id}`,
                listkatsp: [],
                
            }
        },
        beforeCreate: function () {
            if (!this.$session.exists()) {
            this.$router.push('/')
            }
        },
        created() {
            this.loadKdSp();
            this.loadDetMotor();
            this.listSpMotor();
        },
        computed: {
            //newKode: function () {
            //return this.newKode = this.kdMerek + this.kdJenis + this.kdType + this.kdTahun
            //}
        },
        mounted(){
            this.listSpMotor();
        },
        methods: {
            onImageChange(e) {
                let files = e.target.files || e.dataTransfer.files;
                if (!files.length)
                    return;
                this.createImage(files[0]);
            },
            createImage(file) {
                let reader = new FileReader();
                let vm = this;
                reader.onload = (e) => {
                    vm.image = e.target.result;
                };
                reader.readAsDataURL(file);
            },
            loadKdSp:function(){
                let uri = `/api/kodespmotor/`;
                this.axios.get(uri).then(response => {
                this.insert.kdKatSp = response.data.kdKatSp;
                });
            },
            listSpMotor:function(){
                let uri = `/api/listspmotor/${this.$route.params.id}`;
                this.axios.get(uri).then(response => {
                this.listkatsp = response.data.data;
                });
            },
            loadDetMotor:function(){
                let uri = `/api/motor/${this.$route.params.id}`;
                this.axios.get(uri).then((response) => {
                this.post = response.data.data;
            });
            },
            
        }
    }
</script>