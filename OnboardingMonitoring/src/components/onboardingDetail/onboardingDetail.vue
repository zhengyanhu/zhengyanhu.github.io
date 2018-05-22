<template lang="html">
    <div class="page">
      <!-- 头部组件 -->
        <m-header :title="title" :classObj="classObj" :classObj1="classObj1" v-on:navBtn="navBtn"></m-header>
        <!-- 头部组件结束 -->
        <!-- 内容区域 -->
        <main class="content" ref="wrapper">
            <ul class="list_wrap">
                <li  class="item" v-for="item in items">
                    <div class="left_wrap">
                        <p class="title">{{ item.taskDept }}</p>
                    </div>
                    <div class="right_wrap">
                        <div class="rw_top">
                            <p class="top-txt1">{{ item.name }}</p>
                            <p class="top-txt2">{{ item.status }}</p>
                        </div>
                        <div class="rw_bot">
                            <div class="bot_1">
                                <p class="bot-txt1">流程进行天数:</p>
                                <p>{{ item.workDay }}</p>
                            </div>
                            <div class="bot_1">
                                <p class="bot-txt1">计划完成天数:</p>
                                <p>{{ item.planTime }}</p>
                            </div>
                            <div class="bot_1">
                                <p class="bot-txt1">预计完成天数:</p>
                                <p>{{ item.expectedTime }}</p>
                            </div>
                            <div class="bot_1">
                                <p class="bot-txt1">实际完成天数:</p>
                                <p>{{ item.finishTime }}</p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </main>
        <!-- 内容区域 -->
    </div>
</template>

<script>
import MHeader from '../m-header/header'//加载头部组件
import BScroll from 'better-scroll'//引入滚动插件
import {URL,commonParams,assemblyUrl} from '@/common/js/api'//引入api
export default {
    mounted() {
        this.getData();
    },
    data() {
        return {
            title: this.$route.params.name,//当前路由穿过的标题
            classObj: {//font字体图标
                'fa': true,
                'fa-chevron-left': true,
                'fa-2x': true
            },
            classObj1:{},
            items:[]//列表数据
        }
    },
    methods:{
        navBtn:function(type){
          //返回上一页面
            if( type === "left"){
                this.$router.goBack();
            }
        },
        initScroll() {
          //初始化滚动插件
            this.scroll = new BScroll(this.$refs.wrapper,{
                scrollY: true,//纵向滚动
                click: true//可以点击
            })
        },
        getData: function() {
          //根据从路由中获取的值查找数据
            var vue = this;
            //请求的参数
            var params = {
                recruitId:this.$route.params.id
            };
            this.$http.get(URL + 'zyh_queryTasks?' + assemblyUrl(params))
            .then(function(result) {
              //解构赋值
                let {data,status} = JSON.parse(result.data.queryTasks)
                data.forEach(function(item) {
                    if(item.status == 'FINISH') item.status = '已完成'
                    if(item.status == 'WAIT') item.status = '未启动'
                    item.planTime = assemblyTime(item.planTime)
                    item.expectedTime = assemblyTime(item.expectedTime)
                    item.finishTime = assemblyTime(item.finishTime)
                });
                vue.items = data;
				//加载滚动插件
                setTimeout(() => {
                    vue.initScroll();
                },20)

            })
            .catch(function(error) {
              //失败
                console.log(error)
            })
            //格式化时间
            function assemblyTime(obj) {
                if(obj === null || !obj || obj === "null") {
                    return '暂无'
                }else{
                    var year = Number(obj.year) + 1900;
                    var month = Number(obj.month) + 1;
                    var date = obj.date;
                    if(month < 10) month = "0" + month
                    if(date < 10) date = "0" + date;
                    return year + "-" + month + "-" + date;
                }
            }
        }
    },
    components:{//组件
        MHeader
    }
}
</script>
