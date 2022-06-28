import 'package:flutter/material.dart';

class DateUtilsCustom{

  static String convertISO_8601_ToDateTime(String isoDate){
    isoDate = isoDate.replaceFirst("T", "\n");
    isoDate = isoDate.replaceFirst(".000Z", "");

    return isoDate;
    // var d = DateTime.parse(restrictFractionalSeconds(isoDate));
    // return d.toString();

  }
  static String _restrictFractionalSeconds(String dateTime){
    return dateTime.replaceFirstMapped(RegExp("(\\.\\d{5})\\d+"), (m) => m[1]!);
  }
}