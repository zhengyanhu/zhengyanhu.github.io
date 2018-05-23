var Crawler = require('crawler');
var url = require('url');
var fs = require('fs');

var c = new Crawler({
  maxConnections:10,
  forceUTF8:true,
incomingEncoding:'gb2312',

});

//引入common模块
const common = require('../ddbook-app/common/common');
const bookType = common.bookTypes;

//根据common模块中的配置 去抓取数据
bookType.forEach(function(item){
  loadData(item.base_url,item.id,item.page_count);
});

/**
 * 加载数据
 * @param {[type]} base_url   [用于拼接分页的基础地址]
 * @param {[type]} id         [分类的id]
 * @param {[type]} page_count [获取数据的总页数]
 * @param {[type]}            [返回结果]
 */
function loadData(baseUrl,id,pageCount){
  var arrBook = [];

  getData(baseUrl,1);
  function getData(url,page){

    c.queue([{
        uri: url + page,
        callback:(err,result,$) => {
           console.log(result.uri);

          $('.bang_list li').each((index,li) => {
            var obj = decodeBookData($(li));
            arrBook.push(obj);
          });
          if (page >= pageCount) {
            fs.writeFileSync(`./data/book_${id}.json`,JSON.stringify(arrBook));
            console.log('获取数据成功');
          }else{
            getData(url,page + 1);
          }
        }
    }]);
  }
}

function decodeBookData($item){
  var obj = {};
  obj.bookName = $item.find('.name').text();
  obj.bookAuthor = $item.find('.publisher_info').eq(0).text;
  obj.issueTime = $item.find('.publisher_info').eq(1).find('span').text();
  obj.publish = $item.find('.publisher_info').eq(1).find('a').text();
  obj.bookImg = $item.find('.pic img').attr('src');
  obj.bookDetail = $item.find('.pic a').attr('href');
  obj.bookPrice = $item.find('.price .price_n').text();
  return obj;
 }
