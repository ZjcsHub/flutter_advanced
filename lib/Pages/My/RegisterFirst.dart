import 'package:flutter/material.dart';
import '../../Widget/TextComment.dart';
import '../../Widget/MyButton.dart';
class RegisterFirst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _RegisterFirstState();

  }
}

class _RegisterFirstState extends State<RegisterFirst>{
  TextEditingController? phoneNumberController;

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
  }

  sendCode() {
    var phoneNumber = phoneNumberController?.value.text ?? "";
    RegExp reg = RegExp(r"^1\d{10}$");
    var isPhoneNumber = reg.hasMatch(phoneNumber);

    if (isPhoneNumber) {
      Navigator.pushReplacementNamed(context, "registersecond");
    }


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("用户注册"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: ListView(

          children: [

            SizedBox(height: 10,),
            TextComment.setHeight(50, phoneNumberController, "请输入手机号", false, (text){
              print("changetext：$text");
            }),

            SizedBox(height: 10,),
            MyButton(text: "下一步",height: 50,decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
              onClick: sendCode,
            )
          ],
        ),
      ),
    );

  }
}
