import 'package:flutter/material.dart';
import 'package:flutter_advanced/model/ProductDetailModel.dart';

class ShopCarCounter with ChangeNotifier {
  // 状态
  List _carLists = [];

 List get carlists => _carLists;

 int get carNumber => _carLists.length;

 // 总价
  double _allPrice = 0;

  double get allPrice => _allPrice;

  addData(value) {
    this._carLists.add(value);
    notifyListeners();
    computeAllPrice();
  }


  deleteAllData() {

    this._carLists.removeWhere((element) => (element as ProductDetailModel).checked == true);
    notifyListeners();
    computeAllPrice();
  }

  deleteData(value) {
    _carLists.remove(value);
    notifyListeners();
    computeAllPrice();
  }


  setAllCheck(bool isChecked) {
    _carLists.forEach((element) {
      (element as ProductDetailModel).checked = isChecked;
    });
    notifyListeners();
    computeAllPrice();
  }

  computeAllPrice() {
    var totalPrice = 0.0;
    _carLists.forEach((element) {
      var detailModel = element as ProductDetailModel;
      if (detailModel.checked == true) {
        totalPrice += double.parse(detailModel.price) * detailModel.count;
      }
    });
    this._allPrice = totalPrice;
    notifyListeners();
  }

}