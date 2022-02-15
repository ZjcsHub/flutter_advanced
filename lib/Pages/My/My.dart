import 'package:flutter/material.dart';
import 'package:flutter_advanced/Servers/Storage.dart';
import 'package:flutter_advanced/Widget/MyButton.dart';
import 'package:provider/provider.dart';
import '../../Provider/Counter.dart';
import '../../Provider/UserLoginNotifier.dart';
import 'package:provider/provider.dart';
class MyPage extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State<MyPage> {

  UserLoginNotifier? _userLoginProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void activate() {
    // TODO: implement activate
    super.activate();
    print("我的视图活跃");
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<Counter>(context);
    if (this._userLoginProvider == null) {
      this._userLoginProvider = Provider.of<UserLoginNotifier>(context);
    }

    print("my视图build");

    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),

      ),
      body: ListView(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://alifei02.cfp.cn/creative/vcg/veer/1600water/veer-371933061.jpg"),
              fit: BoxFit.cover)
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.black12,
                    image: DecorationImage(
                      image: AssetImage("images/profileheader.png")//Image.asset("images/profileheader.png",fit: BoxFit.cover,)
                    )
                  ),
                ),
                Expanded(
                  child: _userLoginProvider!.isLogin ? Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Keats Zhao",style: TextStyle(
                        fontSize: 22
                      ),
                        maxLines: 1,
                      ),
                      SizedBox(height: 20,),
                      Text("书山有路勤为径，学海无涯苦作舟",maxLines: 2,
                      style: TextStyle(
                        fontSize: 14
                      ),)
                    ],

                  ),
                ):Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    //width: 60,
                    child: InkWell(
                      child: Text(
                        "登录",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: ()  {

                        Navigator.pushNamed(context, "login");


                      },
                    ),

                  ),
                flex: 1,)
              ],
            ),
          ),



          ListTile(
            leading: Icon(Icons.home),
            title: Text("订单列表"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("订单列表"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("订单列表"),
          ),
          Container(
            height: 20,
            color: Colors.black12,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("订单列表"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("订单列表"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home,color: Colors.green,),
            title: Text("订单列表"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.search,color:Colors.lightBlueAccent),
            title: Text("订单列表"),
          ),
          _userLoginProvider!.isLogin ?  MyButton(height: 40,text: "退出登录",decoration: BoxDecoration(
            color: Colors.red
          ),onClick: (){
            _userLoginProvider?.logOut();
          },):Text("")



        ],
      ),
    );

  }
}
