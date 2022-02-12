import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Light Theme
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Colors.grey[100],
      brightness: Brightness.light,
    ),
    colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.green),
    scaffoldBackgroundColor: Colors.grey[200],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.green),
    appBarTheme: AppBarTheme(
      color: Colors.grey[100],
      brightness: Brightness.light,
    ),
    primaryTextTheme: TextTheme(),
    scaffoldBackgroundColor: Colors.grey[200],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
