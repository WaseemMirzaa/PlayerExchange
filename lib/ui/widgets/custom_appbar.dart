import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:get/get.dart';

PreferredSize customAppBar(
  BuildContext? context, {
  String? title,
  String? leadingIcon,
  VoidCallback? leadingOnTap,
  List<Widget>? trailing,
  bool isTransparent = true,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: Center(
      child: AppBar(
        leadingWidth: leadingIcon == null ? 0 : 100.w,
        elevation: isTransparent ? 0 : 0,
        backgroundColor: isTransparent
            ? Colors.transparent
            : ColorManager.backgroundGreyColor,
        centerTitle: true,
        leading: leadingIcon == null
            ? Container()
            : MaterialButton(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      leadingIcon,
                      height: ScreenUtil().setHeight(18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AutoSizeText('back'.tr,
                        style: TextStyle(color: Colors.black)),
                    // Text('back'.tr,style: TextStyle(color: Colors.black),)
                  ],
                ),
                onPressed: leadingOnTap == null
                    ? () => Navigator.pop(context!)
                    : leadingOnTap,
              ),
        title: title == null
            ? SvgPicture.asset(
                AssetsString().AppLogo,
                height: ScreenUtil().setHeight(35),
              )
            : AutoSizeText(
                title,
                style: TextStyle(
                  color: Colors.black,
                  // fontFamily:  'DroidKufi',
                  fontSize: StyleManager().largeFontSize,
                  fontWeight: FontWeight.w800,
                ),
                minFontSize: StyleManager().smallFontSize,
                maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
        actions: trailing,
      ),
    ),
  );
}
