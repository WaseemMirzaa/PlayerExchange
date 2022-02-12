import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferHeading extends StatelessWidget {
  String? title;
  bool? isEnable;
  bool? isTransparent;
  Color? enableColor;
  Color? textColor;

  OfferHeading(
      {Key? key,
      this.title = "",
      this.isEnable = false,
      this.isTransparent = false,
      this.enableColor = ColorManager.greenColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          // color:isTransparent!?Colors.transparent:isEnable!?this.enableColor!=null?this.enableColor:ColorManager.greenColor:ColorManager.buttonGreyColor,
          color: getColor(),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Center(
            child: Text(
          title!.tr,
          style: TextStyle(
              fontSize: 14,
              color: isEnable!
                  ? textColor == null
                      ? Colors.white
                      : textColor!
                  : Colors.black),
        )),
      ),
    );
  }

  Color getColor() {
    if (this.isTransparent == true) {
      return Colors.transparent;
    } else if (this.isEnable == true) {
      if (this.enableColor != null) {
        return this.enableColor!;
      } else {
        return ColorManager.greenColor;
      }
    } else {
      return Colors.transparent;
    }
  }
}
