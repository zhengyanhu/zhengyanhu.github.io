app.controller('book_listController',['$scope','$routeParams','commonService',function($scope,$routeParams,commonService){
 $scope.data = [];
 commonService.getData($routeParams.id,function(res){
   $scope.data = res.data.data;
   console.log($scope.data);
 });
}]);
