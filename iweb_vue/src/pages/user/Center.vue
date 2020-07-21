<template>
  <b-container>
    <b-breadcrumb :items="items" class="bg-transparent"></b-breadcrumb>
    <b-row>
      <b-col cols="3">
        <b-list-group class="mr-5">
          <b-list-group-item active><router-link to="" class="text-light">个人中心首页</router-link></b-list-group-item>
          <b-list-group-item><router-link to="">我的课程</router-link></b-list-group-item>
          <b-list-group-item><router-link to="">我的收藏</router-link></b-list-group-item>
          <b-list-group-item><router-link to="">个人资料</router-link></b-list-group-item>
          <b-list-group-item><router-link to="">修改密码</router-link></b-list-group-item>
          <b-list-group-item><router-link to="">收货地址管理</router-link></b-list-group-item>
        </b-list-group>
      </b-col>
      <b-col cols="9">
        <div class="user_main">
        <div class="user_info">
          <h2>{{uname}}，您好~欢迎来到会员中心！</h2>
          <p><span>邮箱：hanxl@tedu.cn</span><span>手机号：18501051518</span><a href="">修改资料</a></p>
          <p>您在i前端共购买过10门课程，其中已学完3门，剩余7门。</p>
        </div>
        <section class="user_course">
          <h2 class="title3"><span>我购买的课程</span></h2>
          <b-row>
            <b-col cols="4" v-for="(item,index) in orderList" :key="index">
              <div class="uc_img">
                <router-link :to="{name:'course_detail',query:{cid:item.courseId}}">
                  <img :src="require(`@/assets/images/${item.pic}`)" alt="" class="my-3 img-fluid"/>
                  <span>未学习</span>
                </router-link>
              </div>
              <router-link :to="{name:'course_detail',query:{cid:item.courseId}}">{{item.title}}</router-link>
            </b-col>
          </b-row>
        </section>
        <section class="user_course">
            <h2 class="title3"><span>我的收藏</span></h2>
            <b-row>
            <b-col cols="4" v-for="(item,index) in favoriteList" :key="index">
              <div class="uc_img">
                <router-link :to="{name:'course_detail',query:{cid:item.courseId}}">
                  <img :src="require(`@/assets/images/${item.pic}`)" alt="" class="my-3 img-fluid"/>
                  <span>未学习</span>
                </router-link>
              </div>
              <router-link :to="{name:'course_detail',query:{cid:item.courseId}}">{{item.title}}</router-link>
            </b-col>
          </b-row>
        </section>
        </div>
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
export default {
  name:'Center',
  data(){
    return {
      items: [
          {
            text: '首页',
            to:{name:'home'}
          },          
          {
            text: '用户中心',
            active: true
          }
        ],
        uname:sessionStorage.getItem("uname"),
        orderList:[],
        favoriteList:[]
    }
  },
  methods:{
    //获取用户订单列表
    getOderList(){
      this.$axios.post("/orders/list",this.$qs.stringify(
        {userId:sessionStorage.getItem("uid")}
      )).then(res=>{
        console.log(res)
        if(res.data.code==200){
          this.orderList = res.data.data;
        }
      }).catch(err=>{
        console.log(err)
      })
    },
    getFavoriteList(){
      this.$axios.post("/favorite/list",this.$qs.stringify(
        {uid:sessionStorage.getItem("uid")}
      )).then(res=>{
        console.log(res)
        if(res.data.code==200){
          this.favoriteList = res.data.data;
        }
      }).catch(err=>{
        console.log(err)
      })
    },
  },
  mounted(){
    this.getOderList();
    this.getFavoriteList();
  }
}
</script>
<style scoped>
/* 面包屑导航 */
  .breadcrumb-item + .breadcrumb-item::before {
      display: inline-block;
      padding-right: 1rem;
      color: #6c757d;
      content: ">";
  }
  /* 我的课程中心 */
  .user_main {
      float: right;
      width: 740px;
  }
  .user_info {
      margin-bottom: 40px;
  }
  .user_info>h2 {
      font-size: 18px;
      font-weight: lighter;
      line-height: 30px;
  }
  .user_info>p {
      margin-bottom: 25px;
      font-size: 14px;
  }
  .user_info>p>span {
      font-size: 12px;
      color: #999;
      padding-right: 18px;
  }
  .user_info>p>a {
      font-size: 12px;
      color: #f60;
      text-decoration: underline;
  }
  /*课程*/
  .title3 {
      height: 30px;
      border-bottom: 2px solid #ddd;
      font-weight: lighter;
  }
  .title3>span {
      padding-bottom: 9px;
      float: left;
      font-size: 16px;
      border-bottom: 2px solid #57bc4c;
  }
  /*收藏*/
  .user_course {
      margin-bottom: 40px;
  }
  .user_course>ul>li {
      float: left;
      margin: 20px 40px 0 0;
  }
  .user_course>ul>li:nth-child(3n) {
      margin-right:0;
  }
  .user_course>ul>li>a {
      display: block;
  }
  .user_course>ul>li>a:hover {
      background: #f5f5f5;
  }
  .user_course .uc_img {
      width: 220px;
      height: 138px;
      overflow: hidden;
      position: relative;
  }
  .user_course .uc_img img {
      display: block;
      width: 220px;
  }
  .user_course .uc_img span {
      position: absolute;
      bottom:0;
      right:0;
      width: 60px;
      height: 26px;
      background: #e6b266;
      color: #fff;
      text-align: center;
      line-height: 26px;
  }
  .user_course .uc_img span.history {
      background: #666;
  }
  .user_course>ul>li p {
      text-align: center;
      font-size: 14px;
      line-height: 40px;
  }
</style>