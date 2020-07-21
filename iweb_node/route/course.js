//1.导入express模块
const express = require('express');
//2.导入连接池模块
const pool = require('../pool');
// 3.创建路由
var router = express.Router();

//获取课程列表
router.get('/list',(req,res)=>{
  //接收get请求的参数
  var obj = req.query;
  //判断有没有初始页面curPage参数
  if(!obj.curPage){
    obj.curPage = 1;
  }
  //判断有没有每页显示数量pageSize参数
  if(!obj.pageSize){
    obj.pageSize = 3;
  }
  //判断有没有typyId参数
  if(!obj.typeId){
    obj.typeId = 0;
  }
  obj.typeId = parseInt(obj.typeId);
  obj.curPage = parseInt(obj.curPage);
  obj.pageSize = parseInt(obj.pageSize);
  //查看总的记录数   
  //查询数据库
  pool.query(obj.typeId<=0?"SELECT count(*) as num from course":"SELECT count(*) as num FROM course WHERE typeId="+obj.typeId,(err,result)=>{
    if(err) throw err;
    console.log(result);
    //总的记录数
    let total = result[0].num;
    //总页数
    let pageTotal = Math.ceil(total / obj.pageSize);
    //查询起始位置
    let offset = (obj.curPage-1) * obj.pageSize;
    //执行分页查询
    pool.query(obj.typeId<=0?`SELECT * FROM course, teacher WHERE course.teacherId = teacher.tid ORDER BY course.cid DESC LIMIT ${offset},${obj.pageSize}`:`SELECT * FROM course, teacher WHERE course.teacherId = teacher.tid AND typeId=${obj.typeId} ORDER BY course.cid DESC LIMIT ${offset},${obj.pageSize}`,(err,result)=>{
      if(err) throw err;
      console.log(result);
      res.json({
        code:200,
        msg:'success',
        data:{
          list:result,
          total:total,
          pageTotal:pageTotal,
          pageSize:obj.pageSize,
          curPage:obj.curPage
        }
      });
    });    
  });
});

//获取课程详情
router.get('/detail',(req,res)=>{
  //获取get请求参数
  obj = req.query;
  //如果格里施纳蜥蜴参数为空
  if(!obj.cid){
    res.send({code:401,msg:'please input query params'})
    return
  }
  //查询数据库
  pool.query("SELECT * FROM course, teacher where course.teacherId=teacher.tid AND course.cid=?",[obj.cid],(err,result)=>{
    if(err) throw err;
    if(result==''){
      res.json({code:402,msg:'out of query'})
      return
    }else{
      res.json({
        code:200,
        msg:'success',
        data:result[0]
      });
    }
  });
});

//获取最新课程
router.get('/newest',(req,res)=>{
  //获取查询参数
  var obj = req.query;
  if(!obj.countNum){
    res.json({code:401,msg:'please input query quantity'});
    return;
  }
  //查询数据库
  pool.query("SELECT course.cid, course.pic, course.price, course.title, teacher.tname FROM course, teacher where course.teacherId=teacher.tid ORDER BY course.cid DESC limit ?",[parseInt(obj.countNum)],(err,result)=>{
    if(err) throw err;
    res.json({
      code:200,
      msg:'success',
      data:result
    });
  });
});

// 导出模块
module.exports = router;