//1.导入express模块
const express = require('express');
// 2.导入数据库连接池模块
const pool = require('../pool');
// 3.创建路由
var router = express.Router();

//获取课程分类
router.get('/',(req,res)=>{
  //查询数据库
  pool.query('SELECT * FROM type',(err,result)=>{
    if(err) throw err;
    res.json({
      code:200,
      msg:'success',
      data:result
    });
  });
})

//导出模块
module.exports = router;
