import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/categoryModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ProductsLists extends StatefulWidget {
  // Map arguments;

  CategoryItemsModel itemModel;

  ProductsLists(this.itemModel);

  @override
  State<StatefulWidget> createState() {

    return _ProdictsListsState();

  }

}

class _ProdictsListsState extends State<ProductsLists> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemModel.title),
      ),
      body: WebView(
        initialUrl: widget.itemModel.productUrl,
      ),
    );
  }
}