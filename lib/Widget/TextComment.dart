import 'package:flutter/material.dart';

class TextComment extends StatelessWidget {

  bool password = false;

  TextEditingController? controller;

  String? hintText;

  double height = 40;

  int maxLine = 1;

  Function(String? text)? changeTextMethod;

  TextComment({this.height = 40,this.controller = null,this.hintText = null,this.password = false,this.changeTextMethod = null,this.maxLine = 1});

  TextComment.setHeight(double height,TextEditingController? controller,String? hintText,bool password,Function(String? text)? changeTextMethod) {
    this.height = height;
    this.controller = controller;
    this.hintText = hintText;
    this.password = password;
    this.changeTextMethod = changeTextMethod;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
    height: this.height,
    child: TextField(
      maxLines: this.maxLine,
      obscureText: this.password,
      controller: controller,
      textAlignVertical: TextAlignVertical.bottom,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(this.height/2),
            borderSide: BorderSide.none),
        hintText: this.hintText,

      ),
      onChanged: (text) {
        if (this.changeTextMethod != null) {
            this.changeTextMethod!(text);
        }

      },
    ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black
            )
          )
        ),
    );
  }
}