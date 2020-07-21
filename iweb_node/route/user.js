// 1.1 引入express路由
const express = require('express');
// 1.2 引入数据库连接池
const pool = require('../pool.js');
// 2.创建路由器对象
var router = express.Router();
//用户注册
router.post('/register',(req,res)=>{
  var obj = req.body;
  //检测用户名是否为空
  if(!obj.uname){
    res.json({code:401,msg:'uname required'});
    return;
  }
  //检测密码是否为空
  if(!obj.upwd){
    res.json({code:402,msg:'upwd required'});
    return;
  }
  //检测重复密码是否为空
  if(!obj.upwd2){
    res.json({code:403,msg:'upwd2 required'});
    return;
  }
  //比较两次输入的密码是否一致
  if(obj.upwd!=obj.upwd2){
    res.json({code:404,msg:'two times key is not the same, please input again'})
    return;
  }
  //检测手机号是否为空
  if(!obj.phone){
    res.json({code:405,msg:'phone required'});
    return;
  }
  //检测手机号输入格式是否正确
    var reg = /^1[3~9]\d{9}$/
    if(!reg.test(obj.phone)){
      res.json({code:406,msg:'phone incorrect format'});
      return;
    }  

  //删除比较后的确认密码字段upwd2
  delete obj.upwd2;
  //插入数据到数据库
  pool.query('INSERT INTO user SET ?',[obj],(err,result)=>{
    if(err) throw err;      
    res.json({
      code:200,
      msg:'registe success',
      data:{uid:result.insertId,uname:obj.uname}
    });      
  });
});

//用户登陆
router.post('/login',(req,res)=>{
  //获取提交的数据
  var obj = req.body;
  //检测用户名或密码是否为空
  if(!obj.uname){
    res.json({code:401,msg:'uname required'});
    return;
  }
  if(!obj.upwd){
    res.json({code:402,msg:'upwd requred'});
    return;
  }
  //查询用户名和密码登录,或手机号和密码登录
  pool.query('SELECT * from user WHERE (uname=? AND upwd=?) OR (phone=? AND upwd=?) LIMIT 1',[obj.uname,obj.upwd,obj.uname,obj.upwd],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.json({
        code:200,
        msg:'login sucess',
        data:result[0]
      });
    }else{
      res.json({code:404,msg:'uname or upwd not found'})
    }
  });
});

//检测用户名是否存在
router.post('/check_uname',(req,res)=>{
  //获取请求数据
  obj = req.body;
  if(!obj.uname){
    res.json({code:300,msg:'uname required'})
    return;    
  }
  //查询数据
  pool.query('SELECT count(*) as num FROM user where uname=?',[obj.uname],(err,result)=>{
    if(err) throw err;
    if(result[0].num>0){
      res.json({code:301,msg:'user exists'})
    }else{
      res.json({code:200,msg:'user is not exist'})
    }
  });
});

//检测手机号是否存在
router.post('/check_phone',(req,res)=>{
  //获取请求数据
  obj = req.body;
  if(!obj.phone){
    res.json({code:300,msg:'phone required'});
    return;
  }
  //查询数据库
  pool.query('SELECT count(*) as num FROM user where phone=?',[obj.phone],(err,result)=>{
    if(err) throw err;
    if(result[0].num>0){
      res.json({code:301,msg:'phone exists'})
    }else{
      res.json({code:200,msg:'phone is not exist'})
    }
  });
});


//模块导出
module.exports = router;