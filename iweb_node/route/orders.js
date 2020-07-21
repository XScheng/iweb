//导入express模块
const express = require('express');
//导入连接池pool模块
const pool = require('../pool');
//创建路由
var router = express.Router();

//添加订单
router.post('/add',function(req,res){
  //获取表单提交 数据
  var obj = req.body;
  //检测用户Id是否存在
  if(!obj.uid){
    res.json({code:401,msg:'uid required'});
    return;
  }
  //检测订单金额是否存在
  if(!obj.orderAmount){
    res.json({code:402,msg:'orderAmount required'});
    return;
  }
  //检测商品是否为空
  if(!obj.selected){
    res.json({code:403,msg:'selected required'});
    return;
  }
  //获取以秒为单位的时间戳
  var created = parseInt(new Date().getTime()/1000);
  //订单信息
  var order = {
    userId:parseInt(obj.uid),
    amount:parseFloat(obj.orderAmount),
    created:created
  }
  //添加订单
  let sql = 'INSERT INTO orders SET ?';
  pool.query(sql,[order],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      //添加订单表成功
      var orderId = result.insertId; //新插入的Id
      //对选中的商品进行遍历
      //obj.selected是数组
      var details = [];
      var courses = JSON.parse(obj.selected);
      for(var i=0; i<courses.length;i++){
        var tmp = [];
        tmp.push(orderId);
        tmp.push(courses[i].courseId);
        tmp.push(courses[i].count);
        details.push(tmp);
      }
      let sql = 'INSERT INTO orders_detail (orderId,courseId,count) VALUES ?';
      pool.query(sql,[details],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
          res.json({code:200,msg:'suc',data:{
            orderId:orderId
          }});
        }
      })
    }else{
      res.json({code:301,msg:'failed'});
    }
  })
});
//订单列表
router.post('/list',function(req,res){
  //获取请求用户
  var obj = req.body;
  if(!obj.userId){
    res.json({code:401,msg:'userId required'});
    return;
  }
  //查询数据库
  let sql = "SELECT * from orders,orders_detail,course WHERE orders.oid=orders_detail.orderId AND orders_detail.courseId=course.cid AND orders.userId=? ORDER BY orders.created DESC LIMIT 3";
  pool.query(sql,[obj.userId],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.json({
        code:200,
        msg:'suc',
        data:result
      });
    }else{
      res.json({code:402,msg:'empty'});
    }
  });
});

//导出路由
module.exports = router;