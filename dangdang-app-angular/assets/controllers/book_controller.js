app.controller('bookContrller',['$scope',function($scope){
  $scope.bookTypes = [
    {id:'anime',name:'动漫',img:'http://img3x8.ddimg.cn/20/27/24042368-1_l_6.jpg',description:'最近7天热卖动漫类书籍'},
    {id:'childeren',name:'儿童',img:'http://img3x3.ddimg.cn/29/32/24033863-1_l_6.jpg',description:'最近7天热卖儿童类书籍'},
    {id:'history',name:'历史',img:'http://img3x5.ddimg.cn/24/35/24025245-1_l_4.jpg',description:'最近7天热卖历史类书籍'},
    {id:'youthLiterature',name:'青春文学',img:'http://img3x4.ddimg.cn/34/5/24024364-1_l_12.jpg',description:'最近7天热卖青春文学类书籍'},
  ]
}])
