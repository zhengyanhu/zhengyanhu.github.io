<template>
  <div id="app">
      <transition :name="transitionName">
          <keep-alive include="index">
              <router-view></router-view>
          </keep-alive>

      </transition>
  </div>
</template>

<script>
export default {
  data() {
      return {
          transitionName: 'slide' //页面默认动画
      }
  },
  watch: {
      '$route' (to, from) {
        //监听路由变化
        //根据不同的操作执行动画
          if(this.$router.isBack) {
              this.transitionName = "slide";
          }else{
              this.transitionName = "slide_back";
          }
          this.$router.isBack = false;
      }
  }
}
</script>

<style>
*{
    margin: 0;
    padding:0;
}
html,body{
    width: 100%;
    height: 100%;
}
li{
    list-style: none;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  width: 100%;
  height: 100%;
}
.slide-enter,
.slide_back-enter {
    position: absolute;
    width: 100%;
}
.slide-leave,
.slide_back-leave {
    position: absolute;
    width: 100%;
}
.slide-enter-active,
.slide_back-enter-active {
    transition: all 0.3s linear;
}
.slide-leave-active {
    position: absolute;
    transition: all 0.3s linear;
    transform: translate(-100%);
}
.slide-enter{
    transform: translateX(100%);
}
.slide_back-leave-active {
    position: absolute;
    transition: all 0.3s linear;
    transform: translate(100%);
}
.slide_back-enter {
    transform: translateX(-100%);
}
</style>
