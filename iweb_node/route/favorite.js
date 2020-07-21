//引入express模块
const express = require('express');
//引入连接池模块
const pool = require('../pool.js');
//创建路由对象
var router = express.Router();

//添加收藏
router.post('/add',(req,res)=>{
  //获取请求参数
  var obj = req.body;
  if(!obj.uid){
    res.json({code:401,msg:'uid required'});
    return;
  }
  if(!obj.cid){
    res.json({code:402,msg:'cid required'});
    return;
  }  
  //查询
  let sql = "SELECT count(*) as num FROM favorite WHERE userId=? AND courseId=?";
  pool.query(sql,[obj.uid,obj.cid],(err,result)=>{
    if(err) throw err;
    if(result[0].num>0){
      //收藏记录已存在
      res.json({code:201,msg:'exists'});
    }else{
      //收藏记录不存在
      //得到当前以秒为单位的时间戳
      var fTime = Math.ceil((new Date().getTime())/1000);
      //添加数据库操作
      let sql = "INSERT INTO favorite (userId,courseId,fTime) VALUES (?,?,?)";
      pool.query(sql,[obj.uid,obj.cid,fTime],(err,result)=>{
        console.log(result)
        if(err) throw err;
        if(result.affectedRows > 0){
         res.json({code:200,msg:'favorite success',
        data:{
          fid:result.insertId
        }
        });
        }else{
          res.json({code:303,msg:'failed'});
        }
      }); 
    }
  });
});  
//我的收藏
router.post('/list',(req,res)=>{
  //获取查询用户的uid
  var obj = req.body;
  if(!obj.uid){
    res.json({code:401,msg:'uid required'});
    return;
  }
  //查询数据库
  let sql = "SELECT course.title, course.pic, course.price, favorite.courseId, favorite.fid, favorite.fTime FROM favorite,course WHERE favorite.courseId=course.cid AND favorite.userId=? ORDER BY favorite.fTime DESC";
  pool.query(sql,[obj.uid],(err,result)=>{
    if(err) throw err;
    console.log(result);
    if(result.length>0){
      res.json({code:200,msg:'查询成功',
      data:result
    });
    }else{
      res.json({code:402,msg:'nothing'})
    }
  });
});


//导出路由
module.exports = router;