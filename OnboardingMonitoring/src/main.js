// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'

// 将axios添加到vue对象
Vue.prototype.$http = axios
// 生产提示
Vue.config.productionTip = false

/*
 eslint-disable no-new
 创建vue实例
*/
new Vue({
  el: '#app',
  router,
  components: {
       App
    },
  template: '<App/>'
})
