
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants{

  static final Constants _constants = Constants._internal();

  factory Constants() {
    return _constants;
  }

  Constants._internal();

  GlobalKey<NavigatorState>? navigatorKey=GlobalKey<NavigatorState>();
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();
}