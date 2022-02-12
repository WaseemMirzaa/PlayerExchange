import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';

class OutlineButtonWithIconText extends StatelessWidget {
  String? icon, text;
   Color? color;
  VoidCallback? onTap;

  OutlineButtonWithIconText({this.icon, this.text = "",this.color=ColorManager.buttonBorderGreyColor,this.onTap ,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap??(){},
        shape: RoundedRectangleBorder(side: BorderSide(color: this.color!),borderRadius: BorderRadius.circular(10.h)),
        //padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
        child: Row(
          children: [
            icon == null
                ? SizedBox.shrink()
                : SvgPicture.asset(AssetsString().RewadIcon),
            Text(
              text!,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            )
          ],
        ));
  }
}
