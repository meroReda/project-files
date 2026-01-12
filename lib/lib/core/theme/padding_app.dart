import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingApp {
  static EdgeInsets hor5 = EdgeInsets.symmetric(horizontal: 5.w);
  static EdgeInsets hor8 = EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets hor10 = EdgeInsets.symmetric(horizontal: 10.w);
  static EdgeInsets hor15 = EdgeInsets.symmetric(horizontal: 15.w);
  static EdgeInsets hor20 = EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets hor25 = EdgeInsets.symmetric(horizontal: 25.w);
  static EdgeInsets hor30 = EdgeInsets.symmetric(horizontal: 30.w);

  static EdgeInsets ver5 = EdgeInsets.symmetric(vertical: 5.h);
  static EdgeInsets ver10 = EdgeInsets.symmetric(vertical: 10.h);
  static EdgeInsets ver15 = EdgeInsets.symmetric(vertical: 15.h);
  static EdgeInsets ver30 = EdgeInsets.symmetric(vertical: 30.h);

  static EdgeInsets left40Right20 = EdgeInsets.only(left: 40.sp , right: 20.sp);
  static EdgeInsets getHorVer(double horizontal, double vertical) {
    return EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h);
  }

  static EdgeInsets getOnlyPadding(double? top, double? left, double? right, double? bottom) {
    top ??= 0;
    left ??= 0;
    right ??= 0;
    bottom ??= 0;
    return EdgeInsets.only(
        top: top.h, bottom: bottom.h, left: left.w, right: right.w);
  }
}
