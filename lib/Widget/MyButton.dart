import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {

  BoxDecoration? _decoration;
  late String _text = "";
  late EdgeInsets? _margin;
  late double _height = double.infinity;
  Function? _onClick;
  MyButton({Key? key,
    BoxDecoration? decoration,
    String? text,
    EdgeInsets? margin,
    Function? onClick,
    double? height}){
    this._decoration = decoration;
    this._text = text ?? "";
    this._margin = margin;
    this._onClick = onClick;
    this._height = height ?? double.infinity;

  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Container(
        margin: _margin,
        height: _height,
        decoration: _decoration,
        child: Center(
          child: Text(_text,style: TextStyle(
            color: Colors.white
          ),),
        ),
      ),
      onTap: () {
        if (this._onClick != null) {
          this._onClick!();
        }
      }
    );

  }
}