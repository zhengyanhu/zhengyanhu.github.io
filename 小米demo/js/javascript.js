var images = document.querySelector('.images');
var products = document.querySelector('.product');
var txt = document.querySelector('#txt');

var data = [{
  name:"小米Note 4",
  infos:"X20 十核旗舰处理器 / 全金属一体化机身 / 4100mAh 大电量 / 全网通",
  price:"899 元",
  image:"http://i8.mifile.cn/v1/a1/18234d8c-0026-9b84-d9df-fe483de6079e.jpg"

},{
  name:"红米Pro",
  infos:"件级实时背景虚化 / Helio X20 十核旗舰处理 / 5.5英寸 OLED 超鲜艳屏幕 / 拉丝全金属机身",
  price:"1499 元",
  image:"http://i8.mifile.cn/v1/a1/18234d8c-0026-9b84-d9df-fe483de6079e.jpg"

},{
  name:"红米3s",
  infos:"识别 / 全网通双卡双待 / 金属机身 / 4100mAh大电池 / 3GB内存+32GB容量 / 最高支持128GB扩展",
  price:"699元",
  image:"http://i8.mifile.cn/v1/a1/517db742-917d-d2ef-5953-066c2c2f6625.jpg"
},{
 name:"红米Note3",
  infos:"【直降100，现价999元！今早10点开售】金属机身 / 指纹识别 / 4050mAh大电池 / 5.5英寸阳光屏 / 骁龙650六核处理器 / 1600万像素相机 / 3GB内存+32GB容量 / 最高支持128GB扩展",
  price:"799元",
  image:"http://i1.mifile.cn/v1/a1/T1VNJjBsdT1RXrhCrK.jpg"
},{
 name:"红米Max全网通",
  infos:"直降200！6.44英寸大屏 / 4850mAh大电池 / 4GB内存+128GB容量",
  price:"1299元",
  image:"http://i8.mifile.cn/v1/a1/T1XSE_B5x_1RXrhCrK.jpg"
},{
 name:"小米5标准版",
  infos:"骁龙820处理器 / UFS 2.0 闪存 / 4轴防抖相机 / 16颗灯省电高亮屏幕 / 全功能NFC / 4G+ 网络 / 新增支持双开微信，能刷公交卡、银行卡",
  price:"1799元",
  image:"http://i8.mifile.cn/v1/a1/dc39e456-a433-4b59-c329-36f3ce00c1f1.jpg"
}];


function initCtrl(data){
    var strHtml = '';

    data.forEach(function(item){
      strHtml += '<section>'+'<img class="image" src="' + item.image + '"alt="">'+'<span>'+ '<p class="name">' + item.name + '</p>' +  '<p class="infos">' + item.infos + '</p>' + '<p class="price">' + item.price + '</p>' + '</span>' + '</section>';





    });

    products.innerHTML = strHtml;


}
initCtrl(data);

txt.onkeyup = function(e){
  var str = txt.value;

  var result = data.filter(function(item){
    if (item.name.toLowerCase().indexOf(str.toLowerCase()) >-1 ||
         item.infos.toLowerCase().indexOf(str.toLowerCase()) >-1 ||
       item.price.toLowerCase().indexOf(str.toLowerCase()) >-1){

           return item;
    }

  });
  initCtrl(result);
   console.log(result);
}
