import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced/Widget/MyButton.dart';
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

  void _attrShowBottomSheet() {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(context: context, builder: (contex){

      return GestureDetector(
        onTap: (){

        }, // 解决 showModalBottomSheet 点击消失的问题
        child: Container(
          height: size.height / 2,
          child: Stack(
            children: [
              ListView(
                children: [

                  Row(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        margin: EdgeInsets.all(10),
                        child: Text("颜色:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                      Container(
                        width: size.width - 70,
                        child: Wrap(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("黑色")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("白色")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("粉色色")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("白灰色")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("黑色")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("白色")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("粉色色")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("白灰色")),
                            ),                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        margin: EdgeInsets.all(10),
                        child: Text("大小:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                      Container(
                        width: size.width - 70,
                        child: Wrap(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("XS")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("S")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("L")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("XL")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("XXL")),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              child: Chip(label: Text("XXXL")),
                            ),

                          ],
                        ),
                      )
                    ],
                  )

                ],
              ),
              Positioned(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: MyButton(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 40,
                            margin: EdgeInsets.only(left: 10,right: 5),
                            text: "加入购物车",
                            onClick: (){
                              print("加入购物车");
                            },
                          )
                      ),
                      Expanded(
                          flex: 1,

                          child:  MyButton(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 40,
                            margin: EdgeInsets.only(left: 5,right: 10),
                            text: "立即购买",
                            onClick: (){
                              print("立即购买");
                            },
                          )
                      )
                    ],
                  ),

                ),
                bottom: 0,
                width: size.width,
                height: 90,
              )
            ],
          ),
        ),
      );

    });
  }



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
          InkWell(
            onTap: (){
              _attrShowBottomSheet();
            },
            child: Container(
              height: 40,
              child: Row(
                children: [
                  Text("已选"),
                  Text("115 黑色 ")
                ],
              ),
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
