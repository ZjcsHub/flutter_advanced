
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductContentState();
  }
}
class _ProductContentState extends State {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: Text("商品详情"),
    );
  }
}