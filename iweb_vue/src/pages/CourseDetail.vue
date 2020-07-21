<template>
  <b-container>
    <b-breadcrumb :items="items" class="bg-transparent"></b-breadcrumb>
    <b-row class="mb-5">
      <b-col md="6" sm="12">
        <img :src="detail.pic" style="width:400px" class="img-fluid" alt="">
      </b-col>
      <b-col md="6" sm="12">
        <h2>{{detail.title}}</h2>
        <ul class="list-unstyled">
          <li>讲师:{{detail.tname}}</li>
          <li>课时:{{detail.cLength}}</li>
          <li>开课时间:{{detail.startTime}}</li>
          <li>上课地点:{{detail.address}}<router-link :to="{name:'address'}">查看各校区地址</router-link></li> 
        </ul>
        <div class="mb-2">课程价格:<h3 class="text-danger d-inline-block ml-2">&yen;{{detail.price}}</h3></div> 
        <div>
          <span class="btn btn-warning" @click="addCart"><em class="icon-cart"></em>加入购物车</span>          
          <a href="javascript:;" class="btn btn-secondary ml-3" @click="addFavorite">加入收藏</a>
        </div>
      </b-col>
    </b-row>
    <h2 class="pageHeader">课程详情</h2>
    
    <b-row class="my-3">
      <b-col cols="12">
        <div v-html="detail.details"></div>
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
export default {
  name:"CourseDetail",
  data(){
    return {
      detail:{},
      items: [
          {
            text: '首页',
            to:{name:'home'}
          },          
          {
            text: '商品详情',
            active: true
          }
        ]
    }
  },
  methods:{
    getDetail(){
      this.$axios.get("/course/detail",{
        params:{
          cid:this.$route.query.cid
        }
      }).then(res=>{
        console.log(res)
        this.detail = res.data.data;
        //图片地址单独赋值
        this.detail.pic = require("@/assets/"+this.detail.pic);
      }).catch(err=>{
        console.log(err);
      })
    },
    addCart(){
      if(this.$global.isLogin){
        this.$axios.post("/cart/add",this.$qs.stringify(
          {
            cid:this.$route.query.cid,
            uid:sessionStorage.getItem('uid')
          }
          )).then(res=>{
          console.log(res)        
          alert("add cart success");      
          }).catch(err=>{
          console.log(err)
          })
        }else{
          //如果没有登录,则跳转到登录页面
          alert("please login")
          this.$router.push("/login");
        }
      },
    addFavorite(){
      if(this.$global.isLogin){
        this.$axios.post("/favorite/add",this.$qs.stringify(
          {
            cid:this.$route.query.cid,
            uid:sessionStorage.getItem("uid")
          }
        )).then(res=>{
          console.log(res)
          if(res.data.code==200){
            alert("add favorite success")
          }else if(res.data.code==201){
            alert("favorite exists")
          }
        }).catch(err=>{
          console.log(err);
        })
      }else{
        alert("please login");
        this.$router.push("/login")
      }
    }
  },
  mounted(){
    this.getDetail();
  }
}
</script>
<style scoped>
  .breadcrumb-item + .breadcrumb-item::before {
    display: inline-block;
    padding-right: 1rem;
    color: #6c757d;
    content: ">";
}
.icon-cart {
    display: inline-block;
    vertical-align: middle;
    width: 19px;
    height: 14px;
    background: url(~@/assets/images/iconlist.png) no-repeat 0 -210px;
    margin-right: 9px;
    margin-top: -4px;
}
.pageHeader{
  border-bottom: 2px solid #ddd;
  margin:10px 0px;
}
</style>