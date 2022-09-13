import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/models/Exchange/exchange_player_model.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/ui/screens/exchange_player/cash_offer_screen.dart';
import 'package:player_exchange/ui/screens/roster_screen.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/circle_avatar_named_widget.dart';
import 'package:player_exchange/ui/widgets/comment_profile_widget.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/ui/widgets/player_profile_widget.dart';
import 'package:player_exchange/utils/alert_dialog_custom.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/curve_graph_chart.dart';
import '../../widgets/header_graph_chart.dart';

class SelectExchangePlayerDetailScreen extends StatefulWidget {
  final ExchangePlayerModel exchangePlayerModel;

  const SelectExchangePlayerDetailScreen({Key? key, required this.exchangePlayerModel}) : super(key: key);

  @override
  _SelectExchangePlayerDetailScreenState createState() =>
      _SelectExchangePlayerDetailScreenState();
}

class _SelectExchangePlayerDetailScreenState extends State<SelectExchangePlayerDetailScreen> {
  int activeIndex = 0;
  final YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'NG6pvXpnIso',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );
  AppDrawerController appDrawerController = Get.find<AppDrawerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.exchangePlayerModel.roster?.cpoAthletes?.playerName ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: StyleManager().largeFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10, 0, 10),
                    child: CircleAvatarNamedWidget(url: widget.exchangePlayerModel.roster?.cpoAthletes?.profilePicture ?? "", name: widget.exchangePlayerModel.roster?.cpoAthletes?.playerName ?? "", radius: 32,)
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$ ${widget.exchangePlayerModel.roster?.cpoAthletes?.currentPricePerShare ?? ""}',
                                style: TextStyle(
                                    fontSize: StyleManager().mediumFontSize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  //TODO
                                  Text(
                                    '\$' + '--',
                                    style: TextStyle(
                                        fontSize: StyleManager().smallFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                text: 'available_shares'.tr + " "),
                            TextSpan(
                                style:
                                    TextStyle(color: ColorManager.greenColor),
                                text: '${widget.exchangePlayerModel.roster?.cpoAthletes?.sharesAvailable ?? ""}'),
                          ]))
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                text: 'open'.tr + " : "),
                            TextSpan(
                                style:
                                    TextStyle(color: ColorManager.greenColor),
                                text: '\$ --- '),
                          ])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                text: 'high'.tr + " : "),
                            TextSpan(
                                style:
                                    TextStyle(color: ColorManager.greenColor),
                                text: '\$ --- '),
                          ])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                text: 'low'.tr + " : "),
                            TextSpan(
                                style: TextStyle(
                                    color: ColorManager.lowPriceColor),
                                text: '\$ --- '),
                          ])),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              HeaderChartWidget(playerId: widget.exchangePlayerModel.roster?.cpoAthletes?.id ?? ""),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 35.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 0;
                              });
                            },
                            child: OfferHeading(
                                title: 'chart'.tr,
                                isEnable: activeIndex == 0,
                                isTransparent: activeIndex != 0))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 1;
                              });
                            },
                            child: OfferHeading(
                                title: 'news'.tr,
                                isEnable: activeIndex == 1,
                                isTransparent: activeIndex != 1))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 2;
                              });
                            },
                            child: OfferHeading(
                                title: 'comments'.tr,
                                isEnable: activeIndex == 2,
                                isTransparent: activeIndex != 2))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 3;
                              });
                            },
                            child: OfferHeading(
                                title: 'profile'.tr,
                                isEnable: activeIndex == 3,
                                isTransparent: activeIndex != 3))),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8.0, bottom: 10, left: 10, right: 10),
                child: CustomDivider(),
              ),
            ])),
            getTabbedWigget(activeIndex)
          ],
        ),
      ),
    );
  }

  getTabbedWigget(int index) {
    if (index == 0) {
      return getChartWidget();
    }
    if (index == 1) {
      return getNewList();
    }
    if (index == 2) {
      return CommentProfileWidget(
        cpoModel: widget.exchangePlayerModel.roster?.cpoAthletes ?? new CpoModel(),
      );
    }
    if (index == 3) {
      return PlayerProfileWidget(playerId: widget.exchangePlayerModel.roster?.cpoAthletes?.playerId ?? "");
    }
  }

  getChartWidget() {
    return SliverList(
        delegate: SliverChildListDelegate([
      // Container(
      //   padding: EdgeInsets.symmetric(
      //     vertical: 15,
      //   ),
      //   child:  YoutubePlayer(
      //     controller: youtubeController,
      //     showVideoProgressIndicator: true,
      //     progressColors: const ProgressBarColors(
      //       playedColor: Colors.redAccent,
      //       handleColor: Color(0xffFF6757),
      //     ),
      //     onReady: () {
      //
      //     },
      //   ),
      // ),
      Image.asset(
        AssetsString().ChartImageOne,
        fit: BoxFit.fitWidth,
        width: MediaQuery.of(context).size.width * 0.8,
      ),

      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                child: GestureDetector(
                  onTap: () {
                    if(widget.exchangePlayerModel.userId != appDrawerController.user.value.id)
                      Get.to(RosterScreen(isFromExchangeScreen: true, exchangePlayerModel:  widget.exchangePlayerModel,));
                    else
                      showMessageDialog("You cannot send an offer to yourself.", context, () => {
                      });
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Select a player from your ',
                      style: TextStyle(
                          color: ColorManager.colorTextGray,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                            text: ' roster',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'or',
                style: TextStyle(
                    color: ColorManager.colorTextGray,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ),
            GestureDetector(
              onTap: () {
                if(widget.exchangePlayerModel.userId != appDrawerController.user.value.id){
                  Get.to(CashOfferScreen(exchangePlayerModel: widget.exchangePlayerModel,));
                }
                else
                  showMessageDialog("You cannot send an offer to yourself.", context, () => {

                  });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: RichText(
                    text: TextSpan(
                      text: 'Make a \n',
                      style: TextStyle(
                          color: ColorManager.colorTextGray,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                            text: 'cash offer',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Image.asset(AssetsString().ChartImageTwo),
      // Padding(
      //   padding:  EdgeInsets.symmetric(vertical: 30),
      //   child: Row(
      //     mainAxisAlignment:MainAxisAlignment.spaceAround,
      //     children: [
      //       Expanded(
      //         child: FilledButton(onTap: (){
      //           Get.to(()=>const BuyScreen());
      //         },
      //           text: "Buy",reverseColor: true,isFullWidth: false,color: ColorManager.blueGreyButtonColor,),
      //       ),
      //       SizedBox(width: 15.w,),
      //       Expanded(
      //         child: FilledButton(onTap: (){
      //           Get.to(()=>const WatchScreen());
      //         },text: "Watch",reverseColor: true,isFullWidth: false,color: ColorManager.blueGreyButtonColor,),
      //       ),
      //       // FilledButton(onTap: (){
      //       //   Get.to(()=>const WatchScreen());
      //       // },text: "Watch",reverseColor: true,isFullWidth: false,color: ColorManager.blueGreyButtonColor,),
      //     ],
      //   ),
      // ),
      // CustomDivider(),
    ]));
  }

  getNewList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
      return getSingleItem('Jones continue to strugle', 'Espn');
    }, childCount: 5));
  }

  getSingleItem(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: StyleManager().mediumFontSize,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 7.h,
          ),
          Text(subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: StyleManager().smallFontSize,
              ))
        ],
      ),
    );
  }

  shareTitleAndValue(String title, String value, {bool isShowGraph = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        SizedBox(
          height: 7.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: StyleManager().largeFontSize,
                    fontWeight: FontWeight.w600)),
            isShowGraph
                ? Row(
                    children: [
                      Icon(
                        Icons.arrow_drop_up_rounded,
                        color: ColorManager.greenColor,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: 60,
                          height: 70,
                          // TODO ID'S ISSUE
                          child: Center(child: CurveChart(playerId: widget.exchangePlayerModel.roster?.cpoAthletes?.id ?? "")))
                    ],
                  )
                : SizedBox.shrink()
          ],
        ),
      ],
    );
  }

}
