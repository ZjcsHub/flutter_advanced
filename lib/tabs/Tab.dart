import 'package:flutter/material.dart';
import 'package:flutter_advanced/Pages/Home.dart';
import 'package:flutter_advanced/Pages/Category.dart';
import 'package:flutter_advanced/Pages/My.dart';
import 'package:flutter_advanced/Pages/ShopCart.dart';
import '../Servers/ScreenAdaper.dart';

class Tabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabState();
  }

}
class _TabState extends State {
  int _currentIndex = 1;

  final _pages = [
    {"title":"首页","value":HomePage()},
    {"title":"分类","value":Category()},
    {"title":"购物车","value":ShopCart()},
    {"title":"我的","value":MyPage()},
  ];

  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

  }

@override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentIndex]["title"] as String),
        leading: IconButton(
          icon: Icon(Icons.center_focus_weak),
        ),

      ),
      // body: _pages[_currentIndex]["value"] as Widget,

      // body: IndexedStack( // 这个组件可以保持页面不会每次刷新加载，可以保持，但是有个缺点就是一次性加载多个页面
      //   index: _currentIndex,
      //   children:  _pages.map((e) => e["value"] as Widget).toList()
      //
      // ),

      body: PageView(
        controller: this._pageController,
        children:  _pages.map((e) => e["value"] as Widget).toList(),

      ),

      bottomNavigationBar:BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"首页" ),
          BottomNavigationBarItem(icon: Icon(Icons.category),label:"分类" ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:"购物车" ),
          BottomNavigationBarItem(icon: Icon(Icons.people),label:"我的" ),
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