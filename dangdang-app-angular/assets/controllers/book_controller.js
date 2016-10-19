app.controller('bookContrller',['$scope',function($scope){
  $scope.bookTypes = [
    {id:'anime',name:'动漫',img:'',description:'最近7天热卖动漫类书籍'},
    {id:'childern',name:'儿童',img:'',description:'最近7天热卖儿童类书籍'},
    {id:'history',name:'历史'img:'',description:'最近7天热卖历史类书籍'},
    {id:'youthLierature',name:'青春文学'img:'',description:'最近7天热卖青春文学类书籍'},
  ]
}])
