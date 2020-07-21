<template>
  <b-container>
    <!-- 面包屑导航 -->
    <BreadCrumb></BreadCrumb>
    <!-- 课程等级导航 -->
    <TypeNav></TypeNav>
    <div class="mb-3" style="border:1px solid green;"></div>
    <b-row v-for="(item,index) in list" :key="index"  class="mb-5">
      <b-col cols="3">
        <router-link :to="{name:'course_detail',query:{cid:item.cid}}">
          <img :src="require(`@/assets/${item.pic}`)" class="img-fluid" alt="">
        </router-link>
      </b-col>
      <b-col cols="5" class="course-desc">
        <router-link :to="{name:'course_detail',query:{cid:item.cid}}">
          <h4>{{item.title}}</h4>
        </router-link>
        <p>讲师:{{item.tname}}</p>
        <p>课时:{{item.cLength}}</p>
        <p>开课时间:{{item.startTime}}</p>
        <p>上课地点:{{item.address}} <a href="" class="text-danger">查看各校区地址</a></p>
      </b-col>
      <b-col cols="2" class="my-5">
        <h2 class="text-danger">&yen;{{item.price.toFixed(2)}}</h2>
      </b-col>
      <b-col cols="2" class="my-5">
        <router-link  :to="{name:'course_detail',query:{cid:item.cid}}" class="btn btn-success">
          查看详情
        </router-link>
      </b-col>
    </b-row>
    <!-- 分页导航 -->
    <b-pagination-nav :link-gen="linkGen" :number-of-pages="pageTotal" use-router></b-pagination-nav>  
  </b-container>
</template>
<script>
import BreadCrumb from "../components/BreadCrumb"
import TypeNav from "../components/TypeNav"
export default {
  name:"Course",
  components:{
    BreadCrumb,
    TypeNav
  },
  data(){
    return {
      list:[],
      curPage:1,
      pageSize:3,
      total:0,
      pageTotal:1,
      typeId:0
    }
  },
  methods:{
    //获取课程列表
    getCourses(){
      this.$axios.get("/course/list",{
        params:{
          // pageNum:this.$route.query.curPage
          curPage:this.curPage,
          typeId:this.typeId
        }
      }).then((res)=>{
        if(res.data.code==200){
          this.list = res.data.data.list;
          // this.pageSize = res.data.data.pageSize;
          this.total = res.data.data.total;
          this.pageTotal = res.data.data.pageTotal;
        }
      }).catch((err)=>{
        console.log(err)
      });
    },
    //获取页码
    linkGen(pageNum) {
        // return pageNum === 1 ? '?' : `?curPage=${pageNum}`
      //  在vue中如何做页面跳转
       return {path:`/course?curPage=${pageNum}&typeId=${this.typeId}`}
      }
  },
  mounted(){
    //组件挂载完成后,给参数赋值
    this.curPage = this.$route.query.curPage;
    this.typeId = this.$route.query.typeId;
    this.getCourses();
  }
}
</script>

<style scoped>
  .course-desc>p{
    margin:0;
  }

</style>