import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeCustomize {
  SizeCustomize._();

  static BorderRadiusGeometry borderRadiusCircular({
    double? all,
    double? top,
    double? bottom,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    topLeft = setSp(topLeft ?? top ?? all ?? 0);
    topRight = setSp(topRight ?? top ?? all ?? 0);
    bottomLeft = setSp(bottomLeft ?? bottom ?? all ?? 0);
    bottomRight = setSp(bottomRight ?? bottom ?? all ?? 0);
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }

  static double widthScreen() {
    return ScreenUtil().screenWidth;
  }

  static double heightScreen() {
    return ScreenUtil().screenHeight;
  }

  static double setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  static double setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  static Widget verticalSpace(double height) {
    return SizedBox(height: setHeight(height));
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(width: setWidth(width));
  }

  static double setSp(double setSp) {
    return ScreenUtil().setSp(setSp);
  }

  static double fontAppBar(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.05;
  }

  static Widget spaceArea(double height) {
    return SizedBox(height: ScreenUtil().setHeight(height));
  }
}
