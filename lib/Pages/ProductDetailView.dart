import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/Pages/ProductDetail/ProductContentsFirst.dart';
import 'package:flutter_advanced/Pages/ProductDetail/ProductContentsSecond.dart';
import 'package:flutter_advanced/Pages/ProductDetail/ProductContentsThird.dart';
import 'package:flutter_advanced/Servers/ScreenAdaper.dart';
import 'package:flutter_advanced/Widget/MyButton.dart';
import 'package:flutter_advanced/model/productModel.dart';
import '../model/productModel.dart';
import '../EventBus/ShopCartEvent.dart';

class ProductDetailView extends StatefulWidget {

  late ProductModel productModel;
  ProductDetailView(this.productModel);

  @override
  State<StatefulWidget> createState() {

    return _ProductDetailViewState();
  }
}

class _ProductDetailViewState extends State<ProductDetailView> {




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Container(
                width: 200,
                child: TabBar(
                  indicatorColor: Colors.red,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Text("商品"),
                    ),
                    Tab(
                      child: Text("详情"),
                    ),
                    Tab(
                      child: Text("评价"),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: (){

                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(200, 60, 0, 0),
                    items: [
                      PopupMenuItem(child: Row(
                        children: [
                          Icon(Icons.home),
                          Text("首页")
                        ],
                      )
                      ),
                      PopupMenuItem(child: Row(
                        children: [
                          Icon(Icons.search),
                          Text("搜索")
                        ],
                      )
                      )
                    ]
                );
                
                
              }, icon: Icon(Icons.more_horiz))
            ],
          ),
          body: Stack(
            children: [
              TabBarView(
                children: [
                  ProductContentsFirst(widget.productModel),
                  ProductContentsSecond(widget.productModel),
                  ProductContentsThird(),
                ],
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                  bottom: 0,
                    height: 60,
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.black26,
                            width: 1
                          )
                        )
                      ),

                      child: Row(

                        children: [

                          Container(
                           margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            width: 100,
                            child: Column(
                              children: [
                                Icon(Icons.shopping_cart),
                                Text("购物车")
                              ],
                            ),
                          ),
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
                                  // 广播
                                  // eventBus.fire(ShopCartEvent("加入购物车"));
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
                    )
              )
              ],
          )
        )
    );
  }
}