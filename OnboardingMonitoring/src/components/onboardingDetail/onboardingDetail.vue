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
<style scoped lang="stylus" rel="stylesheet/stylus">
.page
    background-color: #f4f4f4;
    display:flex;
    flex-direction:column;
    width: 100%;
    height: 100%;
    .content
        flex-grow:1;
        overflow:hidden;
        .list_wrap
            padding: 0.5rem;
            font-size: .9rem;
            .item:first-child
                margin-top: 0;
            .item
                display: flex;
                margin-top:.5rem;
                .left_wrap
                    height:2.3rem;
                    line-height:2.3rem;
                    background-color: #5094FF;
                    flex-grow: .25;
                    width:0;
                    border-top-left-radius: .2rem;
                    border-bottom-left-radius: .2rem;
                    .title
                        color:#fff;
                        text-align:center;
                .right_wrap
                    flex-grow .75;
                    width:0;
                    background-color:#fff;
                    padding: 0 .5rem 0 .5rem;
                    border-top-right-radius: .2rem;
                    border-bottom-right-radius: .2rem;
                    border-bottom-left-radius: .2rem;
                    box-shadow: .0665rem .0665rem .125rem .0665rem #ccc;
                    .rw_top
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        height: 2.3rem;
                        line-height: 2.3rem;
                        border-bottom: .0665rem dashed #E0E0E0;
                        .top-txt1
                            flex-grow:1;
                            width:0;
                            color: #4C7FD0;
                            text-overflow: ellipsis;
                            white-space: nowrap;
                            overflow:hidden;
                        .top-txt2
                            background-color: #28d38d;
                            color: #fff;
                            height: 1.5rem;
                            line-height: 1.5rem;
                            padding: 0 .3rem 0 .3rem;
                    .rw_bot
                        padding-bottom: .3rem;
                        .bot_1
                            display: flex;
                            margin-top: .3rem;
                            .bot-txt1
                                color: #B1B1B1;
                                margin-right: .5rem;
</style>
