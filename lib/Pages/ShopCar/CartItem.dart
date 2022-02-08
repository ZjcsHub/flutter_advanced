import 'package:flutter/material.dart';
import 'package:flutter_advanced/Servers/ScreenAdaper.dart';
import 'package:provider/provider.dart';
import '../../Provider/ShopCarCounter.dart';
import 'CartNumber.dart';
import '../../model/ProductDetailModel.dart';
import '../../EventBus/ShopCartEvent.dart';
class CartItem extends StatefulWidget {

  late ProductDetailModel _productModel;

  CartItem(this._productModel);

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
              value: widget._productModel.checked,
              onChanged: (value) {
                print("change ${value}");
                setState(() {
                  widget._productModel.checked = !widget._productModel.checked;
                  eventBus.fire(ShopCartItemEvent("更改购物车全选"));
                });


              },
              activeColor: Colors.pink,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 100,
            child: Image.network(
              widget._productModel.imagePath,
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
                      widget._productModel.name,
                      maxLines: 2),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("￥${widget._productModel.price}"),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CartNumber(widget._productModel.count,(number){
                          print("点击数量：$number");
                          widget._productModel.count = number;
                        }),
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
