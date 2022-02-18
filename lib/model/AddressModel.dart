import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class AddressModel {

  String name = "";

  String phoneNumber = "";

  String address = "";

  bool isSelect = true;

  AddressModel();

  Map changeMap() {

    return {
      "name":this.name,
      "phoneNumber":this.phoneNumber,
      "address":this.address,
      "isSelect":this.isSelect
    };

  }

  AddressModel.fromJson(Map map) {

    if (map["name"] != null) {
      this.name = map["name"];
    }

    if (map["phoneNumber"] != null) {
      this.phoneNumber = map["phoneNumber"];
    }

    if (map["address"] != null) {
      this.address = map["address"];
    }

    this.isSelect = map["isSelect"];
  }



  static saveToLocation(AddressModel model) async {

    SharedPreferences sp = await SharedPreferences.getInstance();

    var addressBook = sp.getStringList("addressBook");
    var jsonString = convert.jsonEncode(model.changeMap());
    if (addressBook == null) {

      addressBook = [jsonString];
    }else{

      addressBook = addressBook.map((e){
        var addressModel = AddressModel.fromJson(convert.jsonDecode(e));
        addressModel.isSelect = false;
        return convert.jsonEncode(addressModel.changeMap());
      }).toList();

      addressBook.add(jsonString);
    }
    await sp.setStringList("addressBook", addressBook);
  }
  
  static Future<List<AddressModel>> getAllLocation() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    var addressBook = sp.getStringList("addressBook");

    if (addressBook == null) {
      return [];
    }else{

      return addressBook.map((e){
        return AddressModel.fromJson(convert.jsonDecode(e));
      }).toList();
      
    }
    


  }

  static Future<AddressModel?> getDefalutAddress() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var addressBook = sp.getStringList("addressBook");

    var firstModel = addressBook?.firstWhere((element) {
      var addressModel = AddressModel.fromJson(convert.jsonDecode(element));
      return addressModel.isSelect;
    });
    if (firstModel != null) {
      return AddressModel.fromJson(convert.jsonDecode(firstModel));
    }

    return null;

  }
}