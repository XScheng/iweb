//导入express模块
const express = require('express');
//导入连接池pool模块
const pool = require('../pool');
//创建路由
var router = express.Router();

//添加购物车
router.post('/add',(req,res)=>{
  //获取post请求提交的数据
  var obj = req.body;
  //验证用户id是否为空
  if(!obj.uid){
    res.json({code:401,msg:'userId required'});
    return;
  }
  //验证商品Id是否为空
  if(!obj.cid){
    res.json({code:402,msg:'courseId required'});
    return;
  }  
  //验证购买数量是否为空
  if(!obj.count){
    obj.count = 1;
  }
  //查询用户购物车中是否已经添加过商品
  let sql = "SELECT count(*) as num FROM cart WHERE userId=? AND courseId=?";
  pool.query(sql,[obj.uid,obj.cid],(err,result)=>{
    if(err) throw err;
    if(result[0].num > 0){
      //说明商品已在购物车中存在(更新购买数量)
      var sql = `UPDATE cart SET count=count+${obj.count} WHERE userId=${obj.uid} AND courseId=${obj.cid}`;
    }else{
      //商品尚未添加到购物车(执行添加)
      var sql = `INSERT INTO cart VALUES (NULL,${obj.uid}, ${obj.cid}, ${obj.count})`;
    }
    //插入数据到cart数据库
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      if(result.affectedRows > 0){
        res.json({code:200,msg:'success'});      
      }else{
        res.json({code:403,msg:'insert fail'});
      }
    });
  });
});
//查询购物车
router.post('/list',(req,res)=>{
  //获取请求的参数
  var obj = req.body;
  //验证查询参数是否为空
  if(!obj.uid){
    res.json({code:401,msg:'uid required'});
    return;
  }
  //查询数据库
  pool.query('SELECT cart.ctid, cart.courseId, cart.count, course.title, course.pic, course.price FROM cart, course WHERE cart.courseId=course.cid AND cart.userId=?',[obj.uid],(err,result)=>{
    if(err) throw err;
    //如果购物车是有商品
    if(result.length > 0){
      res.json({code:200,msg:'success',data:result});
    }else{
      //否则购物车是空的
      res.json({code:201,msg:'cart is empty'});
    }
  });
});
//更新购物车
router.post('/update',(req,res)=>{
  //获取请求参数
  var obj = req.body;
  if(!obj.ctid){
    res.json({code:401,msg:'ctid required'});
    return;
  }
  if(!obj.count){
    res.json({code:402,msg:'count required'});
    return;
  }
  //查询数据库
  pool.query('UPDATE cart SET count=? WHERE ctid=?',[parseInt(obj.count),parseInt(obj.ctid)],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.json({code:200,msg:'success'});
    }else{
      res.json({code:301,msg:'failed'});
    }
  });
});
//清空购物车
router.post('/empty',(req,res)=>{
  //获取要清空的用户id
  var obj = req.body;
  if(!obj.uid){
    res.json({code:401,msg:'uid required'});
    return;
  }
  //查询数据库并更新数据
  pool.query('DELETE FROM cart WHERE userId=?',[parseInt(obj.uid)],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.json({code:200,msg:'success'});
    }else{
      res.json({code:402,msg:'uid not exist'});
    }
  });
});
//删除购物车商品
router.post('/delete',(req,res)=>{
  //获取post请求的参数
  var obj = req.body;
  if(!obj.ctid){
    res.json({code:401,msg:'ctid required'});
    return;
  }
  //修改数据库
  pool.query('DELETE FROM cart WHERE ctid=?',[obj.ctid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.json({code:200,msg:'success'});
    }else{
      res.json({code:301,msg:'failed'});
    }
  });
});

//导出路由模块
module.exports = router;