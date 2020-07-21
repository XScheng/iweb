<template>
  <b-container>
    <b-breadcrumb :items="items" class="bg-transparent"></b-breadcrumb>
    <div class="cart">
      <div class="cart_header">
          <span class="btn btn-outline-primary" @click="cartEmpty()">清空购物车</span>
          <span>已选课程<em>{{checkCount}}</em>门</span>
          <span>总金额：<strong>&yen;{{orderAmount}}</strong></span>          
          <button type="button" class="ml-2" @click="orderConfirm">结算</button>
      </div>
      <div class="cart_con">
        <div class="cartcon_title clearfloat">
            <span><input type="checkbox" class="checkbox_all" @click="checkAll" :checked="checkAllState"> 全选</span>
            <span>课程信息</span>
            <span>单价</span>
            <span>数量</span>
            <span>金额</span>
            <span>操作</span>
        </div>
        <div class="cartcon_list">
            <h2 v-show="$global.isLogin==false">请登录后查看您的购物车 <router-link :to="{name:'login'}" class="btn btn-success text-light">去登录</router-link></h2>
            <h2 v-show="$global.isLogin==true&&list.length==0">您的购物车竟然是空的！<router-link :to="{name:'course',query:{curPage:1,typeId:0}}">查看全部课程</router-link></h2>
            <ul class="list-unstyled"  v-show="$global.isLogin==true&&list.length>0">
              <li class="clearfloat" v-for="(item,index) in list" :key="index">
                  <span><input type="checkbox" class="cart_checkbox" :checked="item.isChecked" @change="checkItem(index)"/></span>
                  <router-link :to="{name:'course_detail'}" class="cart_img"><img :src="require(`../assets/images/${item.pic}`)" /></router-link>
                  <router-link :to="{name:'course_detail'}" class="cart_title">{{item.title}}</router-link>
                  <i class="text-danger">¥{{item.price}}</i>
                  <div>
                      <span @click="decNum(index)">-</span><input type="text" :value="item.count" disabled/><span  @click="incNum(index)">+</span>
                  </div>
                  <strong>¥{{item.price*item.count}}</strong>
                  <em @click="delCart(index)"></em>
              </li>
            </ul>
        </div>
      </div>
      <div class="cart_header">
          <p><input type="checkbox" class="checkbox_all" @click="checkAll" :checked="checkAllState"> 全选</p>
          <span class="btn btn-outline-primary" @click="cartEmpty()">清空购物车</span>
          <span>已选课程<em>{{checkCount}}</em>门</span>
          <span>总金额：<strong>&yen;{{orderAmount}}</strong></span>          
          <button type="button" class="ml-2" @click="orderConfirm">结算</button>
      </div>
    </div>
  </b-container>
</template>
<script>
export default {
  name:"Cart",
  data(){
    return {
      list:[],
      items: [
          {
            text: '首页',
            to:{name:'home'}
          },          
          {
            text: '购物车',
            active: true
          }
        ],
      orderAmount:0,
      checkAllState:false, //全选的状态
      checkCount:0 //单选选中的数量
    }
  },
  methods:{
      //查询购物车的内容
    getCart(){
        if(this.$global.isLogin){
            this.$axios.post("/cart/list",this.$qs.stringify(
            {uid: sessionStorage.getItem("uid")}
            )).then(res=>{
            if(res.data.code==200){
                this.list = res.data.data;
                //给每个商品添加选中状态
                for(var i=0;i<this.list.length;i++){
                    this.list[i].isChecked = false;
                }
                //计算订单金额
                this.getOrderAmount();
            }
            }).catch(err=>{
            console.log(err)
            });
        }
    },
    //删除购物车中的商品
    delCart(index){
        if(this.$global.isLogin){
            this.$axios.post("/cart/delete",this.$qs.stringify(
                {ctid: this.list[index].ctid}
                )).then(res=>{
                if(res.data.code==200){
                    //刷新当前页面
                    this.list.splice(index,1);
                    this.checkCount--;
                    this.getOrderAmount();
                }
                }).catch(err=>{
                console.log(err)
            });
        }
    },
    // 计算订单金额(当前购物车中的总金额)
    getOrderAmount(){
        this.orderAmount = 0;
        for(var i=0; i<this.list.length; i++){
            if(this.list[i].isChecked){
                this.orderAmount += this.list[i].price * this.list[i].count;
            }
        }
    },
    //清空购物车
    cartEmpty(){
        if(this.$global.isLogin){
            this.$axios.post("/cart/empty",this.$qs.stringify({
                uid:sessionStorage.getItem('uid')
            })).then(res=>{
                if(res.data.code==200){
                    this.list = [];
                    this.checkCount = 0
                    this.getOrderAmount();
                }
            }).catch(err=>{
                console.log(err)
            })
        }else{
            alert("请先登录");
            this.$router.push("/login");
        }
    },
    //全选
    checkAll(){
        this.checkAllState = !this.checkAllState;
        for(let i=0;i<this.list.length;i++){
            //每个商品的选中状态与全选一致
            this.list[i].isChecked = this.checkAllState;
        }
        //计算选中的课程数
        if(this.checkAllState){
            this.checkCount = this.list.length;
        }else{
            this.checkCount = 0;
        }
        //计算订单金额
        this.getOrderAmount();
    },
    //单选
    checkItem(index){
        this.list[index].isChecked = !this.list[index].isChecked;     
        //每个商品的选中状态与全选一致
        if(this.list[index].isChecked){
            //选中
            this.checkCount += 1;
        }else{
            //取消
            this.checkCount -= 1;
        } 
        //如果选中的商品数等于总的商品数
        this.checkAllState = (this.checkCount==this.list.length)
        //计算订单金额
        this.getOrderAmount()       
    },
    //商品数量递增
    incNum(index){
        //当前商品数量+1
        this.list[index].count += 1;
        //计算订单金额
        this.getOrderAmount()
    },
    //商品数量递减
    decNum(index){
        //当前商品数量-1
        if(this.list[index].count>0){
            this.list[index].count -= 1;
        }
        //计算订单金额
        this.getOrderAmount()
    },
    orderConfirm(){
        if(this.orderAmount>0){
            //获取选中的商品
            var selected = [];
            for(let i=0;i<this.list.length;i++){
                if(this.list[i].isChecked){
                    selected.push(this.list[i]);
                }
            }
            //将选中的商品存到session中
            sessionStorage.setItem('selected',JSON.stringify(selected));
            sessionStorage.setItem("orderAmount",this.orderAmount);
            //跳转到订单确认页面
            this.$router.push("/order_confirm");
        }else{
            alert("请选择商品")
        }
    }
  },    
  mounted(){
      this.getCart();
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
  .cart {
      margin-top:20px;
  }
  .cart_header {
      text-align: right;
      font-size: 14px;
      line-height: 36px;
  }
  .cart_header>button{
      display: inline-block;
      vertical-align: middle;
      width: 100px;
      height: 36px;
      background: #f63;
      border:none;
      color:#fff;
      font-size: 18px;
  }
  .cart_header>span,.cart_header>a {
      margin-right: 10px;
      display: inline-block;
      vertical-align: middle;
  }
  .cart_header>span>em {
      font-style: normal;
      color:#f63;
  }
  .cart_header>span>strong{
      font-size: 18px;
      color:#f63;
  }
  .cart_header>p {
      float: left;
      width: 110px;
      text-align: center;
  }
  .cart_con {
      margin: 10px 0;
      font-size: 14px;
  }
  .cartcon_title {
      background: #eee;
      border:1px solid #ddd;
  }
  .cartcon_title>span {
      line-height: 33px;
      display: inline-block;
      vertical-align: middle;
      text-align: center;
  }
  .cartcon_title>span:nth-child(1){
      width: 10%;
  }
  .cartcon_title>span:nth-child(2){
      width: 50%;
  }
  .cartcon_title>span:nth-child(3){
      width: 10%;
  }
  .cartcon_title>span:nth-child(4){
      width: 10%;
  }
  .cartcon_title>span:nth-child(5){
      width: 10%;
  }
  .cartcon_title>span:nth-child(6){
            width: 10%;

  }
  /*商品列表的样式*/
  .cartcon_list h2 {
      line-height: 60px;
      text-align: center;
      font-size: 18px;
      font-weight: lighter;
      border: 1px solid #ddd;
      border-top: none;
  }
  .cartcon_list h2 a {
      color:#f60;
  }
  .cartcon_list ul li {
      padding:20px 0;
      border: 1px solid #ddd;
      border-top: none;
  }
  .cartcon_list>ul>li>span,
  .cartcon_list>ul>li>span>input,
  .cartcon_list>ul>li>a,
  .cartcon_list>ul>li>i,
  .cartcon_list>ul>li>div,
  .cartcon_list>ul>li>div>span,
  .cartcon_list>ul>li>div>input,
  .cartcon_list>ul>li>strong,
  .cartcon_list>ul>li>em {
      display: inline-block;
      vertical-align: middle;
      text-align: center;
      font-style: normal;
  }
  .cartcon_list>ul>li>span {
      width: 10%;
  }
  .cartcon_list>ul>li>a.cart_img {
      width: 15%;
      max-height: 100px;
      overflow: hidden;
  }
  .cartcon_list>ul>li>a.cart_img img {
      max-width:100%;
  }
  .cartcon_list>ul>li>a.cart_title {
      width: 35%;
      padding-left: 20px;
      font-size: 18px;
      text-align: left;
  }
  .cartcon_list>ul>li>i {
      width: 10%;
  }
  .cartcon_list>ul>li>div {
      width: 10%;
  }
  .cartcon_list>ul>li>div>span {
      width: 20px;
      height:20px;
      background: #e8e8e8;
      line-height: 20px;
  }
  .cartcon_list>ul>li>div>span:hover {
      cursor: pointer;
      background: #eee;
  }
  .cartcon_list>ul>li>div>input {
      width: 28px;
      height:18px;
      border:1px solid #ccc;
  }
  .cartcon_list>ul>li>strong {
      width: 10%;
      color:#f63;
  }
  .cartcon_list>ul>li>em {
      width: 10%;
      height: 14px;
      background:url(../assets/images/iconlist.png) no-repeat 20px -460px;
      cursor: pointer;
  }
  .cartcon_list>ul>li>em:hover {
      background-position: 20px -480px;
  }
</style>