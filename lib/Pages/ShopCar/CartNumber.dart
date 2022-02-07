import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/ShopCarCounter.dart';
class CartNumber extends StatefulWidget {

  int startNumber = 0;

  CartNumber(this.startNumber);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartNumberState();
  }
}

class _CartNumberState extends State<CartNumber> {

  //  左侧按钮
  Widget _leftBtn(){

    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        child: Text("-"),
      ),
      onTap: (){
        print("减少");
        dealWithNumber(false);
      },
    );
  }

  Widget _rightBtn(){

    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        child: Text("+"),
      ),
      onTap: (){
        print("增多");
        dealWithNumber(true);
      },
    );
  }

  Widget _centerArea() {
    return  Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 1,
            color: Colors.black12
          ),
          right:BorderSide(
              width: 1,
              color: Colors.black12
          ),
        )
      ),
      alignment: Alignment.center,
      width: 40,
      height: 30,
      child: Text("${widget.startNumber}"),
    );
  }

  void dealWithNumber(bool isAdd) {
    setState(() {
      if (isAdd) {
        widget.startNumber++;
      }else{
        if (widget.startNumber <= 1) {
          return;
        }
        widget.startNumber--;

      }
    });


  }

  @override
  Widget build(BuildContext context) {

    var cartProvider = Provider.of<ShopCarCounter>(context);

    // TODO: implement build
    return Container(
      width: 102,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1

        ),

      ),
      child: Row(
        children: [
          _leftBtn(),
          _centerArea(),
          _rightBtn()
        ],
      ),
    );
  }
}