<template>
  <b-container fluid class="bg-success">
    <b-container>
      <b-navbar toggleable="sm" type="dark" variant="success">
        <b-navbar-brand to="/">首页</b-navbar-brand>
        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-item :to="{name:'course',query:{curPage:1,typeId:0}}">全部课程</b-nav-item>
            <b-nav-item :to="{name:'course',query:{curPage:1,typeId:1}}">基础课程</b-nav-item>
            <b-nav-item :to="{name:'course',query:{curPage:1,typeId:2}}">核心课程</b-nav-item>
            <b-nav-item :to="{name:'course',query:{curPage:1,typeId:3}}">进阶课程</b-nav-item>
            <b-nav-item to="/teacher">名师堂</b-nav-item>
            <b-nav-item to="/address">校区</b-nav-item>
          </b-navbar-nav>

          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto">
            <b-nav-item-dropdown right>
              <!-- Using 'button-content' slot -->
              <template v-slot:button-content>
                <em>用户</em>
              </template>
              <b-dropdown-item :to="{name:'register'}"  v-if="$global.isLogin == false">注册</b-dropdown-item>
              <b-dropdown-item :to="{name:'login'}"   v-if="$global.isLogin == false">登录</b-dropdown-item>
              <b-dropdown-item :to="{name:'user_center'}" v-if="$global.isLogin == true">{{uname}}的用户中心</b-dropdown-item>
              <b-dropdown-item href="#" v-if="$global.isLogin == true" @click="logout">退出</b-dropdown-item>
            </b-nav-item-dropdown>
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </b-container>
  </b-container>
</template>
<script>
export default {
  name:'Header',
  data(){
    return {
      uname:""
    }
  },
  methods:{
    getUname(){
      if(this.$global.isLogin){
        this.uname = sessionStorage.getItem("uname");
      }
    },
    logout(){
      //删除登陆时赋值给session的信息     
      sessionStorage.removeItem('uid')
      sessionStorage.removeItem('uname')
      sessionStorage.removeItem('selected')
      sessionStorage.removeItem('orderAmount')
      //刷新当前页面
      location.reload();      
    }
  },
  mounted(){
    this.getUname()
  }
}
</script>
<style scoped>

</style>