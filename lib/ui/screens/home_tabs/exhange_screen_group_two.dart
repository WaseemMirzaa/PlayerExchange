import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player_exchange/models/Exchange/exchange_player_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/ui/screens/cash_offer_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:get/get.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExchangeScreenSecond extends StatefulWidget {
  ExchangeScreenSecond({Key? key, required this.myRoster, required this.exchangePlayerModel}) : super(key: key);
  RosterModel myRoster;
  ExchangePlayerModel exchangePlayerModel;

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
              widget.myRoster.cpoAthletes?.playerName ?? "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: StyleManager().largeFontSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h,),
            Text(
              '\$${widget.myRoster.cpoAthletes?.currentPricePerShare ?? "---"} Per Share'.tr,
              style: TextStyle(
                  color: Colors.black,
                  // fontSize: StyleManager().largeFontSize,
                ),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.arrow_drop_up_rounded,color: ColorManager.greenColor,),
              Text('\$'+'---',style: TextStyle(fontSize: StyleManager().smallFontSize,fontWeight: FontWeight.w600,color: ColorManager.greenColor),),
            ],),
            SizedBox(height: 10.h,), SizedBox(height: 10.h,),
            Text(
              '${widget.exchangePlayerModel.shares} Total Shares'.tr,// Shares should be same
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
              widget.exchangePlayerModel.roster?.cpoAthletes?.playerName ?? "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: StyleManager().largeFontSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h,),
            Text(
              '\$${widget.exchangePlayerModel.roster?.cpoAthletes?.currentPricePerShare ?? ""} Per Share',
              style: TextStyle(
                  color: Colors.black,
                  // fontSize: StyleManager().largeFontSize,
                ),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.arrow_drop_down_rounded,color: ColorManager.lowPriceColor,),
              Text('\$'+'---',style: TextStyle(fontSize: StyleManager().smallFontSize,fontWeight: FontWeight.w600,color: ColorManager.lowPriceColor),),
            ],),
            SizedBox(height: 10.h,), SizedBox(height: 10.h,),
            Text(
              '${widget.exchangePlayerModel.shares} Total Shares'.tr,
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
