import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/AddressModel.dart';
import '../../Widget/MyButton.dart';
import '../../model/AddressModel.dart';
class AddressLists extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _AddressListsState();
  }
}

class _AddressListsState extends State<AddressLists> {

  List<AddressModel> _addressLists = [];


  @override
  Widget build(BuildContext context) {

    // 获取地址数组

    List<Widget> _getLocationDisplay() {

     return _addressLists.map((e){

        return ListTile(
          leading: e.isSelect ? Icon(Icons.check,color: Colors.red,) : null,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${e.name} ${e.phoneNumber}"),
              SizedBox(height: 10,),
              Text(e.address)
            ],
          ),
          trailing: Icon(Icons.edit,color:Colors.blue),
        );

      }).toList() as List<Widget>;


    }

    AddressModel.getAllLocation().then((value) {
      setState(() {
        _addressLists = value;
      });
    });


    return Scaffold(
      appBar: AppBar(
        title: Text("地址列表"),
      ),
      body: Container(
        child:Stack(
          children: [
            ListView(
              children: _getLocationDisplay(),
            ),
            Positioned(child: MyButton(height: 50,
            text: "+ 新增收货地址",
            decoration: BoxDecoration(
              color: Colors.red,
              border:Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.black12
                )
              )
            ),
              onClick: (){
              Navigator.pushNamed(context, "addAddress");
              },
            ),bottom: 10,left: 10,right: 10,)
          ],
        ),
      ),
    );

  }
}