<template>

</template>

<script>

    export default {
        data(){
            return{
                cartItems: [],
                items : [],
                qty: '1',
            }
        },
        props: ['items'],
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