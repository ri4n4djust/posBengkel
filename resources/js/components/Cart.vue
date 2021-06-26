<template>
    <div class="mt-3">
<div id="app" class="container">
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
                           <td>{{item.title}}</td>
                           <td style="width:120px">QTY:
                              <input v-model="item.qty" class="form-control input-qty" type="number">
                           </td>
                           <td class="text-right">${{item.price}}</td>
                           <td>
                              <button @click="removeItem(index)"><span class="glyphicon glyphicon-trash"></span></button>
                           </td>
                        </tr>
                        <tr v-show="items.length === 0">
                           <td colspan="4" class="text-center">Cart is empty</td>
                        </tr>
                        <tr v-show="items.length > 0">
                           <td></td>
                           <td class="text-right">Cart Total</td>
                           <td class="text-right">${{Total}}</td>
                           <td></td>
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
	
   <div class="container">
      <div class="row">
         <div class="col-xs-3 text-center" v-for="item in items" :key="item.id">
            <img class="img-responsive" :src="item.image" alt="">
            <h5>{{ item.title }}</h5>
            <h6>${{ item.price  }}</h6>
            <p class="text-center"><input v-model="item.qty" type="number" class="form-control" placeholder="Qty" min="1"/></p>
							 
               <button @click="addToCart(item)" class="btn btn-sm btn-primary">Add to Cart</button>
            
         </div>
      </div>
   </div>
</div>

    </div>   
  
  
</template>
<style>
.container{
  padding:20px;
  max-width:600px;
}

.input-qty {
  width: 60px;
  float: right
}

.table-cart > tr > td {
  vertical-align: middle !important;
}

</style>

<script>
  export default {
        data() {
           
            const products = [
                {id: 1,title: 'Macbook Pro', price: 2500.00, qty: 1, image: 'http://lorempixel.com/150/150/'},  
                {id: 2,title: 'Asus ROG Gaming',price: 1000.00, qty: 1,image: 'http://lorempixel.com/150/150/'},  
                {id: 3,title: 'Amazon Kindle',price: 150.00,qty: 1,image: 'http://lorempixel.com/150/150/'},  
                {id: 4,title: 'Another Product',price: 10, qty: 1, image: 'http://lorempixel.com/150/150/'},  
            ];
            return {
                cartItems: [],
                items : products

            }
        },

      
        computed: {
            Total() {
            let total = 0;
            this.items.forEach(item => {
                total += (item.price * item.qty);
            });
            return total;
            }
        },
        //props: ['value'],

        methods: {
            // Remove item by its index
            removeItem(index) {
            this.items.splice(index, 1)
            },
            // Add Items to cart
            addToCart(itemToAdd) {
            let found = false;
            // Add the item or increase qty
            let itemInCart = this.cartItems.filter(item => item.id===itemToAdd.id);
            let isItemInCart = itemInCart.length > 0;

            if (isItemInCart === false) {
                this.cartItems.push(Vue.util.extend({}, itemToAdd));
            } else {
                        itemInCart[0].qty += itemToAdd.qty;
                    }
                    
                    itemToAdd.qty = 1;
                    alert('sukses')
            }
            
        },
        
    }
</script>
