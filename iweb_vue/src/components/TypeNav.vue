<template>
  <div class="p-4 bg-light mb-3">
    <span>课程等级:</span>
    <router-link :to="{name:'course',query:{curPage:1,typeId:0}}" :class="typeId==0?'btn btn-success mx-2':'btn mx-2'">不限</router-link>
    <router-link v-for="(item,index) in list" :key="index" :to="{name:'course',query:{curPage:1,typeId:item.tpid}}" :class="typeId==item.tpid?'btn btn-success mx-2':'btn mx-2'">{{item.tpname}}</router-link>
  </div>
</template>
<script>
export default {
  name:"TypeNav",
  data(){
    return {
      list:[],
      typeId:0
    }
  },
  methods:{
    getTypes(){
      this.$axios.get("/type").then(res=>{
        console.log(res)
        if(res.data.code==200){
          this.list = res.data.data;
        }
      }).catch((err)=>{
        console.log(err)
      })
    }
  },
  mounted(){
    //取网址上的参数
    this.typeId = this.$route.query.typeId;
    this.getTypes();
  }
}
</script>
<style scoped>

</style>