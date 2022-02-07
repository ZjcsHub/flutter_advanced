import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Counter.dart';
class MyPage extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State {

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Text("我的:${counterProvider.count}"),
    );

  }
}
