import 'package:flutter/material.dart';
import 'package:flutter_advanced/Pages/ShopCar/CartNumber.dart';
import 'package:flutter_advanced/Servers/ScreenAdaper.dart';
import 'package:flutter_advanced/Widget/MyButton.dart';
import 'package:flutter_advanced/model/ProductDetailModel.dart';
import 'package:provider/provider.dart';
import '../../Provider/Counter.dart';
import '../../Provider/ShopCarCounter.dart';
import 'CartItem.dart';
import '../../EventBus/ShopCartEvent.dart';
class ShopCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopCartState();
  }
}

class _ShopCartState extends State<ShopCart> {


  bool allChecked = true;
  ShopCarCounter? _cartProvider;
  @override
  void initState() {
    super.initState();

    // 监听
    eventBus.on<ShopCartItemEvent>().listen((event) {

      print("接收到通知");


      // var allState = _cartProvider?.carlists.firstWhere((element) => (element as ProductDetailModel).checked == false);
      var allState = _cartProvider?.carlists.any((element) => (element as ProductDetailModel).checked == false);
      print("allState:$allState");
      if(mounted){
        setState(() {
          allChecked = allState == false;
        });
      }




    });
  }

  // List<CartItem> _getcartShowItem() {
  //
  //   this._cartProvider._carLists
  //
  // }

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<Counter>(context);
    if (this._cartProvider == null) {
      this._cartProvider = Provider.of<ShopCarCounter>(context);
    }


    print("_cartProvider:${this._cartProvider}");
    List<Widget> listViewLists = [];

    for(ProductDetailModel detailModel in _cartProvider!.carlists) {

      listViewLists.add(CartItem(detailModel));

    }

    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
        ),
        body: Stack(
          children: [
            ListView(
              children: listViewLists,
              padding: EdgeInsets.only(bottom: 60),
            ),
            Positioned(
                bottom: 0,
                width: ScreenAdaper.getScreenWidth(),
                height: 60,
                child: Container(
                  width: ScreenAdaper.getScreenWidth(),
                  height: 60,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              child: Checkbox(
                                value: allChecked,

                                onChanged: (value) {
                                  print("全选状态改变：$value");
                                  setState(() {
                                    allChecked = !allChecked;
                                  });

                                  _cartProvider?.setAllCheck(value!);

                                },
                                activeColor: Colors.pink,
                              ),
                            ),
                            Text("全选")
                          ],
                        ),
                      ),
                      Align(

                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith((states) {
                              //设置按下时的背景颜色
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.blue[200];
                              }
                              //默认不使用背景颜色
                              return Colors.red;
                            }),
                          ),
                          child: Text("结算"),
                          onPressed: () {
                            print("结算");
                          },
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ))
          ],
        )
    );

  }
}
