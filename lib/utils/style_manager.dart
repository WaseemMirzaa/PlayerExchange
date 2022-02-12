import 'package:flutter_screenutil/flutter_screenutil.dart';


class StyleManager{

  static final StyleManager _styleManager = StyleManager._internal();

  factory StyleManager() {
    return _styleManager;
  }

  StyleManager._internal();

  double smallFontSize=16.sp;
  double mediumFontSize=18.sp;
  double largeFontSize=20.sp;
}