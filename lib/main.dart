import 'package:flutter/material.dart';
import 'routers/routers.dart';

main() => runApp(MyApp("京东商城"));


class MyApp extends StatefulWidget {
  String title;
  MyApp(this.title);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          // Define the default brightness and colors.

          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.white, // appbar背景颜色
            onPrimary: Colors.black, // appbar文字颜色
            brightness: Brightness.light,
          ),
        )


      //home: Tabs(),
    );

  }
}

