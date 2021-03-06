import 'package:flutter/material.dart';
import 'package:flutter_advanced/Pages/ShopCar/CartNumber.dart';
import 'package:flutter_advanced/Provider/UserLoginNotifier.dart';
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

  bool isEdit = false;
  bool allChecked = true;
  ShopCarCounter? _cartProvider;
  UserLoginNotifier? _userLoginProvider;
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

      _cartProvider?.computeAllPrice();




    });
  }

  doCheckOut() {
    // 去结算，判断有没有登录
    if (_userLoginProvider?.isLogin == false) {
      print("没登录");
      return;
    }

    Navigator.pushNamed(context, "checkOut");

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

    if (this._userLoginProvider == null) {
      this._userLoginProvider = Provider.of<UserLoginNotifier>(context);
    }

    print("_cartProvider:${this._cartProvider}");
    List<Widget> listViewLists = [];

    for(ProductDetailModel detailModel in _cartProvider!.carlists) {

      listViewLists.add(CartItem(detailModel));

    }

    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
          actions: [
            IconButton(onPressed: (){

              setState(() {
                this.isEdit = !this.isEdit;
              });

            }, icon: Icon(Icons.edit))
          ],
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
                            Text("全选"),
                            SizedBox(width: 20,),
                            Row(
                              children: this.isEdit == false ? [
                                Text("合计："),
                                Text("${_cartProvider?.allPrice}")
                              ]:[],
                            )
                          ],
                        ),
                      ),
                      this.isEdit == false ? Align(
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
                          onPressed: doCheckOut,
                        ),
                      ):Align(
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
                          child: Text("删除"),
                          onPressed: () {
                            print("删除");
                            this._cartProvider?.deleteAllData();
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
