import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/theming/app_themes.dart';

class ThemeModel extends GetxController {
  static final light = ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      buttonColor: Colors.blue,
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)));
  static final dark = ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      buttonColor: Colors.blue,
      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)));
}
