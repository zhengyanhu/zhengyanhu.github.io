<template lang="html">
  <div class="toask">
      <div class="toask-wrap">
          <i class="fa fa-spinner fa-spin fa-2x fa-fw"></i>
          <span>查询中....</span>
      </div>

  </div>
</template>

<script>
export default {
}
</script>

<style scoped lang="css">
.toask {
    color: rgb(56, 156, 228);
    position: absolute;
    height:100%;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 99
}
.toask-wrap{
    display: inline-flex;
    align-items:center;
    border-radius: .3rem;
    background-color: rgba(83, 198, 247, 0.25);
    height: 3rem;
}
</style>
