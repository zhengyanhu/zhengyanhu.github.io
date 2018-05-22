import Vue from 'vue'
import Router from 'vue-router'
//引入列表页面
import OnboardingMonitoring from '../components/onboardingmonitoring/OnboardingMonitoring'
//引入详情页面
import OnboardingDetail from '../components/onboardingDetail/onboardingDetail'
//路由回退
Router.prototype.goBack = function() {
    this.isBack = true;
    window.history.go(-1);
}
//注册路由
Vue.use(Router)
//添加路由
export default new Router({
  routes: [{
    path: '/',//地址
    name: 'OnboardingMonitoring',
    component: OnboardingMonitoring,//列表页
    meta: {
        keepAlive: true
    }
  }, {
    path:'/onboardingDetail/:id/:name',//地址
    name:'OnboardingDetail',
    component: OnboardingDetail,//详情页
    meta: {
        keepAlive: false
    }
  }]
})
