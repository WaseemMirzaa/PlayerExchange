import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _colorManager = ColorManager._internal();

  factory ColorManager() {
    return _colorManager;
  }

  ColorManager._internal();

  static const Color buttonBorderGreyColor = Color(0xffC4C8CC);
  static const Color colorTextGray = Color(0xff909499);
  static const Color colorTextDarkGray = Color(0xff5c5e5f);
  static const Color buttonGreyColor = Color(0xffE5E5E5);
  static const Color greenColor = Color(0xff06BF23);
  static const Color chartBackgroundColor = Color(0xffF2F3F5);
  static const Color lowPriceColor = Color(0xffFF6978);
  static const Color blueGreyButtonColor = Color(0xffE4E9F2);
  static const Color backgroundGreyColor = Color(0xffF9F9F9);
  static const Color lightGreyDivider = Color(0xffEBEDF0);
  static const Color placeholderGreyColor = Color(0xffd7d6d6);
  static const Color placeholderBlueGreyButtonColor = Color(0xffE4E9F2);

  static const Color transactionColor_Withdraw = Color(0x22de1818);
  static const Color transactionColor_Deposit = Color(0x280ab657);
  static const Color transactionColor_Purchase = Color(0x340766ba);


}
