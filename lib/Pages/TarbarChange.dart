
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Servers/ScreenAdaper.dart';
class TarbarChange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TarbarChangeState();
  }

}

class _TarbarChangeState extends State {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("tab 切换"),
        // actions: [
        //   Text("")
        // ],
        leading: BackButton(),
      ),

      endDrawer: Drawer(
        child: Container(
          child: Text("实现帅选功能"),
        ),
      ),

      body: Stack(

        children: [
          Positioned(
            child: Container(
            child: Row(
              children: [
                Expanded(child: InkWell(
                  child: Text("销量",textAlign: TextAlign.center,),
                )),
                Expanded(child: InkWell(
                  child: Text("价格",textAlign: TextAlign.center,),
                )),
                Expanded(child: InkWell(
                  child: Text("好评",textAlign: TextAlign.center,),
                )),
                Expanded(child: InkWell(
                  child: Text("帅选",textAlign: TextAlign.center,),
                  onTap: (){
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                )),
              ],
            ),
            width: ScreenAdaper.getScreenWidth(),
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.blue
                )
              )
            ),
          ),
          top: 0,
          height: 50,
          width: ScreenAdaper.getScreenWidth(),)
        ],



      ),
    );

  }
}