import 'package:flutter/material.dart';
import 'package:flutter_advanced/Servers/Storage.dart';


class UserLoginNotifier with ChangeNotifier {

  bool isLogin = false;

  UserLoginNotifier() {
    print("UserLoginNotifier 初始化");
     Storage.getString("isLogin").then((value) {
       this.isLogin = value == "1";
       notifyListeners();
     });
  }

  login() {
    isLogin = true;
    Storage.setString("isLogin", "1");
    notifyListeners();
  }

  logOut() {
    isLogin = false;
    Storage.setString("isLogin", "0");
    notifyListeners();
  }

}