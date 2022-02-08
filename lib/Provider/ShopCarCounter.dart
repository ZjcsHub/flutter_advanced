import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/ProductDetailModel.dart';

class ShopCarCounter with ChangeNotifier {
  // 状态
  List _carLists = [];

 List get carlists => _carLists;

 int get carNumber => _carLists.length;

  addData(value) {
    this._carLists.add(value);
    notifyListeners();
  }


  deleteData(value) {
    _carLists.remove(value);
    notifyListeners();
  }


  setAllCheck(bool isChecked) {
    _carLists.forEach((element) {
      (element as ProductDetailModel).checked = isChecked;
    });
    notifyListeners();
  }

}