import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilledButton extends StatelessWidget {
  final String? text;
  final double padding;
  final double paddingHorizontal;
  final Widget? childWidget;
  final VoidCallback? onTap;
  final bool reverseColor, isFullWidth;
  final double? height;
  final Color? color, textColor;

  const
  FilledButton({
    this.text,
    this.childWidget,
    this.reverseColor = false,
    this.padding = 10,
    this.paddingHorizontal = 10,
    this.isFullWidth = true,
    this.height,
    this.textColor,
    this.color,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
      color: color != null? color: reverseColor ? ColorManager.buttonGreyColor : ColorManager.greenColor,
      minWidth: isFullWidth ? double.infinity : null,
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: height == null ? padding : 0,
        horizontal: isFullWidth==false?paddingHorizontal:0
      ),
      child: text == null
          ? childWidget
          : Text(
              text!.tr,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: StyleManager().mediumFontSize,

                // StaticInfo.isMobile(context)
                //     ? MediaQuery.of(context).size.width * 0.05
                //     : MediaQuery.of(context).size.width * 0.04,
                color: textColor != null? textColor: reverseColor ? Colors.black : Colors.white,
              ),
            ),
      onPressed: onTap,
      disabledColor: Colors.grey.withOpacity(0.9),
    );
  }
}
