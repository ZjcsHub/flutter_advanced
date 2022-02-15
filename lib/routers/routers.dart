// 路由配置文件
import 'package:flutter/material.dart';
import 'package:flutter_advanced/Pages/My/Login.dart';
import '../Pages/ProductContent.dart';
import '../Pages/TarbarChange.dart';
import '../tabs/Tab.dart';
import '../Pages/ProductsLists.dart';
import '../Pages/SearchView.dart';
import '../Pages/ProductDetailView.dart';
import '../Pages/My/RegisterFirst.dart';
import '../Pages/My/RegisterSecond.dart';
import '../Pages/My/RegisterThird.dart';
final routers = {
  "/":(context,{arguments}) => Tabs(),
  "products":(context,{arguments}) => ProductsLists(arguments),
  "tabbar":(context,{arguments}) => TarbarChange(),
  "search":(context,{arguments}) => SearchView(),
  "productContent":(context,{arguments}) => ProductContent(),
  "productDetail":(context,{arguments}) => ProductDetailView(arguments),
  "login":(context,{arguments}) => Login(),
  "registerfirst":(context,{arguments}) => RegisterFirst(),
  "registersecond":(context,{arguments}) => RegisterSecond(),
  "registerthird":(context,{arguments}) => RegisterThird(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function pageContentBuilder = routers[name] as Function;
  print(pageContentBuilder);
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      print(settings.arguments);
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context,arguments:settings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }

  }
};