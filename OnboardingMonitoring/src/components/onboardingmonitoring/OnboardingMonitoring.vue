<template lang="html">
  <div class="page">
    <!-- 头部组件 -->
      <m-header :classObj="classObj" :classObj1="classObj1" :title="title" v-on:navBtn="navBtn"></m-header>
      <!-- 头部组件结束 -->
      <!-- 查询模块 -->
      <section class="search_wrap">
          <div class="cp">
              <input type="text" v-model="name" value="" placeholder="呈批件名">
          </div>
          <div class="cp">
              <input type="text" v-model="code" value="" placeholder="呈批代码">
          </div>
          <div @click="search" class="searchBtn">
              搜索
          </div>
      </section>
      <!-- 查询模块结束 -->
      <!-- 内容列表 -->
      <div class="content" ref="wrapper">
          <div class="scroll-content">
              <div ref="listWrapper">
                 <notdata :data="items"></notdata>
                  <ul class="list_wrap">
                     <!-- 下拉刷新样式 -->
                      <div class="pullDown">
                          <div v-if="beforePullDown">
                              <div class="refresh-repeat" :style="pullDownStyle">
                                  <span class="fa fa-repeat"></span>
                              </div>
                          </div>
                          <div v-else>
                              <loading :msg="loadingMsg" v-if="isPullingDown"></loading>
                              <p v-else>{{ pullDownTxt }}</p>
                          </div>
                      </div>
                      <!-- 下拉刷新结束 -->
                      <li class="item" @click="openDataiPage(item)" v-for="item in items">
                         <div class="item_top">
                            <p class="top-txt1">{{ item.name }}</p>
                            <p class="top-txt2">{{ item.status }}</p>
                         </div>
                         <div class="item_bot">
                             <div class="bot_item">
                                 <div class="bot_1">
                                     <p class="bot-txt1">呈批件代码</p>
                                     <p class="pt1 bot-txt2">{{ item.code }}</p>
                                 </div>
                                 <div class="bot_1">
                                     <p  class="bot-txt1">招聘人数</p>
                                     <p  class="pt1 bot-txt2">{{ item.recruitNumber }}</p>
                                 </div>
                             </div>
                             <div class="bot_item">
                                 <div class="bot_1">
                                     <p class="bot-txt1">所属部门</p>
                                     <p class="bot-txt2">{{ item.airportCode }}</p>
                                 </div>
                                 <div class="bot_1">
                                     <p  class="bot-txt1">完成时间</p>
                                     <p  class="pt1 bot-txt2">{{ item.finishTime }}</p>
                                 </div>
                             </div>
                             <div class="bot_item">
                                 <div class="bot_1">
                                     <p class="bot-txt3">备注</p>
                                     <p class="bot-txt2">{{ item.remark }}</p>
                                 </div>
                             </div>
                         </div>
                     </li>
                  </ul>
              </div>
              <!-- 上拉样式 -->
              <div class="pullUp">
                  <div v-if="isPullingUp">
                    <loading :msg="loadingMsg"></loading>
                  </div>
                  <div v-else>
                     <p>{{ pullUpTxt }}</p>
                  </div>
              </div>
              <!-- 上拉样式结束 -->
          </div>
      </div>
      <!-- 内容列表结束 -->
      <!-- 提示框组件 -->
      <toask v-if="toasking"></toask>
      <!-- 提示框结束 -->
    </div>
</template>

<script>
//引入滚动插件
import BScroll from 'better-scroll'
//头部组件
import MHeader from '../m-header/header'
//加载组件
import Loading from '@/components/loading/loading'
//无数据时组件
import Notdata from '@/components/notdata/notdata'
//提示框
import Toask from '@/components/toask/toask'
//引入api
import {URL,commonParams,assemblyUrl} from '@/common/js/api'
//工具
import {getRect} from '@/common/js/tools'
export default {
    name:'index',
    mounted() {
        //this.getData();
        setTimeout(() => {
            this.initScroll();
        },20);
    },
    data() {
        return {
            title:"入职监控",
            classObj:{
                'fa':true,
                'fa-chevron-left':true,
                'fa-2x':true
            },
            classObj1:{},
            items:[],
            options:{
                pullDownRefresh: {
                    threshold: 60,
                    stop: 50
                },
                pullUpLoad: {
                    threshold: 0
                },
                click: true
            },
            isPullingDown:false,//下拉
            isPullingUp: false,//上拉
            beforePullDown:true,//下拉之前
            isRebounding:false,//下拉复原之前
            pullUpDirty:true,//是否触发更新
            name:'',
            code:'',
            loadingMsg:'',
            toasking:false,
            total:null,
            pullDownStyle:''//下拉时改变样式
        }
    },
    methods:{
        navBtn(type) {
          //退出磁帖
            if(type === 'left') {
                uexWidget.finishWidget('');
            }
        },
        search() {
          //搜索按钮
            this.toasking = true;
            //搜索时从第0页开始查询
            commonParams.curPage = 0;
            this.getData();
        },
        openDataiPage(item) {
            this.$router.push({
                path:`/onboardingDetail/${item.recruitId}/${item.name}`,
                params:{
                    id:item.recruitId,
                    name:item.name
                }
            });
        },
        initScroll() {
            let me = this;
            //设置最小高度
            if (this.$refs.listWrapper && (this.options.pullDownRefresh || this.options.pullUpLoad)) {
                this.$refs.listWrapper.style.minHeight = `${getRect(this.$refs.wrapper).height + 1}px`
            }
            //如果dom还未加载时不创建滑动实例
            if (!this.$refs.wrapper) {
              return
            }
            //创建滚动实例
            this.scroll = new BScroll(this.$refs.wrapper,this.options);
            //监听下拉
            if(this.options.pullDownRefresh){
                this.scroll.on('pullingDown',() => {
                    me.beforePullDown = false;
                    me.isPullingDown = true
                    me.pullDown();
                });
            }
            //监听上拉
            if(this.options.pullUpLoad) {
                this.scroll.on('pullingUp',() => {
                    me.isPullingUp = true;
                    me.pullUp();
                });
            }
            //监听滚动
            this.scroll.on('scroll', (pos) => {
                if (!me.options.pullDownRefresh) {
                  return
                }
                var rot = pos.y * 6 > 360 ? 360 : pos.y * 6;
                this.pullDownStyle = `transform:rotate(${rot}deg);`
                //console.log(pos.y)
          });
        },
        pullDown() {
            this.loadingMsg = '正在刷新';
            setTimeout(() => {
                commonParams.curPage = 0;
                this.getData();
            },1000);
        },
        pullUp() {
            this.loadingMsg = '正在加载';
            setTimeout(() => {
                if((commonParams.curPage+1) * commonParams.pageSize >= this.total){
                    //当需要刷新的数据数 > 总数时，curPage不再增加，同时不再请求数据。
                    this.forceUpdate()
                    return;
                }
                ++commonParams.curPage;
                this.getData();
            },1000);
        },
        /**
         * [forceUpdate 数据改变时更新视图]
         * @param  {[type]} dirty [dirty 为true时，代表数据有更新，否则没有更新]
         * @return {[type]}       [description]
         */
        forceUpdate(dirty) {
            if(this.isPullingDown && this.isPullingDown) {
                this.isPullingDown = false;
                this.reboundPullDown().then(() => {
                    this.afterPullDown();
                });
                this.pullDownDirty = dirty;
            }else if(this.isPullingUp && this.isPullingUp){
                this.isPullingUp = false;
                this.scroll.finishPullUp();
                this.pullUpDirty = dirty;
            }else {
                this.scroll.refresh();
            }
        },
        reboundPullDown() {
            const stopTime = 600;
            return new Promise((resolve) => {
                setTimeout(() => {
                    this.isRebounding = true
                    this.scroll.finishPullDown();
                    resolve()
                }, stopTime);
            });
        },
        /**
         * [afterPullDown 完成刷新后执行动作]
         * @return {[type]} [description]
         */
        afterPullDown() {
            this.beforePullDown = true;
            this.isRebounding = false;
            this.scroll.refresh();
        },
        getData() {
            var vue = this;
            //长度
            var len = vue.items.length;
            //请求参数
            var params = Object.assign({}, commonParams, {
                name:this.name,
                code:this.code
            });
            console.log(params)
            this.$http.get(URL+'zyh_queryByPage?'+ assemblyUrl(params))
            .then(function(result) {
                vue.toasking = false;
                /**
                 * [count 数据总数]
                 * [data 本次获取的数据]
                 * [status 状态 0失败1成功]
                 * @type {[type]}
                 */
                var {count,data,status} = JSON.parse(result.data.queryByPage);
                if(count === 0) {
                    //如果count = 0 代表没有数据。
                    vue.items = [];
                    vue.forceUpdate();
                    return;
                }
                if(data.length >= 1) {
                    if(vue.total === null) {
                        vue.total = count; //记录数据总数
                    }
                    //如果有数据
                    let newData = [];
                    data.forEach(function(item) {
                        if(item.status === 'FINISH') item.status = '已完成';
                        if(item.status === 'DOING') item.status = '执行中';
                        if(!item.finishTime) item.finishTime = '未知';
                        switch(item.airportCode) {
                            case 'PDZP':
                                item.airportCode = "浦东站坪";
                                break;
                            case 'HQZP':
                                item.airportCode = "虹桥站坪";
                                break;
                            case 'PDZX':
                                item.airportCode = "浦东装卸";
                                break;
                            case 'HQZX':
                                item.airportCode = "虹桥装卸";
                                break;
                            case 'SHXL':
                                item.airportCode = "上海行李";
                                break;
                            default:
                                item.airportCode = "未知";
                        }
                        newData.push(item);
                    });
                    if(commonParams.curPage === 0) {
                        //如果curPage = 0 清空数组。
                        vue.items = [];
                        vue.items = vue.items.concat(newData);
                        return;
                    }
                    vue.items = vue.items.concat(newData);
                }else{
                    //如果没有数据
                    vue.forceUpdate();
                }

            })
            .catch(function(error) {
              //失败时手动调用计算方法。
                vue.forceUpdate();
                console.log(error);
            })
        }
    },
    watch: {
        items() {
        //当items数据发生变化
        //刷新滚动插件，重新计算滚动高度
            setTimeout(() => {
                this.forceUpdate(true);
            },20)
        }
    },
    computed: {
      //计算属性
        pullDownTxt() {
            return '刷新成功'
        },
        pullUpTxt() {
            return this.pullUpDirty ? '上拉加载':'没有更多数据了'
        }
    },
    components:{//组件
        MHeader,
        Loading,
        Notdata,
        Toask
    }
}
</script>
<style scoped lang="stylus" rel="stylesheet/stylus">
.pt1
    padding-top: .1rem;
.page
    width:100%;
    height:100%;
    display: flex;
    flex-direction:column;
    .search_wrap
        background-color:#fff;
        .cp
            margin-left:1rem;
            border-bottom: .0665rem solid #E0E0E0;
            input
                border:none;
                min-height:2.5rem;
                min-width:100%;
                font-size: 1rem;
        .searchBtn
            text-align:center;
            line-height:2.5rem;
            background-color:#4379CF;
            width:95%;
            margin: .5rem auto;
            color:#fff;
            border-radius:0.3rem;
    .content
        flex-grow:1;
        overflow:hidden;
        background-color:#F4F4F4;
        .pullUp
            height:2rem;
            line-height:2rem;
            text-align:center;
            width:100%;
        .list_wrap
            padding:.5rem;
            .pullDown
                position: absolute;
                top:-35px;
                z-index: -1;
                text-align:center;
                width:100%;
                .refresh-repeat
                    transform:rotate(0deg);
            .item:last-child
                margin-bottom:0;
            .item
                font-size:.9rem;
                margin: 0 auto;
                background-color:#fff;
                border-radius: .2rem;
                margin-bottom:.5rem;
                .item_top
                    border-bottom: 1px solid #E0E0E0;
                    display:flex;
                    justify-content: space-between;
                    padding: .45rem;
                    p
                        font-size:.9rem;
                    .top-txt1
                        max-width: 60%;
                        overflow: hidden;
                        white-space: nowrap;
                        text-overflow: ellipsis
                        color:#4C7FD0;
                    .top-txt2
                        color:#75CDE2;
                        background-color:#DDF9FF;
                        text-align:center;
                        padding:.15rem .5rem .15rem .5rem;
                .item_bot
                    padding: .45rem;
                    .bot_item
                        margin-top:.45rem;
                        display:flex;
                        .bot_1
                            display:flex;
                            flex-grow:1;
                            width:0;
                            .bot-txt1
                                color: #b1b1b1;
                                flex-grow:1;
                                width:0;
                            .bot-txt2
                                flex-grow:1.1;
                                width:0;
                            .bot-txt3
                                color: #b1b1b1;
                                flex-grow:.2;
</style>
