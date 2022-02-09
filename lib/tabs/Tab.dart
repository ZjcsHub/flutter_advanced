import 'package:flutter/material.dart';
import 'package:flutter_advanced/Pages/Home.dart';
import 'package:flutter_advanced/Pages/Category.dart';
import 'package:flutter_advanced/Pages/My/My.dart';
import 'package:flutter_advanced/Pages/ShopCar/ShopCart.dart';
import 'package:flutter_advanced/Servers/ScreenAdaper.dart';
import '../EventBus/ShopCartEvent.dart';
class Tabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabState();
  }
}

class _TabState extends State {
  int _currentIndex = 0;

  final _pages = [
    {"title": "首页", "value": HomePage()},
    {"title": "分类", "value": Category()},
    {"title": "购物车", "value": ShopCart()},
    {"title": "我的", "value": MyPage()},
  ];

  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

    // 监听通知
    eventBus.on<ShopCartdisplayEvent>().listen((event) {


      setState(() {
        _pageController?.jumpToPage(2);
        this._currentIndex = 2;
      });


    });

  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(

      // body: _pages[_currentIndex]["value"] as Widget,

      // body: IndexedStack( // 这个组件可以保持页面不会每次刷新加载，可以保持，但是有个缺点就是一次性加载多个页面
      //   index: _currentIndex,
      //   children:  _pages.map((e) => e["value"] as Widget).toList()
      //
      // ),

      body: PageView(
        controller: this._pageController,
        children: _pages.map((e) => e["value"] as Widget).toList(),
        onPageChanged: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),// 禁止左右滑动
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "购物车"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的"),
        ],
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.blue,
        // unselectedItemColor: Colors.grey,
        fixedColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (index) {
          // setState(() {
          //   this._currentIndex = index;
          // });

          setState(() {
            this._currentIndex = index;
            this._pageController?.jumpToPage(index);
          });
        },
      ),
    );
  }
}
