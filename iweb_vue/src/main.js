import Vue from 'vue'
import App from './App.vue'

//引入Bootstrap -vue 和Bootstrap
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
// 引入axios
import {axios_instance} from "./util/axios.js"

//使用示例:this.$axios.get();将this引入到Vue原型对象中
Vue.prototype.$axios = axios_instance;

import global_config from "./util/global"
Vue.prototype.$global = global_config;

import qs from "qs"
Vue.prototype.$qs = qs;

Vue.use(BootstrapVue); //在全局注册组件
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin); 
//是否为线上环境
Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
