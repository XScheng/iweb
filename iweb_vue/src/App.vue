<template>
  <div id="app" :key="Key">
    <TopNav></TopNav>
    <Header></Header>
    <!-- <img alt="Vue logo" src="./assets/logo.png">     -->
    <router-view></router-view>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from './components/Header.vue'
import {router} from "./route/router"
import Footer from './components/Footer.vue'
import TopNav from './components/TopNav.vue'

export default {
  name: 'App',
  router,
  components: {
    Header,
    Footer,
    TopNav
  },
  data(){
    return {
      Key:""  //用来监听URL的变化(路由不变,参数变,但页面不刷新)
    }
  },
  watch:{
    $route:function(newUrl,oldUrl){
      // 路由(包括参数)发生变化时,对Key进行赋值,如果Key发生变化,则页面执行刷新
      this.Key = new Date().getTime();
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  /* margin-top: 60px; */
}
</style>
