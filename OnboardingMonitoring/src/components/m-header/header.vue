<template lang="html">
    <header class="header">
        <div class="head">
            <div class="btn-nav" v-if="classObj.fa" @click="back">
                <span class="icon" :class="classObj"></span>
            </div>
            <div class="btn-nav" v-else></div>
            <h1 class="title">{{ title }}</h1>
            <div class="btn-nav" v-if="classObj1.fa" @click="push">
                <span class="icon" :class="classObj1"></span>
            </div>
            <div class="btn-nav" v-else></div>

        </div>
    </header>
</template>

<script>
export default {
    methods:{
        back: function() {
            this.$emit("navBtn","left");
        },
        push: function() {
            this.$emit("navBtn","right");
        }
    },
    props: {
        title: {
            type: String,
            default: '',
    },
    classObj:{
        type: Object,
        default:{}
    },
    classObj1:{
        type: Object,
        default:{}
    }
  }
}
</script>

<style scoped lang="stylus" rel="stylesheet/stylus">
.header{
    background-color: #2A5290;
    color:#fff;
    text-align: center;
    width: 100%;
}
.head{
    display: flex;
    justify-content: space-between;
}
.title{
    font-size: 1.1rem;
    white-space:nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    padding: .72rem 1rem .72rem;
    max-width:9rem;
}
.btn-nav{
    min-width:4rem;
    min-height:2rem;
    padding-top:.8rem;
}
.icon{
    font-size:1.6rem;
}
</style>
