import 'dart:convert';

import 'Storage.dart';
class SearchServer {

  static Future<List<String>> getSearchData() async {
    var str = await Storage.getString("searchLists");
    if (str != null) {
      var searchListData = json.decode(str).cast<String>();
      print("searchListData:$searchListData");
      return searchListData;
    }

    return [];

  }


  static setSearchData(value) async {
    var str = await Storage.getString("searchLists");

    if (str != null) {
      List searchListData = json.decode(str).cast<String>();
      print("searchListData:$searchListData");
      var hasData = searchListData.any((element) => element == value);
      print("hasData:$hasData");
      if (hasData == false) {
        searchListData.add(value);
        await Storage.setString("searchLists", json.encode(searchListData));
      }
    }else{

      List trmpLists = [];
      trmpLists.add(value);
      await Storage.setString("searchLists", json.encode(trmpLists));

    }




    
  }
  

  static cleatSearchData() async {

     await Storage.remove("searchLists");
  }
  
}