<template> 
  <b-container class="bv-example-row">
    <h3 class="d-flex justify-content-between my-3 page-header">
      <span>最新课程</span>
      <router-link  :to="{name:'course',query:{curPage:1,typeId:0}}">更多</router-link>
    </h3>

    <b-row>
      <b-col md="3" sm="6" v-for="(item,index) in list" :key="index">
        <router-link  :to="{name:'course_detail',query:{cid:item.cid}}">
          <img :src="require(`@/assets/${item.pic}`)" class="my-3">
        </router-link>
        <router-link  :to="{name:'course_detail',query:{cid:item.cid}}">{{item.title}}</router-link>
        <div>讲师:{{item.tname}}</div>
        <h5 class="text-danger">&yen;{{item.price}}</h5>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
export default {
  name:"HomeCourse",
  data(){
    return {
      list:[],
      countNum:4
    }
  },
  methods:{
    getCourse(){
      this.$axios.get("/course/newest",{
        params:{
          countNum:this.countNum
        }
      }).then((res)=>{
        if(res.data.code==200){
          this.list= res.data.data
        }
        console.log(this.list)
      }).catch((err)=>{
        console.log(err);
      });
    }
  },
  mounted(){
    this.getCourse();
  }
}
</script>

<style scoped>
  .page-header{
    border-bottom: 2px solid #ddd;
  }

</style>