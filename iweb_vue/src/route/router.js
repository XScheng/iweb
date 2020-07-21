import {
  routes
} from "./routes";

import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

//VueRouter的配置
export const router = new VueRouter({
  base:"/",
  mode:"hash",
  routes
})