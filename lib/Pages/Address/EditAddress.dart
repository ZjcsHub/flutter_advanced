import 'package:flutter/material.dart';

class EditAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _EditAddressState();

  }
}

class _EditAddressState extends State<EditAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改收货地址"),
      ),
      body: Text("修改收货地址"),
    );

  }
}