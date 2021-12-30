import 'package:dio/dio.dart';

class ProductModel extends Object {
  String imgUrl = "";
  String price = "";
  String oldprice = "";
  String title = "";

  // ProductModel(this.imgUrl,this.price,this.oldprice,this.title);

  ProductModel.fromJson(Map json) {
    this.imgUrl = json["imageUrl"];
    this.price = json["price"];
    this.oldprice = json["oldprice"];
    this.title = json["title"];
  }

  ProductModel.netWorkJson(ProductItem productItem) {
    this.imgUrl = productItem.imgUrl;
    this.price = productItem.price;
    this.oldprice = productItem.oldprice;
    this.title = productItem.title;
  }
}

class NetWorkProductModel {
  late String code;
  late String msg;
  late ProductObject? data;
  late String rtn;

  NetWorkProductModel(this.code, this.msg, this.data, this.rtn);

  NetWorkProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data =
        json['data'] != null ? new ProductObject.fromJson(json['data']) : null;
    rtn = json['rtn'];
  }

  static LoadData() async {

      var url = 'https://o2api.jd.com/data?body=%7B%22query%22%3A%22query%20getCommodities(%24ids%3A%20String)%7Bcommodities(ids%3A%20%24ids)%7BgroupId%2C%20groupName%2C%20productList%7BcanSell%20skuId%20name%20image%20title%20productImage%20commentCount%20goodRate%20currentPrice%20jdPrice%20pPrice%20pcpPrice%20plusPrice%20productExtInfo%20tag%20copyWriting%20copyWritingDown%20backUpWords%7D%7D%7D%22%2C%22operationName%22%3A%22getCommodities%22%2C%22variables%22%3A%7B%22ids%22%3A%22%5B15168070%5D%22%7D%2C%22config%22%3A%7B%22cache%22%3Afalse%2C%22trim%22%3Atrue%2C%22map%22%3A%7B%22keyBy%22%3A%22groupId%22%2C%22valueField%22%3A%22productList%22%7D%7D%7D';
      var dio = Dio();
      var response = await dio.get(url);

      // print(response.data);

      return NetWorkProductModel.fromJson(response.data);
  }

}

class ProductObject {
  late List<ProductItem> productItem;

  ProductObject.fromJson(Map<String, dynamic> json) {
    if (json['15168070'] != null) {
      productItem = [];
      json['15168070'].forEach((v) {
        productItem.add(new ProductItem.fromJson(v));
      });
    }
  }
}

class ProductItem {
  String imgUrl = "";
  String price = "";
  String oldprice = "";
  String title = "";

  ProductItem.fromJson(Map json) {
    this.imgUrl = json["image"];
    this.price = json["pPrice"];
    this.oldprice = json["pcpPrice"];
    this.title = json["name"];
  }
}
