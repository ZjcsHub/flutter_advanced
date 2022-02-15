import 'dart:async';

import 'package:flutter/material.dart';
import '../../Widget/TextComment.dart';
import '../../Widget/MyButton.dart';
class RegisterSecond extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _RegisterSecondState();

  }
}

class _RegisterSecondState extends State<RegisterSecond> {
  TextEditingController? phoneNumberController;

  bool sendCodeBtn = false;
  int number = 10;


  showTimer() {
    print("开始定时器");
    sendCodeBtn = false;
    number = 10;
    // 定时器
    Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {

      setState(() {
        number--;
      });
      if (number <= 0) {
        timer.cancel();

        sendCodeBtn = true;
      }
    });






  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showTimer();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("注册第二步"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: ListView(

          children: [

            Container(
              margin: EdgeInsets.all(10),
              child: Text("请输入手机号收到的验证码"),
            ),

            Stack(
              children: [
                TextComment.setHeight(50, phoneNumberController, "请输入验证码", false, (text){
                  print("changetext：$text");
                }),
                Positioned(child: TextButton(

                  child: sendCodeBtn == false ? Text("${this.number}秒后重发")  : Text("重新发送"),
                  onPressed: (){
                    print("重新发送:${sendCodeBtn}");
                    if (sendCodeBtn) {
                      showTimer();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      //设置按下时的背景颜色
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue[200];
                      }
                      //默认不使用背景颜色
                      return Colors.black12;
                    }),
                  ),
                ),
                right: 0,
                top: 0,
                )
              ],
            ),



            SizedBox(height: 10,),
            MyButton(text: "下一步",height: 50,decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
              onClick: (){
                // Navigator.popAndPushNamed(context, "registerthird");
                Navigator.pushReplacementNamed(context, "registerthird");

              },
            )
          ],
        ),
      ),
    );

  }
}
