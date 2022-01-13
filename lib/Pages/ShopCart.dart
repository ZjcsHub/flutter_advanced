import 'package:flutter/material.dart';

class ShopCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopCartState();
  }
}

class _ShopCartState extends State {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: Text("购物车"),
    );

  }
}
