import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/Servers/SearchServer.dart';

class SearchView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchViewState();
  }
}

class _SearchViewState extends State {
  TextEditingController _textEditingController = TextEditingController();

  List<String> hotSearchData = [];
  @override
  void initState() {

    _getSearchData();
  }

  _getSearchData() {

    SearchServer.getSearchData().then((value){
      setState(() {
        this.hotSearchData = value;
      });
    });

  }


  Widget _titleWidget(String title) {
    return Container(
        margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        // padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Divider(
              height: 1,
            ),
          ],
        )

        // height: 60,
        );
  }

  Widget _searchHistory() {

    var widgetLists = this.hotSearchData.map((e) => _smallWeight(e)).toList();

    return Wrap(children: widgetLists);
  }

  Widget _smallWeight(String text) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            borderRadius: BorderRadius.circular(5)),
        child: Text(text),
      ),
    );
  }

  Widget _productHistory() {
    var widgetLists = this.hotSearchData.map((e){
      return Column(
        children: [
          ListTile(
            title: Text(e),
          ),
          Divider(),
        ],
      );
    }).toList();
    return Column(
      children: widgetLists
    );

  }
  Widget _searchBody() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          _titleWidget("热搜"),
          _searchHistory(),
          _titleWidget("历史"),
          _productHistory(),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: InkWell(
                onTap: () {
                  print("清空历史记录");
                  SearchServer.cleatSearchData();
                  _getSearchData();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete),
                    Text("清空历史记录"),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(_pages[_currentIndex]["title"] as String),
        title: Container(
            height: 40,
            child: TextField(
              controller: this._textEditingController,
              textAlignVertical: TextAlignVertical.bottom,
              autofocus: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide()),
                hintText: "搜索商品",
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
            )),

        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            height: 40,
            //width: 60,
            child: InkWell(
              child: Text(
                "搜索",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                print("搜索:${this._textEditingController.text}");

                await SearchServer.setSearchData(this._textEditingController.text);

                _getSearchData();


              },
            ),
            alignment: Alignment.center,
          )
        ],
      ),
      body: _searchBody(),
    );
  }
}
