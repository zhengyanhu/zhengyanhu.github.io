var express = require('express');
var router = express.Router();
var fs = require('fs');

var common = require('../common/common');
var bookTypes = common.bookTypes;
router.get('/fenlei',function(req,res){
    res.render('list',{
      types:bookTypes
    })
});
router.get('/ddd/:id',function(req,res){
var data = [];
try{
  data = JSON.parse(fs.readFileSync(`../ddbook-data/data/book_${req.params.id}.json`).toString());
}
catch(err){
  console.log(err);
}
var bookTpe = bookTypes.find((item) => {
  return item.id == req.params.id;
});
  res.render('detail',{list:data,title:bookTpe.name})

})


module.exports = router;
