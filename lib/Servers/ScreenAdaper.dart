import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdaper {


  static init(context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height
        ),
        designSize: Size(360, 690),
        minTextAdapt: true,
      orientation: Orientation.portrait
    );

  }

  static height(num height) {
    ScreenUtil().setHeight(height);
  }

  static width(num width) {
    ScreenUtil().setWidth(width);
  }
  // 屏幕高度
  static double getScreenHeight()  {
    return ScreenUtil().screenHeight;
  }

  // 屏幕宽度
  static double getScreenWidth()  {
    return ScreenUtil().screenWidth;
  }
}