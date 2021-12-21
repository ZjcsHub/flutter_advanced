import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {

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

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        _swiperWidget(),
        _titleWidget("猜你喜欢"),
        _titleWidget("热门推荐")
      ],
    );

  }
}
