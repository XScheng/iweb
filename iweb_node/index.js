const express = require("express");

const bodyParser = require('body-parser');

var app = express();
// 新浪云的Node服务器只能监听5050端口
app.listen(5050);
console.log("Server is listening 5050");

// 注册body-parser为中间件
// false 使用querystring来解析数据
// true  使用qs来解析数据(不推荐)
app.use(bodyParser.urlencoded({extended: false}));

// 声明跨域
app.all("*",function(req,res,next){
  //设置允许跨域的域名，*代表允许任意域名跨域
  res.header("Access-Control-Allow-Origin","*");
  //允许的header类型
  res.header("Access-Control-Allow-Headers","content-type");
  //跨域允许的请求方式 
  res.header("Access-Control-Allow-Methods","DELETE,PUT,POST,GET,OPTIONS");
  if (req.method.toLowerCase() == 'options')
      res.send(200);  //让options尝试请求快速结束
  else
      next();
});

// 引入路由
const teacherRouter = require("./route/teacher.js");
const indexRouter = require("./route/index.js");
const userRouter = require("./route/user.js");
const typeRouter = require("./route/type.js");
const courseRouter = require("./route/course.js");
const cartRouter = require("./route/cart.js");
const favoriteRouter = require("./route/favorite.js");

// /teacher/list       讲师列表
// /teacher/add        添加讲师
// /teacher/info?tid=2 讲师详情
// teacherRouter中的路由都会加上teacher前缀
app.use("/teacher", teacherRouter);
app.use("/", indexRouter);
app.use("/user", userRouter);
app.use("/type", typeRouter);
app.use("/course", courseRouter);
app.use("/cart", cartRouter);
app.use("/favorite", favoriteRouter);