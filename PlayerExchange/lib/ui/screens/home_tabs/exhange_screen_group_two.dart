import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player_exchange/ui/screens/cash_offer_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:get/get.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExchangeScreenSecond extends StatefulWidget {
  const ExchangeScreenSecond({Key? key}) : super(key: key);

  @override
  _ExchangeScreenSecondState createState() => _ExchangeScreenSecondState();
}

class _ExchangeScreenSecondState extends State<ExchangeScreenSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon,title: 'eXchange'),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        SizedBox(height: 30.h,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          Expanded(child: Column(children: [
            Text(
              'JONES QBNY'.tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: StyleManager().largeFontSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h,),
            Text(
              '\$16.45 Per Share'.tr,
              style: TextStyle(
                  color: Colors.black,
                  // fontSize: StyleManager().largeFontSize,
                ),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.arrow_drop_up_rounded,color: ColorManager.greenColor,),
              Text('\$'+'1.45',style: TextStyle(fontSize: StyleManager().smallFontSize,fontWeight: FontWeight.w600,color: ColorManager.greenColor),),
            ],),
            SizedBox(height: 10.h,), SizedBox(height: 10.h,),
            Text(
              '2 Total Shares'.tr,
              style: TextStyle(
                color: Colors.grey,
                // fontSize: StyleManager().largeFontSize,
              ),
            ),
            SizedBox(height: 10.h,),
            SvgPicture.asset(AssetsString().share_rise_large_Image)
          ],)) ,
          Expanded(child: Column(children: [
            Text(
              'JONES QBNY'.tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: StyleManager().largeFontSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h,),
            Text(
              '\$16.45 Per Share'.tr,
              style: TextStyle(
                  color: Colors.black,
                  // fontSize: StyleManager().largeFontSize,
                ),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.arrow_drop_down_rounded,color: ColorManager.lowPriceColor,),
              Text('\$'+'1.45',style: TextStyle(fontSize: StyleManager().smallFontSize,fontWeight: FontWeight.w600,color: ColorManager.lowPriceColor),),
            ],),
            SizedBox(height: 10.h,), SizedBox(height: 10.h,),
            Text(
              '2 Total Shares'.tr,
              style: TextStyle(
                color: Colors.grey,
                // fontSize: StyleManager().largeFontSize,
              ),
            ),
            SizedBox(height: 10.h,),
            SvgPicture.asset(AssetsString().share_decrease_large_Image)
          ],))
        ],),
        Expanded(child: Container()),
        FilledButton(onTap: (){
          Get.to(CashOfferScreen());
        },text: 'send',isFullWidth:false),
        SizedBox(height: 20.h,),
        Text(
          'Request to @Tom143'.tr,
          style: TextStyle(
            color: Colors.black,
            // fontSize: StyleManager().largeFontSize,
          ),
        ),
        SizedBox(height: 40.h,),
      ],),
    ),
    );
  }
}
