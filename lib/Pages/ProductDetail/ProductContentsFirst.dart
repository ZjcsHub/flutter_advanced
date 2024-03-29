import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/Pages/ShopCar/CartNumber.dart';
import 'package:flutter_advanced/Provider/ShopCarCounter.dart';
import 'package:flutter_advanced/Widget/MyButton.dart';
import 'package:flutter_advanced/model/productModel.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../EventBus/ShopCartEvent.dart';
import '../../model/ProductDetailModel.dart';

class ProductContentsFirst extends StatefulWidget {
  late ProductModel _productModel;
  ProductDetailModel? _productDetailModel;
  ProductContentsFirst(this._productModel);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductContentsFirstState();
  }
}

class _ProductContentsFirstState extends State<ProductContentsFirst> {
  @override
  void initState() {
    super.initState();
    // 加载数据
    ProductDetailModel.LoadData(widget._productModel.skuId).then((value) {
      setState(() {
        widget._productDetailModel = value;
        widget._productDetailModel?.name = widget._productModel.title;
        widget._productDetailModel?.imagePath = widget._productModel.imgUrl;
        widget._productDetailModel?.price = widget._productModel.price;
      });
    });
    // 监听广播
    eventBus.on<ShopCartEvent>().listen((event) {
      print("接收到通知");
      _attrShowBottomSheet();
    });
  }

  void _attrShowBottomSheet() {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (contex) {
          var _cartProvider = Provider.of<ShopCarCounter>(contex);
          return StatefulBuilder(
              builder: (BuildContext buildcontext, setState) {
            return GestureDetector(
              onTap: () {}, // 解决 showModalBottomSheet 点击消失的问题
              //behavior: HitTestBehavior.opaque, // 解决手势事件触发不了的问题
              child: Container(
                height: size.height / 2,
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "颜色:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Container(
                              width: size.width - 70,
                              child: Wrap(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(label: Text("黑色")),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(label: Text("白色")),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(label: Text("粉色色")),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(label: Text("白灰色")),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(label: Text("黑色")),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(label: Text("白色")),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(label: Text("粉色色")),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(label: Text("白灰色")),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "大小:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Container(
                              width: size.width - 70,
                              child: Wrap(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: Chip(
                                        label: Text(
                                            widget._productDetailModel?.size ??
                                                "")),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                "数量:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            CartNumber(widget._productDetailModel?.count ?? 1,
                                (number) {
                              widget._productDetailModel?.count = number;
                              print("点击数量：$number");
                            })
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
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 40,
                                  margin: EdgeInsets.only(left: 10, right: 5),
                                  text: "加入购物车",
                                  onClick: () {
                                    print("加入购物车");

                                    _cartProvider
                                        .addData(widget._productDetailModel);

                                    // 消失
                                    Navigator.pop(contex);

                                    Toast.show("加入购物车成功");
                                  },
                                )),
                            Expanded(
                                flex: 1,
                                child: MyButton(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 40,
                                  margin: EdgeInsets.only(left: 5, right: 10),
                                  text: "立即购买",
                                  onClick: () {
                                    print("立即购买");
                                  },
                                ))
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
                            decoration: TextDecoration.lineThrough),
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
            onTap: () {
              _attrShowBottomSheet();
            },
            child: Container(
              height: 40,
              child: Row(
                children: [
                  Text("已选"),
                  Text(widget._productDetailModel?.size ?? "")
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            height: 40,
            child: Row(
              children: [Text("运费："), Text("免运费")],
            ),
          )
        ],
      ),
    );
  }
}
