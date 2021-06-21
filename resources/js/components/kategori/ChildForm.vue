//ChildForm.vue
<template> 
  <div class="parent-form mb-4"> 
    <form @submit.prevent="submit">
      <div class="form-group">
        <label for="name">Nama</label>
        <input type="text" class="form-control" v-model="category.name" placeholder="Nama sub kategori..">
      </div> 
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div> 
</template>

<script>
  export default {
    name: 'parent-form',
    props: ['parentId'], 
     data(){
      return {
        category: {
          name: '', 
          parent_id: this.parentId
        }
      }
    },
     methods: {
      submit() {
       this.$emit('add-child', this.category)
         this.category = {
          name: ''
        }
      }
    }
  }
</script> 

