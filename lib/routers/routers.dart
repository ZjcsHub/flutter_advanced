// 路由配置文件
import 'package:flutter/material.dart';
import '../tabs/Tab.dart';

final routers = {
  "/":(context,{arguments}) => Tabs(),
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