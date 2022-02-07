import 'package:flutter/material.dart';
import 'package:flutter_advanced/Pages/ShopCar/CartNumber.dart';
import 'package:flutter_advanced/Servers/ScreenAdaper.dart';
import 'package:flutter_advanced/Widget/MyButton.dart';
import 'package:provider/provider.dart';
import '../../Provider/Counter.dart';
import '../../Provider/ShopCarCounter.dart';
import 'CartItem.dart';

class ShopCart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopCartState();
  }
}

class _ShopCartState extends State {
  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<Counter>(context);

    var cartProvider = Provider.of<ShopCarCounter>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem(),
                CartItem()
              ],
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
                                value: true,
                                onChanged: (value) {},
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
