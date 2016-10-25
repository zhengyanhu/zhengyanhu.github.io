
var express = require('express');
var router = express.Router();
var fs = require('fs');
var dal = require('../../common/dalData');
// var db = require('mongoose');

// db.Promise = global.Promise;
// db.connect('mongodb://localhost/blog_db');

// var Blog = db.model('blog',{
//   name:String,
//   nickName:String,
//   detail:String,
//   id:String,
//   create_time:String,
//   view_times:Number
// });

//发表页面
router.get('/add',function(req,res){

    var postUrl = '/users/create';
    res.render('admin/add',{data:{},postUrl:postUrl});

})
//列表页面
router.get('/list',function(req,res){
  var data = dal.getData();

  res.render('admin/list',{list:data});
});

//修改页面
router.get('/edit/:id',(req,res) =>{
  var data = dal.getDataByID(req.params.id);

  var postUrl = '/users/update/'+req.params.id;
  res.render('admin/add',{data:data,postUrl:postUrl});

})

router.post('/create',function(req,res){
  var arr = dal.getData();
  var blog = {};
  blog = req.body;
  var now = new Date();
  blog.id = now.getTime();
  blog.create_time = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
  blog.view_times = 0;
  arr.push(req.body);
  fs.writeFile('./data/users.json', JSON.stringify(arr));
  res.redirect('/users/list');

  // var blog = new Blog();
  // blog.name = req.body.name;
  // blog.nickName = req.body.nickName;
  // blog.detail = req.body.detail;
  // blog.id = req.body.id;
  // blog.create_time = req.body.create_time;
  // blog.view_times = req.body.view_times;
  //
  // blog.save(function(err){
  //   if (err) {
  //     console.log(err);
  //   }else{
  //     console.log('博客信息保存完毕');
  //   }
  // })


  // console.log(req.body);
});

//删除数据
router.post('/delete',(req,res) =>{

      dal.getDelDataByID(req.body.id);
    res.redirect('/users/list');
});

//修改表单数据
router.post('/update/:id',(req,res) =>{
  dal.update(req.params.id,req.body);
  res.redirect('/users/list');
});


module.exports = router;
