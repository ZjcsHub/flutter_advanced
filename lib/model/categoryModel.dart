
class CategoryModel {

  String title = "";

  late List<CategoryItemsModel> itemLists;

  CategoryModel.formJson(Map<String, dynamic> json) {
    this.title = json["title"];
    if (json['itemLists'] != null) {
      itemLists = [];
      json['itemLists'].forEach((v) {
        itemLists.add(new CategoryItemsModel.fromJson(v));
      });
    }
  }


}

class CategoryItemsModel {

  String title = "";
  String imageUrl = "";

  CategoryItemsModel.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.imageUrl = json["imageUrl"];
  }

}