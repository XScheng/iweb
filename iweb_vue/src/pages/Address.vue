<template>
  <b-container>
    <b-breadcrumb :items="items" class="bg-transparent"></b-breadcrumb> 
    <b-row class="py-3">
      <b-col cols="3" class="pr-0">
        <div id="addicon"></div>
      </b-col>
      <b-col cols="9">
        <ul class="list-inline">
          <li class="list-inline-item"><h3>北京中关村中心</h3></li>
        </ul>
        <ul class="list-inline">
          <p>校区地址：北京市海淀区北三环西路甲18号（大钟寺附近）中鼎大厦B座7层</p>
          <p>咨询电话：010-62130963</p>
          <p>邮编：100098</p>
        </ul>        
      </b-col>
    </b-row>
    <b-row class="py-3">
      <b-col cols="3" class="pr-0">
        <div id="addicon"></div>
      </b-col>
      <b-col cols="9">
        <ul class="list-inline">
          <li class="list-inline-item"><h3>北京中关村中心</h3></li>
        </ul>
        <ul class="list-inline">
          <p>校区地址：北京市海淀区北三环西路甲18号（大钟寺附近）中鼎大厦B座7层</p>
          <p>咨询电话：010-62130963</p>
          <p>邮编：100098</p>
        </ul>        
      </b-col>
    </b-row>
    <b-row class="py-3">
      <b-col cols="3" class="pr-0">
        <div id="addicon"></div>
      </b-col>
      <b-col cols="9">
        <ul class="list-inline">
          <li class="list-inline-item"><h3>北京中关村中心</h3></li>
        </ul>
        <ul class="list-inline">
          <p>校区地址：北京市海淀区北三环西路甲18号（大钟寺附近）中鼎大厦B座7层</p>
          <p>咨询电话：010-62130963</p>
          <p>邮编：100098</p>
        </ul>        
      </b-col>
    </b-row>
    <b-row class="py-3">
      <b-col cols="3" class="pr-0">
        <div id="addicon"></div>
      </b-col>
      <b-col cols="9">
        <ul class="list-inline">
          <li class="list-inline-item"><h3>北京中关村中心</h3></li>
        </ul>
        <ul class="list-inline">
          <p>校区地址：北京市海淀区北三环西路甲18号（大钟寺附近）中鼎大厦B座7层</p>
          <p>咨询电话：010-62130963</p>
          <p>邮编：100098</p>
        </ul>        
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
export default {
  name:"Address",
  data(){
    return {
      items: [
          {
            text: '首页',
            to:{name:'home'}
          },          
          {
            text: '名师堂',
            active: true
          }
        ]
    }
  }
}
</script>
<style scoped>
  #addicon{
    width: 31px;
    height: 47px;
    background: url(~@/assets/images/iconlist.png) no-repeat 0-530px;
    margin:40px auto;
  }
  .breadcrumb-item + .breadcrumb-item::before {
    display: inline-block;
    padding-right: 0.5rem;
    color: #6c757d;
    content: ">";
}
</style>