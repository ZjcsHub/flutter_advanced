import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchViewState();
  }
}

class _SearchViewState extends State {
  TextEditingController _textEditingController = TextEditingController();

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

  Widget _searchHistory(List<Widget> widgetLists) {
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

  Widget _searchBody() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          _titleWidget("热搜"),
          _searchHistory([
            _smallWeight("女装"),
            _smallWeight("男装"),
            _smallWeight("玩具"),
            _smallWeight("手机数码"),
            _smallWeight("健康保健饮品"),
          ]),
          _titleWidget("历史"),
          Column(
            children: [
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: InkWell(
                onTap: () {
                  print("清空历史记录");
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
              onTap: () {
                print("搜索:${this._textEditingController.text}");
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
