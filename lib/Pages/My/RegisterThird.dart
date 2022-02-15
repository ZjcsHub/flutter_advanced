import 'package:flutter/material.dart';
import '../../Widget/TextComment.dart';
import '../../Widget/MyButton.dart';
class RegisterThird extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _RegisterThirdState();

  }
}

class _RegisterThirdState extends State<RegisterThird>{

  TextEditingController? passwordOneController;
  TextEditingController? passwordTwoController;

  @override
  void initState() {

    super.initState();
    passwordOneController = TextEditingController();
    passwordTwoController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: ListView(

          children: [

            SizedBox(height: 20,),
            TextComment.setHeight(50, passwordOneController, "请输入密码", true, (text){
              print("changetext：$text");
            }),
            TextComment.setHeight(50, passwordTwoController, "请再次输入您的密码", true, (text){
              print("changetext：$text");
            }),


            SizedBox(height: 30,),
            MyButton(text: "完成",height: 50,decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
              onClick: (){
                print("完成");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );

  }
}
