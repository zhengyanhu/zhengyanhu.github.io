/**
 * common模块 把一些通用的配置信息写入此处
 */

//书籍分类数据
//id          分类id
//name        分类名字
//base_url    根地址
//page_count  获取数据的总页数

const bookTypes = [{
  id:"children",
  name:"儿童类",
  base_url:"http://bang.dangdang.com/books/newhotsales/01.41.00.00.00.00-recent7-0-0-1-",
  page_count:5,
  image:"http://img3x3.ddimg.cn/29/32/24033863-1_l_6.jpg",
  explain:"最近7天热卖儿童类书籍"
},{
  id:"youthLiterature",
  name:"青春文学类",
  base_url:"http://bang.dangdang.com/books/newhotsales/01.01.00.00.00.00-recent7-0-0-1-",
  page_count:5,
  image:"http://img3x4.ddimg.cn/34/5/24024364-1_l_12.jpg",
  explain:"最近7天热卖青春文学类书籍"
},{
  id:"history",
  name:"历史类",
  base_url:"http://bang.dangdang.com/books/newhotsales/01.36.00.00.00.00-recent7-0-0-1-",
  page_count:5,
  image:"http://img3x5.ddimg.cn/24/35/24025245-1_l_4.jpg",
  explain:"最近7天热卖历史类书籍"
},{
  id:"anime",
  name:"动漫类",
  base_url:"http://bang.dangdang.com/books/newhotsales/01.09.00.00.00.00-recent7-0-0-1-",
  page_count:5,
  image:"http://img3x8.ddimg.cn/20/27/24042368-1_l_6.jpg",
  explain:"最近7天热卖动漫幽默类书籍"
}];

module.exports = {
  bookTypes:bookTypes
}
