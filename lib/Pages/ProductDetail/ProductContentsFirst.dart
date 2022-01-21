import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced/model/productModel.dart';
import 'package:flutter/material.dart';

class ProductContentsFirst extends StatefulWidget {
  late ProductModel _productModel;

  ProductContentsFirst(this._productModel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentsFirstState();
  }
}

class _ProductContentsFirstState extends State<ProductContentsFirst> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              widget._productModel.imgUrl,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              widget._productModel.title,
              style: TextStyle(color: Colors.black87, fontSize: 17),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text("原价:"),
                      Text(
                        widget._productModel.oldprice,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 17,
                        decoration:TextDecoration.lineThrough ),
                      )
                    ],
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("现价:"),
                      Text(widget._productModel.price,
                          style: TextStyle(color: Colors.red, fontSize: 17))
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Text("已选"),
                Text("115 黑色 ")
              ],
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: Row(
              children: [
                Text("运费："),
                Text("免运费")
              ],
            ),
          )
        ],
      ),
    );
  }
}
