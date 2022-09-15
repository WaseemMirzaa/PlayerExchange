import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:player_exchange/models/exchange/exchange_player_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/ui/screens/exchange_player/cash_offer_screen.dart';
import 'package:player_exchange/ui/widgets/curve_graph_chart_exchange_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:get/get.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Networking/api_requests.dart';
import '../../../chat/chat_page.dart';
import '../../../controllers/app_drawer_controller.dart';
import '../../../models/auth/user_model.dart';
import '../../../models/exchange/offer.dart';
import '../../../utils/DateUtilsCustom.dart';
import '../../../utils/constants.dart';
import '../../../utils/number_utils.dart';
import '../../../utils/session_manager.dart';
import '../../widgets/curve_graph_chart.dart';
import '../../widgets/loading_indicator_dialog.dart';

class ExchangePlayerOfferScreen extends StatefulWidget {
  ExchangePlayerOfferScreen({Key? key, required this.myRoster, required this.exchangePlayerModel}) : super(key: key);
  RosterModel myRoster;
  ExchangePlayerModel exchangePlayerModel;

  @override
  _ExchangePlayerOfferScreenState createState() => _ExchangePlayerOfferScreenState();
}

class _ExchangePlayerOfferScreenState extends State<ExchangePlayerOfferScreen> {
  User? exchangeUser;
  num sharesToOffer = 0;
  AppDrawerController appDrawerController = Get.find();
  String? userId= "";
  String? userName= "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future<void> init() async {
    Future<User?> user = SessionManager.getUserData();
    await user.then((value) => {userId = value?.id?? "" , userName = value?.name ?? "" });

    exchangeUser = await APIRequests.doApi_getUserProfile(widget.exchangePlayerModel.userId ?? "");
    debugPrint(exchangeUser?.name ?? "" + "ASDA");

    setState(() {

    });
  }

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Icon(Icons.arrow_drop_up_rounded,color: ColorManager.greenColor,),
            //   Text('\$'+'---',style: TextStyle(fontSize: StyleManager().smallFontSize,fontWeight: FontWeight.w600,color: ColorManager.greenColor),),
            // ],),
            SizedBox(height: 10.h,), SizedBox(height: 10.h,),
            Text(
              '${widget.myRoster.sharesBought} Total Shares'.tr,// Shares should be same
              style: TextStyle(
                color: Colors.grey,
                // fontSize: StyleManager().largeFontSize,
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 100,
                child: Center(child: CurveChartExchangeScreen(playerId: widget.myRoster.cpoAthletes?.id ?? ""
                  ,priceShare: widget.myRoster.cpoAthletes?.currentPricePerShare.toString(),)))
            // SvgPicture.asset(AssetsString().share_rise_large_Image)
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Icon(Icons.arrow_drop_down_rounded,color: ColorManager.lowPriceColor,),
            //   Text('\$'+'---',style: TextStyle(fontSize: StyleManager().smallFontSize,fontWeight: FontWeight.w600,color: ColorManager.lowPriceColor),),
            // ],),
            SizedBox(height: 10.h,), SizedBox(height: 10.h,),
            Text(
              '${widget.exchangePlayerModel.shares} Total Shares'.tr,
              style: TextStyle(
                color: Colors.grey,
                // fontSize: StyleManager().largeFontSize,
              ),
            ),
            SizedBox(height: 10.h,),
            // SvgPicture.asset(AssetsString().share_decrease_large_Image)
            Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 100,
                child: Center(child: CurveChartExchangeScreen(playerId: widget.exchangePlayerModel.roster?.cpoAthletes?.id ?? ""
                  ,priceShare: widget.exchangePlayerModel.roster?.cpoAthletes?.currentPricePerShare.toString(),)))
          ],))
        ],),
        SizedBox(height: 20,),
        SizedBox(
          width: 200,
          child: TextFormField(
            textAlign: TextAlign.center,
            autovalidateMode: AutovalidateMode.always,
            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
            maxLength: 8,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],

            decoration: InputDecoration(
              // icon: Icon(Icons.),
              // hintText: 'Shares',
              labelText: "Enter Shares",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.greenColor, width: 3.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 3.0),
              ),
            ),

            onSaved: (String? value) {},
            // validator: (String? value){
            //   return value.contains('@') ? 'Do not use the @ char.' : null;
            // },
            onChanged: (String? shares) {
              if (NumberUtils.isNumeric(shares)) {
                sharesToOffer = double.parse(shares ?? "0");
              } else {
                sharesToOffer = 0;
              }
            },
            style: TextStyle(color: Colors.black54, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),


        Expanded(child: Container()),
        FilledButton(onTap: () async {
          if(sharesToOffer <= (widget.myRoster.sharesBought ?? 0)){

              LoadingIndicatorDialog().show(context, text: "Sending Offer...", dismissable: true);
              Offer offer = Offer(
                  senderId: appDrawerController.user.value.id,
                  receiverId: widget.exchangePlayerModel.userId,
                  exchangePlayerModelId: widget.exchangePlayerModel.id,
                  totalShares: sharesToOffer,
                  offerAmount: 0,
                  // validFor: DateUtilsCustom.convertDateTime_ToISO_8601(DateTime.now()),
                  // isNegotiable: dropdownValue == "Yes",
                  status: OfferStatusConstants.PENDING,
                  offerType: OfferTypeConstants.EXCHANGE,
                buyerRosterId: widget.myRoster.id
              );
              var response = await APIRequests.doApi_postOffer(offer);
              LoadingIndicatorDialog().dismiss();

              if(response != null){
                // Get.back();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(
                          peerId: exchangeUser?.id ?? "",
                          currentUserId: userId ?? "",
                          currentUserName: userName ?? "",
                          peerAvatar: "",
                          peerNickname: exchangeUser?.name ?? "",
                          userAvatar: "",
                          offerText: "Hi, i offer you to exchange my ${offer.totalShares?.toInt() ?? 0} shares of ${widget.myRoster.cpoAthletes?.playerName ?? ""}" +
                              " with your ${widget.exchangePlayerModel.shares} shares of ${widget.exchangePlayerModel.roster?.cpoAthletes?.playerName ?? ""}",
                          offer: response,
                        )));
              }


          }
          else{
            Fluttertoast.showToast(msg: "Not enough shares to offer.");
          }
        },text: 'Send Offer',isFullWidth:false),
        SizedBox(height: 20.h,),
        Text(
          'Request to @' + (exchangeUser?.name ?? ""),
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
