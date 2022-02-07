import 'dart:convert';

import 'package:dio/dio.dart';
class ProductDetailModel {

  late String name;
  late String color;
  late String size;
  late String spec;
  late String imagePath;


  ProductDetailModel.formJson(Map map,String Skuid) {

    if (map[Skuid] != null) {

      Map skuMap = map[Skuid];

      this.name = skuMap["name"];
      this.color = skuMap["color"];
      this.size = skuMap["size"];
      this.spec = skuMap["spec"];
      this.imagePath = "https://m.360buyimg.com/mobilecms/" + skuMap["imagePath"];

    }

  }

  // 加载数据
  static Future<ProductDetailModel> LoadData(String skuid)  {
    // ids=10026350700987
    var url = "https://yx.3.cn/service/info.action";
    var dio = Dio();
    var response =  dio.get(url,queryParameters: {"ids":skuid}).then((value) {

      var jsonMap = json.decode(value.data);
      return ProductDetailModel.formJson(jsonMap,skuid);
    });

    return response;
  }



}