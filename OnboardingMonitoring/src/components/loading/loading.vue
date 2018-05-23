<template lang="html">
  <div class="loading">
      <img src="./loading.gif" alt="loading">
      <span>{{ msg }}</span>
  </div>
</template>

<script>
export default {
    props:{
        msg: {
            type:String,
            default:''
        }
    }
}
</script>

<style scoped lang="css">
img{
    width: 1.2rem;
    height: 1.2rem;
    vertical-align: middle;
}
</style>
