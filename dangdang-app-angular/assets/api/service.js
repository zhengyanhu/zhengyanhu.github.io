//创建一个公用的数据调用服务
app.factory('commonService',['$http',function($http){
  var service = {};
  //根据分类信息取数据
  //type 数据类型
  service.getData = function(type,callBack){
    console.log(type);
    $http({
      url:'/dangdang-app-angular/data/book_'+type+'.json',
      method:'get'
    })
    .then(function(res){
      console.log('获取数据成功');
      callBack(res);
    },function(err){
      callBack({});
    })

  }
  return service;
}])
