import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced/model/productModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
class ProductContentsSecond extends StatefulWidget {

  late ProductModel _productModel;
  ProductContentsSecond(this._productModel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentsSecondState();
  }
}

class _ProductContentsSecondState extends State<ProductContentsSecond> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text("商品详情"),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}