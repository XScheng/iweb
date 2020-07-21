<template>
  <b-container>
      <b-breadcrumb :items="items" class="bg-transparent"></b-breadcrumb>
    <b-row class="my-3">
      <b-col md="7" sm="12">
        <h2>用户登陆</h2><hr>
        <b-form @submit="login">
          <b-form-group
            id="input-group-1"
            label="用户名:"
            label-for="uname"
            description=""
          >
            <b-form-input
              id="uname"
              v-model="form.uname"
              type="text"
              required
              placeholder="用户名/手机号"
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-2" label="密码:" label-for="upwd">
            <b-form-input
              id="upwd"
              v-model="form.upwd"
              type="password"
              required
              placeholder="请输入密码"
            ></b-form-input>
          </b-form-group>

          <b-form-group id="input-group-4">
            <b-form-checkbox-group v-model="form.checked" id="checkboxes-4">
              <b-form-checkbox value="me">自动登陆</b-form-checkbox>          
            </b-form-checkbox-group>
          </b-form-group>

          <b-button type="submit" variant="success">立即登陆</b-button>
          <b-button type="submit" variant="primary" class="ml-3">重置</b-button>
        </b-form>
      </b-col>
      <b-col md="5" sm="12">
        <router-link to="" class="text-right text-warning"><h4>新用户注册</h4></router-link>
        <em class="linebetween"></em>
        <p class="qrcode">
            <i></i>
            <span>扫码登录</span>
        </p>       
      </b-col>
    </b-row>
  </b-container>
</template>
<script>
import qs from "qs"
export default {
  name:"Login",
  data(){
    return {
      form:{
        uname:"",
        upwd:"",
      },
      items: [
          {
            text: '首页',
            to:{name:'home'}
          },          
          {
            text: '用户登陆',
            active: true
          }
        ]
    }
  },
  methods:{   
    login(){
      this.$axios.post("/user/login",qs.stringify(
        this.form
      )).then(res=>{
        console.log(res)
        if(res.data.code==200){
          sessionStorage.uid = res.data.data.uid;
          sessionStorage.uname = res.data.data.uname;
          alert("login success");
          // 跳转到首页
          this.$router.push("/");
          location.reload();
        }
      }).catch(err=>{
        console.log(err)
      })
    }
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
  .qrcode{
    margin:50px auto;
    text-align: center;
  }
  .qrcode > i {
    display: block;
    width: 129px;
    height: 129px;
    background: url(~@/assets/images/qrcode.png) no-repeat 0 0;
    margin: 0 auto;
}
</style>