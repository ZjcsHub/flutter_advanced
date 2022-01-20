import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../Servers/ScreenAdaper.dart';
import '../model/productModel.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State with AutomaticKeepAliveClientMixin {

  NetWorkProductModel? netWorkProductModel;

  @override
  void initState() {
    super.initState();
    NetWorkProductModel.LoadData().then((info){

      setState(() {
        netWorkProductModel = info as NetWorkProductModel?;
      });

    });
  }

  // 轮播图
  Widget _swiperWidget() {

    List imageLists = [
      {"url":"https://cdn3-banquan.ituchong.com/weili/l/1116642517212201013.webp"},
      {"url":"https://cdn3-banquan.ituchong.com/weili/l/1114952043854299163.webp"},
      {"url":"https://cdn3-banquan.ituchong.com/weili/l/1117171219096272919.webp"},
    ];

    return Container(
      child: AspectRatio(
        child: Swiper(
          itemCount: imageLists.length,
          itemBuilder: (BuildContext context,int index) {
            return Image.network(imageLists[index]["url"],fit: BoxFit.fill,);
          },
          pagination: SwiperPagination(),
          // control: SwiperControl(),
          autoplay: true,
        ),
        aspectRatio: 16/9,
      ),
    );

  }
  // 标题文本
  Widget _titleWidget(String title) {
    return Container(
      margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.red,
            width: 5
          )
        )
      ),
      child: Text(title,
      style: TextStyle(
        fontSize: 25,
        color: Colors.black54
      ),),
      // height: 60,
    );
  }

  // 猜你喜欢
  Widget _yourlove() {

    var product = [
      {"title":"摩肯流光绘色唇膏口红","imageUrl":"https://img.alicdn.com/imgextra/i1/1068657204/O1CN01je7Lg6235TqTgKgZd_!!1068657204-0-daren.jpg_360x360xzq90.jpg_.webp"},
      {"title":"巴菲莉 实木客厅卧室五斗橱","imageUrl":"https://img.alicdn.com/imgextra/i4/2201524160948/O1CN01hJ1o1e1IsE3jc1T6X_!!2201524160948-0-daren.jpg_360x360xzq90.jpg_.webp"},
      {"title":"冬季加厚法兰绒家居服","imageUrl":"https://img.alicdn.com/i2/2200785882988/O1CN01h4HGwh1XwY3YKF28V_!!2200785882988.jpg_360x360xzq90.jpg_.webp"},
      {"title":"宝兴 创意金色不锈钢 圆盘子","imageUrl":"https://img.alicdn.com/imgextra/i1/2548684302/O1CN01S3OSW91heMO7SZ59H_!!2548684302.jpg_360x360xzq90.jpg_.webp"},
    ];



    return Container(

      height:150,//ScreenAdaper.height(60),

      child: ListView.builder(
        itemBuilder: (context,index) {
          return Column(
            children: [
              Container(
                child: Image.network(product[index]["imageUrl"] as String,fit: BoxFit.cover),
                width: 100,
                height: 100,
                margin: EdgeInsets.all(5),
              ),
              Container(
                child: Text(product[index]["title"] as String),
                width: 100,
                // height: 20,
              )
            ],

          );
        },
        itemCount: product.length,
        scrollDirection: Axis.horizontal, // 水平滑动
      ),

    );
  }

  Widget _ProductChildren(ProductModel productModel) {
    return InkWell(
      onTap: (){
        print("productModel:${productModel.skuId}");
        Navigator.pushNamed(context, "productDetail",arguments: productModel);
      },
      child: Container(
        width: (ScreenAdaper.getScreenWidth() - 30) / 2,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black12,
                width: 1
            )
        ),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              child: Image.network(productModel.imgUrl,fit: BoxFit.cover,),
              width: double.infinity,
              height: 200,
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  productModel.title,
                  maxLines: 2,
                )
            ),
            Padding(padding: EdgeInsets.only(top: 10,left: 5,right: 5),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(productModel.price,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 17
                      ),),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(productModel.oldprice,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black54
                      ),),
                  )
                ],
              ),)

          ],
        ),
      ),
    );
  }

  Widget _netWorkHotProduct() {


    List<Widget> _getNetWorkProduct() {
      List<Widget> productWidgets = [];

      netWorkProductModel?.data?.productItem.forEach((element) {

        var subWidget = _ProductChildren(ProductModel.netWorkJson(element));

        productWidgets.add(subWidget);
      });

      return productWidgets;

    }


    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
          runSpacing: 10, // 垂直间距
          spacing: 10,  // 水平间距
          children: _getNetWorkProduct()
      ),
    );

  }

  // 热门推荐
  Widget _hotProduct() {

    var productLists = [
      {"price":"￥23.5","oldprice":"￥20.3","title":"豆豆早安 羊驼毛限定色 欧尼长款双面呢大衣小个子毛呢外套女冬","imageUrl":"https://img.alicdn.com/imgextra/i3/284970081/O1CN01PSXixj1CT8nNXf9ve_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"La Koradior拉珂蒂英伦风女中长款羊毛呢子外套大衣2021冬季新款","imageUrl":"https://img.alicdn.com/imgextra/i2/114203488/O1CN01ivToA01bdYCwbrUOF_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"安小落白鸭绒宽松连帽中长款毛领羽绒服女气质冬2021新款保暖外套","imageUrl":"https://img.alicdn.com/imgextra/i1/27546784/O1CN01biwF5C1zz7cWlOJiO_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"欧阳娜娜同款白鸭绒羽绒服女2021冬季设计感小众加厚小个子短外套","imageUrl":"https://img.alicdn.com/imgextra/i3/98354039/O1CN01gwEbUo1fhuPzr1yjg_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"LINC金羽杰羽绒服女2021年新款短款面包服羽绒服外套女Y21802295","imageUrl":"https://img.alicdn.com/imgextra/i3/29757030/O1CN014UJ32G21nn4XOFLVv_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"中长款花色羽绒服女2021冬季新款时尚洋气女装小个子气质爆款外套","imageUrl":"https://img.alicdn.com/imgextra/i1/123973676/O1CN014pMojn1d1eeqyVIUd_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"MR WATER水滴君 柏林傍晚 绿色复古拼接狐狸毛领羽绒服女冬中长款","imageUrl":"https://img.alicdn.com/imgextra/i2/23548631/O1CN01MJJtBE2Dd39v3n8Qe_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"MR WATER水滴君 冰岛极光 水貂皮草马甲外套全毛双面呢大衣套装女","imageUrl":"https://img.alicdn.com/imgextra/i4/23548631/O1CN01tjVV6R2Dd39uweVVG_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"菲梦伊西装连衣裙女长袖春季新款时尚气质修身通勤流行职业中长裙","imageUrl":"https://img.alicdn.com/imgextra/i4/29890736/O1CN01M9KpZV1HJ89Ss55LV_!!0-saturn_solar.jpg"},
      {"price":"￥23.5","oldprice":"￥20.3","title":"签儿冬季羽绒服2021年女假两件羊毛双面尼中长款设计感小众外套","imageUrl":"https://img.alicdn.com/imgextra/i1/129680344/O1CN01f7ciJp1EPatAtuUoh_!!0-saturn_solar.jpg"},
    ];





    List<Widget> _getProduct() {

      List<Widget> productWidgets = [];
      for(var i = 0 ; i < productLists.length;i++)  {

        var productModel = ProductModel.fromJson(productLists[i]);

        productWidgets.add(_ProductChildren(productModel));
      }

      return productWidgets;
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10, // 垂直间距
        spacing: 10,  // 水平间距
        children: _getProduct()
      ),
    );

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // title: Text(_pages[_currentIndex]["title"] as String),
        title: Container(
          child: InkWell(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 233, 233, 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10,right:5),child: Icon(Icons.search,size: 25,),),
                  Text("笔记本",style: TextStyle(
                    fontSize: 16,
                  ),)
                ],
              ),
            ),
            onTap: (){

              Navigator.pushNamed(context, "search");

            },
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.center_focus_weak),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message, size: 28, color: Colors.black87),
            onPressed: null,
          )
        ],
      ),
      body: ListView(
        children: [
          _swiperWidget(),
          _titleWidget("猜你喜欢"),
          _yourlove(),
          _titleWidget("热门推荐"),
          // _hotProduct()
          _netWorkHotProduct()
        ],
      ),
    );



  }

  // 状态保持，让页面不会重复加载
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
