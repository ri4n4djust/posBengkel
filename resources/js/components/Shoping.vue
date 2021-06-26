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
               <shoping-cart inline-template :items="cartItems">
                        <div>
                            <table class="table table-cart">
                                <tr v-for="(item, index) in items" :key="item.id">
                                <td>{{item.nmBarang}}</td>
                                <td style="width:120px">QTY:
                                    <input v-model="item.qty" class="form-control input-qty" type="number">
                                </td>
                                <td>
                                    <button @click="removeItem(index)"><span class="glyphicon glyphicon-trash"></span></button>
                                </td>
                                </tr>
                                <tr v-show="items.length === 0">
                                <td colspan="4" class="text-center">Cart is empty</td>
                                </tr>
                                <tr v-show="items.length > 0">
                                </tr>
                            </table>
                        </div>
                        <!-- /.container -->
                    </shoping-cart>
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
                items : products,
                qty: '1',
            }
        },
        props: ['items', 'cartItems'],
        computed: {
            Total() {
            let total = 0;
            this.items.forEach(item => {
                total += (item.price * item.qty);
            });
            return total;
            }
        },

        methods: {
                // Remove item by its index
            removeItem(index) {
            this.items.splice(index, 1)
            }
        }

    }
</script>