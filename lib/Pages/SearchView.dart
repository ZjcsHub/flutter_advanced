
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _SearchViewState();
  }
}

class _SearchViewState extends State {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        // title: Text(_pages[_currentIndex]["title"] as String),
        title: Container(
          child: InkWell(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(233, 233, 233, 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10,right:5),child: Icon(Icons.search,size: 25,),),
                  Text("笔记本",style: TextStyle(
                    fontSize: 16,
                  ),)
                ],
              ),
            ),
            onTap: (){



            },
          ),
        ),

      )
    );

  }
}