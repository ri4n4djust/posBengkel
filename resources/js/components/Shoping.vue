<template>

<div class="mt-3">

<div class="text-right"><button class="btn btn-primary" data-toggle="modal" data-target="#cartModal">Cart ({{cartItems.length}})</button></div>

<!-- Modal --> 
   <div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">          <span aria-hidden="true">&times;</span></button>
               <h4 class="modal-title" id="myModalLabel">Cart</h4>
            </div>
            <div class="modal-body">
                        <div>
                            <table class="table table-cart">
                                <tr v-for="item in crt" :key="item.id">
                                <td>{{item.nmBarang}}</td>
                                <td>{{item.barcode}}</td>
                                <td>QTY:
                                    <input v-model="item.qty" class="form-control input-qty" type="number">
                                </td>
                                <td>
                                    <button @click="removeItem(id = item.id)"><span class="glyphicon glyphicon-trash"></span></button>
                                </td>
                                </tr>
                                <tr v-show="crt.length === 0">
                                <td colspan="4" class="text-center">Cart is empty</td>
                                </tr>
                                <tr v-show="crt.length > 0">
                                </tr>
                            </table>
                        </div>
                        <!-- /.container -->
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>

</div>
</template>

<script>

    export default {
        data(){
            return{
                cartItems: [],
                items : [],
                qty: '1',
                crt: [],
            }
        },
        //props: ['items'],
        computed: {
        
        },
        created() {
        this.getCart();
        if (this.crt === null){
                        this.crt = [];
                    }
        },
        methods: {
            removeItem(id) {
                //alert(id)
                var arrayFromStroage = JSON.parse(localStorage.getItem('cartItems'));
                const filtered = arrayFromStroage.filter(arrayFromStroage => arrayFromStroage.id !== id);
                localStorage.setItem('cartItems', JSON.stringify(filtered));
                //this.items.splice(index, 1)
                //this.crt = JSON.parse(localStorage.getItem('cartItems'))
                this.getCart();
                alert('berhasil dihapus')
                
            },
            getCart: function() {
                this.crt = JSON.parse(localStorage.getItem('cartItems'))
            },
        }

    }
</script>