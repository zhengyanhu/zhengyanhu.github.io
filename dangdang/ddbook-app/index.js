var express = require('express');
var app = express();
 var path = require('path');
 var bodyParser = require('body-parser');//



 // parse application/x-www-form-urlencoded
 app.use(bodyParser.urlencoded({ extended: false }));
 // parse application/json
 app.use(bodyParser.json());

//添加模板引擎
app.set('views', path.join(__dirname, 'views'));
var template = require('art-template');
template.config('base', '');
template.config('extname', '.html');
app.engine('.html', template.__express);
app.set('view engine', 'html');

app.use('/users',require('./routers/dd'));

app.get('/',function(req,res){
    res.send('😁');
});


app.listen(3000,function(){
  console.log('服务器运行于3000端口');
});
