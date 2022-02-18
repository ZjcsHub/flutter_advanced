import 'package:flutter/material.dart';
import 'package:flutter_advanced/Provider/ShopCarCounter.dart';
import 'package:flutter_advanced/model/ProductDetailModel.dart';
import 'package:provider/provider.dart';
import '../../Widget/MyButton.dart';
import '../../model/AddressModel.dart';
class CheckOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _CheckOutState();

  }
}

class _CheckOutState extends State<CheckOut> {
  ShopCarCounter? _cartProvider;


  AddressModel? _defalutAddress;

  Widget _checkOutProductItem(ProductDetailModel detailModel) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      height: 130,
      child: Row(
        children: [

          Container(
            padding: EdgeInsets.all(10),
            width: 100,
            child: Image.network(
              detailModel.imagePath,
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
                      detailModel.name,
                      maxLines: 2),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("￥${detailModel.price}"),
                      ),

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

  _getShopCartItems() {

    var cartLists = this._cartProvider?.carlists.where((element) => (element as ProductDetailModel).checked == true);
    return Column(
      children: cartLists?.map((e) => _checkOutProductItem((e as ProductDetailModel))).toList() as List<Widget>
    );

  }

  @override
  Widget build(BuildContext context) {
    if (this._cartProvider == null) {
      this._cartProvider = Provider.of<ShopCarCounter>(context);
    }

    // 获取最新一条地址
     AddressModel.getDefalutAddress().then((value){
       setState(() {
         _defalutAddress = value;
       });
     });

    return Scaffold(
      appBar: AppBar(
        title: Text("结算"),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title:Center(
                        child: _defalutAddress != null ? Column(
                          children: [
                            Text("${_defalutAddress?.name} ${_defalutAddress?.phoneNumber}"),
                            Text("${_defalutAddress?.address}")
                          ],
                        ): Text("请添加收货地址"),
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "addressLists");
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),

              _getShopCartItems(),
              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("商品总金额",style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("￥${_cartProvider?.allPrice}",style: TextStyle(
                          color: Colors.red,
                          fontSize: 17
                      ),),
                    ),
                  ],
                ),
              ),

            ],
          ),
          Positioned(child: MyButton(text: "立即下单",decoration: BoxDecoration(
              color: Colors.red
          ),
            height: 60,
          ),
          bottom: 0,
          left: 0,
          right: 0,)
        ],
      ),
    );

  }
}