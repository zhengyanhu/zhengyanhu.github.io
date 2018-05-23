<template lang="html">
    <div class="notDate" v-show="!data.length">
        <div class="icon">
            <i class="fa fa-2x fa-exclamation-triangle" aria-hidden="true"></i>
            <span>没有找到相关数据！</span>
        </div>

    </div>
</template>

<script>
export default {
    props:{
        data: {
            type:Array,
            default:[]
        }
    }
}
</script>

<style scoped lang="css">
.notDate {
    text-align: center;
    min-height: inherit;
    background-color: #fff;
    padding-top: 2rem;
    color: #fa5151;
}
.icon {
    display: inline-flex;
    align-items: center;
}

</style>
