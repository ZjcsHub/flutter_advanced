import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

main() {
  runApp(ParentWidgetC());
}

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC>
    with SingleTickerProviderStateMixin {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("演示"),
            ),
            body: Container(
                color: Colors.white,
                // child: TapboxC(
                //   active: _active,
                //   onChanged: _handleTapboxChanged,
                // ),
                child: ListView(
                  children: [
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(text: "Home: "),
                        TextSpan(
                            text: "https://flutterchina.club",
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer())
                      ]),
                    ),
                    DefaultTextStyle(
                      //1.设置文本默认样式
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.start,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("hello world"),
                          Text("I am Jack"),
                          Text(
                            "I am Jack",
                            style: TextStyle(
                                inherit: false, //2.不继承默认样式
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("按钮")),
                    TextButton(onPressed: () {}, child: Text("文本按钮")),
                    OutlinedButton(onPressed: () {}, child: Text("Outlined按钮")),
                    ElevatedButton.icon(
                      icon: Icon(Icons.send),
                      label: Text("发送"),
                      onPressed: () {},
                    ),
                    OutlinedButton.icon(
                      icon: Icon(Icons.add),
                      label: Text("添加"),
                      onPressed: () {},
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.info),
                      label: Text("详情"),
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.accessible, color: Colors.green),
                        Icon(Icons.error, color: Colors.green),
                        Icon(Icons.fingerprint, color: Colors.green),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        TextField(
                          autofocus: false,
                          decoration: InputDecoration(
                              labelText: "用户名",
                              hintText: "用户名或邮箱",
                              prefixIcon: Icon(Icons.person)),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "密码",
                              hintText: "您的登录密码",
                              prefixIcon: Icon(Icons.lock)),
                          obscureText: true,
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                      margin: EdgeInsets.all(20),
                      // decoration: BoxDecoration(
                      //     color: Colors.red,
                      //     borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          // valueColor: AlwaysStoppedAnimation(Colors.blue),
                          valueColor:
                              ColorTween(begin: Colors.grey, end: Colors.blue)
                                  .animate(_animationController),
                          value: _animationController.value,
                        ),
                      ),
                    ),
                    UnconstrainedBox(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                        ),
                      ),
                    ),

                    //进度条显示50%，会显示一个半圆
                    UnconstrainedBox(
                      child: Container(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          value: .5,
                        ),
                      ),
                    ),

                    ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 100),
                        child: UnconstrainedBox(
                          child: Container(
                            color: Colors.red,
                            width: 50,
                            height: 100,
                          ),
                        ))
                  ],
                ))));
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return GestureDetector(
      onTapDown: _handleTapDown,
      // 处理按下事件
      onTapUp: _handleTapUp,
      // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal,
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
