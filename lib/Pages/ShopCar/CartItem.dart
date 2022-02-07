import 'package:flutter/material.dart';
import 'package:flutter_advanced/Servers/ScreenAdaper.dart';
import 'package:provider/provider.dart';
import '../../Provider/ShopCarCounter.dart';
import 'CartNumber.dart';
class CartItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartItemState();
  }
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<ShopCarCounter>(context);

    return Container(
      decoration: BoxDecoration(
          // color: Colors.red,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      height: 130,
      child: Row(
        children: [
          Container(
            width: 30,
            child: Checkbox(
              value: true,
              onChanged: (value) {
                print("change ${value}");
              },
              activeColor: Colors.pink,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 100,
            child: Image.network(
              "https://img14.360buyimg.com/n1/jfs/t1/87309/25/15723/86324/5e748320Ec3ed62c6/2762e3d2f6a700e5.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "新年礼物】爱沃驰（I＆W）瑞士手表男士全自动机械男表 经典系列时尚轻奢超薄镂空商务双日历防水腕表 玫瑰金蓝面 / 竹节纹黑皮带【苏有朋明星同款】",
                      maxLines: 2),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("￥999"),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CartNumber(1),
                      )
                    ],
                  )
                ],
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
