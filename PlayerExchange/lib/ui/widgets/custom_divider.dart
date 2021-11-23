import 'package:flutter/material.dart';
import 'package:player_exchange/utils/color_manager.dart';

class CustomDivider extends StatelessWidget {
  Color? color;
  double? height;
  double? width;
  CustomDivider({Key? key, this.color, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == null ? 0.1 : height,
      color: color == null ? ColorManager.lightGreyDivider : color,
      width: width == null ? double.infinity : width,
    );
  }
}
