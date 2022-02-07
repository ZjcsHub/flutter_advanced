import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  // 状态
  int _count = 0;

  int get count => this._count; // 获取状态

  incCount() {
    this._count++;
    // 更新状态
    notifyListeners();
  }


}