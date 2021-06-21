<template> 
  <div class="parent-form mb-4"> 
    <form @submit.prevent="submit">
      <div class="form-group">
        <label for="name">Nama</label>
        <input type="text" class="form-control" v-model="category.name" placeholder="Nama kategori..">
      </div> 
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div> 
</template>

<script>
  export default {
    name: 'parent-form',
     data(){
      return {
        category: {
          name: '', 
          parent_id: null
        }
      }
    },
     methods: {
      submit() {
       this.$emit('add-parent', this.category)
         this.category = {
          name: ''
        }
      }
    }
  }
</script>

