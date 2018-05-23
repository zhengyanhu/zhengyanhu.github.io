// var db = require('mongoose');
// var fs = require('fs');
// db.Promise = global.Promise;
//
// db.connect('mongodb://localhost/blog_db');
//
// var Blog = db.model('blog',{
//   name:String,
//   nickName:String,
//   detail:String,
//   id:String,
//   create_time:String,
//   view_times:Number
// });

// var arrBlogs = JSON.parse(fs.readFileSync('./data/users.json'));

// arrBlogs.forEach(function(item){
//   var blog = new Blog(item);
//   blog.name = item.name;
//   blog.nickName = item.nickName;
//   blog.detail = item.detail;
//   blog.id = item.id;
//   blog.create_time = item.create_time;
//   blog.view_times = item.view_times;
//
//   blog.save(function(err){
//     if (err) {
//       console.log(err);
//     }else{
//       console.log('博客信息保存完毕');
//     }
//   })
// });
