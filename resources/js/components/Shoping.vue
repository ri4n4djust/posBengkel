<template>

<div class="mt-3">

<div class="text-right"><button class="btn btn-primary" data-toggle="modal" data-target="#cartModal">Cart ({{ isicart }}) Items</button></div>

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
                                <thead>
                                    <tr>
                                        <th>Barcode</th>
                                        <th>Nama</th>
                                        <th>Qty</th>
                                        <th>Del</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in crt" :key="item.id">
                                        <td>{{ item.barcode }}</td>
                                        <td>{{ item.nmBarang }}</td>
                                        <td>
                                            <input v-model="crt[index].qty" @keyup="updateItem(barcode = item.barcode, index)" class="form-control input-qty" type="text" min="1">
                                        </td>
                                        <td>
                                            <button @click="removeItem(id = item.id)"><span class="glyphicon glyphicon-trash"></span></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.container -->
            </div>
            <div class="modal-footer">
                <button @click="printOrder(printMe)" class="btn btn-default">Print Order</button>
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

            <div id="printMe" >
                            <table class="table" >
                                <thead>
                                    <tr>
                                        <th>Barcode</th>
                                        <th>Nama</th>
                                        <th>Qty</th>
                                    </tr>
                                </thead>
                               <tbody>
                                    <tr v-for="item in crt" :key="item.id">
                                        <td>{{item.barcode}}</td>
                                        <td>{{item.nmBarang}}</td>
                                        <td>{{item.qty}}</td>
                                    </tr>
                               </tbody>
                            </table>
                        </div>


         </div>
      </div>
   </div>


                        
                        


</div>
</template>

<style scoped>
    #printMe { display: none; }
    @media print
    {
      @page{
        margin: 0;
      }
      body * {
        visibility: hidden;
      }
      #printMe {
        display: block;
        font-size: 12px;
      }
      table { font-size: 12px; }
     }
</style>
<script>

    export default {
        data(){
            return{
                cartItems: [],
                items : [],
                qty: '1',
                crt: [],
                printMe: '',
                isicart: 0,
            }
        },
        //props: ['crt'],
        computed: {
        
        },
        created() {
            this.getCart();
        },
        mounted(){
           
            //this.isicart = localStorage.getItem('cartItems').length;
          
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
                this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItems'))).length,
                alert('berhasil dihapus')
                
            },
            updateItem(barcode, index) {
                const cartItems = JSON.parse(localStorage.getItem('cartItems'));
                const objIndex = cartItems.findIndex((e => e.barcode === barcode));
                const newQty = parseInt(this.crt[index].qty) ;
                cartItems[objIndex].qty = parseInt(newQty);
                localStorage.setItem('cartItems',JSON.stringify(cartItems));
                //alert('Quantity Update')
                this.getCart();
                this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItems'))).length;
            },
            getCart: function() {
                 if (this.crt === null){
                            this.crt = localStorage.setItem('cartItems', '[]');
                        }else{
                this.crt = JSON.parse(localStorage.getItem('cartItems'))
                this.isicart = JSON.parse(localStorage.getItem('cartItems')).length;
                        }
            },
            printOrder(printMe) {
                window.print(printMe);
                localStorage.setItem('cartItems', '[]');
                this.isicart = Object.keys(JSON.parse(localStorage.getItem('cartItems'))).length,
                this.crt = [];
                $('#cartModal').modal('hide');
            },
        }

    }
</script>