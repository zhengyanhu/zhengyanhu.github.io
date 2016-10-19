app.controller('mainContoller',['$scope','commonService',function($scope,c_s){
  c_s.getData('anime',function(res){
    console.dir(res);
  })

}])
