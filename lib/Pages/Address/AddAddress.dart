import 'package:flutter/material.dart';
import '../../Widget/TextComment.dart';
import '../../Widget/MyButton.dart';
import 'package:city_pickers/city_pickers.dart';
import '../../model/AddressModel.dart';
class AddAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _AddAddressState();

  }
}

class _AddAddressState extends State<AddAddress> {

  TextEditingController? _userNameContoller;
  TextEditingController? _phoneNumberContoller;
  TextEditingController? _addressContoller;

  String? _cityLocation;

  @override
  void initState() {
    super.initState();
    _userNameContoller = TextEditingController();
    _phoneNumberContoller = TextEditingController();
    _addressContoller = TextEditingController();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("增加收货地址"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextComment.setHeight(50, _userNameContoller, "输入收货人姓名", false, (text) => {

            }),
            TextComment.setHeight(50, _phoneNumberContoller, "输入收货人电话", false, (text) => {

            }),

            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Colors.black
                        )

                    )
                ),
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.add_location),
                    Text(_cityLocation ?? "省/市/区",style: TextStyle(
                        color: _cityLocation != null ? Colors.black : Colors.grey,
                      fontSize: 17
                    ),)
                  ],
                ),
              ),
              onTap: () async {
                print("弹出省市区");

                Result? result = await CityPickers.showCityPicker(context: context,);

                print(result);
                setState(() {
                  if (result != null) {
                    this._cityLocation = (result.provinceName ?? "") + (result.areaName ?? "") + (result.cityName ?? "");

                  }else{
                    this._cityLocation = null;

                  }
                });

              },
            ),

            TextComment(height: 150,
            controller: _addressContoller,
            hintText: "输入详细地址",
            changeTextMethod: (text){

            },
              maxLine: 3,
            ),
            SizedBox(height: 20,),
            MyButton(
              text: "增加",
              decoration: BoxDecoration(
                color: Colors.red,

              ),
              height: 40,
              onClick: () async {

                AddressModel addressModel = AddressModel();
                addressModel.address = (this._cityLocation ?? "") + (_addressContoller?.text ?? "");
                addressModel.phoneNumber = _phoneNumberContoller?.text ?? "";
                addressModel.name = _userNameContoller?.text ?? "";
                await AddressModel.saveToLocation(addressModel);

                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );

  }
}