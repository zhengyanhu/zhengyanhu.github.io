app.controller('mainContoller',['$scope','commonService',function($scope,c_s){
  // c_s.getData('anime',function(res){
  //   console.dir(res);
  // });
  $scope.selectedIndex = 0;
  $scope.linkTo = function(index){
    $scope.selectedIndex = index;
  }
}])
