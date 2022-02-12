import 'package:flutter/material.dart';
import 'package:player_exchange/utils/color_manager.dart';

class DefaultStyleConfigs{
static final DefaultStyleConfigs _singleton = DefaultStyleConfigs._internal();

factory DefaultStyleConfigs() {
  return _singleton;
}

DefaultStyleConfigs._internal();


ThemeData textFieldTheme() => ThemeData(
  primaryColor: Colors.green,
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.green),
  hintColor: ColorManager.greenColor,
);

}