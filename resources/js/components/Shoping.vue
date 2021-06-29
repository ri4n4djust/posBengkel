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
                let i = localStorage.length;
                while (i-- > 0) {
                    let key = localStorage.key(i);
                    if (localStorage.getItem(key) === index) {
                        localStorage.removeItem(key);
                        this.items.splice(index, 1)
                        aler('berhasil dihapus')
                    }
                }
            }
        }

    }
</script>