import 'package:flutter/material.dart';
import 'package:flutter_advanced/Servers/Storage.dart';
import '../../Widget/TextComment.dart';
import '../../Widget/MyButton.dart';
import '../../Provider/UserLoginNotifier.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _LoginState();
  }
}

class _LoginState extends State<Login> {

  TextEditingController? userNamecontroller;
  TextEditingController? passwordcontroller;

  UserLoginNotifier? _userLoginProvider;

  @override
  void initState() {
    super.initState();

    userNamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();


  }

  @override
  Widget build(BuildContext context) {

    // 获取Pro
    if (this._userLoginProvider == null) {
      this._userLoginProvider = Provider.of<UserLoginNotifier>(context);
    }


    return Scaffold(
    appBar: AppBar(
      title: Text("登录"),
      leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: [
        TextButton(onPressed: (){}, child: Text("客服",style: TextStyle(
          color: Colors.black,
          fontSize: 15
        ),))
      ],
    ),
    body: Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: ListView(

        children: [
          Center(
            child: Container(
              width: 160,
              height: 160,
              child: Image.asset("images/jdlogo.png"),
            ),
          ),
          SizedBox(height: 20,),
          TextComment.setHeight(50, userNamecontroller, "用户名", false, (text){
            print("changetext：$text");
          }),
          TextComment.setHeight(50, passwordcontroller, "密码", true, (text){
            print("changetext：$text");
          }),
          SizedBox(height: 10,),
          Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: Text("新用户注册"),
                    onTap: (){
                      print("新用户注册");
                      Navigator.pushNamed(context, "registerfirst");
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text("忘记密码"),
                    onTap: (){
                      print("忘记密码");
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          MyButton(text: "登录",height: 50,decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
            onClick:  () async{
            print("登录");
            // 记录登录状态
              _userLoginProvider?.login();
              Navigator.pop(context);
            },
          )
        ],
      ),
    ),
  );

  }
}