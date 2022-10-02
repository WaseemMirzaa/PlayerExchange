import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_elapsed/time_elapsed.dart';

class DateUtilsCustom{

  static String convertISO_8601_ToDateTime(String isoDate){
    isoDate = isoDate.replaceFirst("T", "\n");
    isoDate = isoDate.replaceFirst(".000Z", "");

    return isoDate;
    // var d = DateTime.parse(restrictFractionalSeconds(isoDate));
    // return d.toString();

  }
  static String convertDateTime_ToISO_8601(String dateTime){
    String isoDate = dateTime.replaceFirst(" ", "T");
    isoDate = isoDate + "Z";

    return isoDate;
    // var d = DateTime.parse(restrictFractionalSeconds(isoDate));
    // return d.toString();

  }

  static String convertDateTimeTo_AmPm(DateTime dateTime){
    return DateFormat('yyyy-MMMM-dd hh:mm a').format(dateTime);

  }

  static String convertDateTimeTo_AmPm_FromString(String isoString){// ISO_8601 String "2022-08-24T18:01:38.243Z"
    if(isoString.isEmpty)
      return "";

    return DateFormat('yyyy-MMMM-dd hh:mm a').format(DateTime.parse(isoString));

  }
  static String _restrictFractionalSeconds(String dateTime){
    return dateTime.replaceFirstMapped(RegExp("(\\.\\d{5})\\d+"), (m) => m[1]!);
  }

  static String getElapsedTime(String isoDate){

    if(isoDate.isEmpty){
      return "";
    }
    String timeString = "2020-04-19 03:48:57.063773"; // set a String type var with Date sample
    // DateTime timeDate = DateTime.parse("2020-04-19 03:48:57.063773"); // set a DateTime var sample

    // to calculate from String
    String timeStamp = TimeElapsed.fromDateStr(isoDate); // returns 8w (cos now days:2020-06-19)

    // to calculate from DateTime
    // String timeStamp = TimeElapsed.fromDateTime(timeDate);
    if(timeStamp == "1m")
      timeStamp = "Just Now";

    return timeStamp;
  }
}