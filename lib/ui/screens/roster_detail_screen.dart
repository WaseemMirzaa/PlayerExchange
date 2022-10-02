import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/screens/Transactions/cash_screen.dart';
import 'package:player_exchange/ui/screens/exchange_player/exchange_player_screen.dart';
import 'package:player_exchange/ui/widgets/circle_avatar_named_widget.dart';
import 'package:player_exchange/ui/widgets/comment_profile_widget.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/ui/widgets/player_profile_widget.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

import '../../main.dart';
import '../../utils/constants.dart';
import '../widgets/header_graph_chart.dart';
import '../widgets/new_tab_widget.dart';
import 'buy_and_watch/buy_screen.dart';

class RosterDetailScreen extends StatefulWidget {
  final RosterModel rosterModel;

  const RosterDetailScreen({Key? key, required this.rosterModel}) : super(key: key);

  @override
  _RosterDetailScreenState createState() => _RosterDetailScreenState();
}

class _RosterDetailScreenState extends State<RosterDetailScreen> {
  int activeIndex = 0;
  int? highest = 0;
  int? lowest = 0;
  int? open = 0;




  @override
  void initState() {
    // TODO: implement initState
    graphController
        .fetchData(widget.rosterModel.cpoAthletes?.id ?? "", GraphApiConstants.days, GraphApiConstants.daysCount);
    APIRequests.doApi_getPriceTrends(widget.rosterModel.cpoAthletes?.id ?? "", "day").then((value) =>
    {
      highest = value[0]?.highest,
      lowest = value[0]?.lowest,
      open = value[0]?.starting,
      setState(() {})
    });


  }

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
                    widget.rosterModel.cpoAthletes!.playerName.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: StyleManager().largeFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatarNamedWidget(
                    url: widget.rosterModel.cpoAthletes!.profilePicture ?? "",
                    name: widget.rosterModel.cpoAthletes!.playerName ?? "",
                    radius: 32,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '\$' +
                                        widget.rosterModel.cpoAthletes!.currentPricePerShare
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_drop_up_rounded,
                                        color: ColorManager.greenColor,
                                      ),
                                      Text(
                                        '0\% ',
                                        style: TextStyle(
                                            fontSize: StyleManager().smallFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.greenColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$' +
                                        "${widget.rosterModel.cpoAthletes!.currentPricePerShare! * widget.rosterModel.cpoAthletes!.sharePurchased!}",
                                    style: TextStyle(
                                        fontSize: StyleManager().smallFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: ColorManager.greenColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.black,
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
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'Available Shares: '),
                            TextSpan(
                                style: TextStyle(color: ColorManager.greenColor),
                                text: widget.rosterModel.cpoAthletes!.sharesAvailable.toString()),
                          ]))
                        ],
                      )),
                  Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'open'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.greenColor), text: open == 0 ? '\$ ---': '\$'+open.toString()),
                          ])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'high'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.greenColor), text: highest == 0 ? '\$ ---': '\$'+highest.toString()),
                          ])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'low'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.lowPriceColor),
                                text: lowest == 0 ? '\$ ---': '\$'+lowest.toString()),
                          ])),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              HeaderChartWidget(playerId: widget.rosterModel.cpoAthletes?.id ?? "",
                onDurationSelect: (duration){
                  APIRequests.doApi_getPriceTrends(widget.rosterModel.cpoAthletes?.id ?? "", duration).then((value) =>
                  {
                    highest = value[0]?.highest,
                    lowest = value[0]?.lowest,
                    open = value[0]?.starting,
                    setState(() {})
                  });

              },
              ),
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
                padding: EdgeInsets.only(top: 8.0, bottom: 10, left: 10, right: 10),
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
        cpoModel: widget.rosterModel.cpoAthletes ?? new CpoModel(),
      );
    }
    if (index == 3) {
      return PlayerProfileWidget(playerId: widget.rosterModel.cpoAthletes?.playerId ?? "");
    }
  }

  getChartWidget() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                color: ColorManager.lightGreyDivider,
                height: 1,
              ),
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     Expanded(
            //         child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //             Text(
            //               'FanNation',
            //               style: TextStyle(
            //                   color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12.sp),
            //             ),
            //             SizedBox(
            //               width: 5,
            //             ),
            //             Container(
            //               height: 15.0,
            //               width: 25.0,
            //               decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                   image: NetworkImage(
            //                       'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
            //                   fit: BoxFit.fill,
            //                 ),
            //                 // shape: BoxShape.rectangle,
            //               ),
            //             )
            //           ],
            //         ),
            //         SizedBox(
            //           height: 10.h,
            //         ),
            //         Text(
            //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
            //           style: TextStyle(
            //             color: Colors.black,
            //           ),
            //           maxLines: 2,
            //           overflow: TextOverflow.ellipsis,
            //         ),
            //         SizedBox(
            //           height: 10.h,
            //         ),
            //         Text('5 Hours ago',
            //             style: TextStyle(color: ColorManager.colorTextGray, fontSize: 11))
            //       ],
            //     )),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         height: 80.0,
            //         width: 80.0,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: NetworkImage(
            //                   'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
            //               fit: BoxFit.fill,
            //             ),
            //             // shape: BoxShape.rectangle,
            //             borderRadius: BorderRadius.circular(15)),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  shareTitleAndValue('Share', ((widget.rosterModel.sharesBought ?? 0).toString())),
                  SizedBox(
                    height: 15.h,
                  ),
                  shareTitleAndValue(
                      'Ave. Cost', ('\$' + (widget.rosterModel.averageCost ?? 0).toString())),
                  SizedBox(
                    height: 15.h,
                  ),
                  shareTitleAndValue('Total Investment',
                      ('\$' + (widget.rosterModel.totalInvestment ?? 0).toString())),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  shareTitleAndValue(
                      'Current Value',
                      ('\$' +
                          (widget.rosterModel.cpoAthletes?.currentPricePerShare ?? 0).toString())),
                  SizedBox(
                    height: 15.h,
                  ),
                  shareTitleAndValue(
                      'Total Value',
                      ('\$' +
                          ((widget.rosterModel.cpoAthletes?.currentPricePerShare?.toDouble() ??
                                      0.0) *
                                  (widget.rosterModel.sharesBought ?? 0))
                              .toString())),
                  SizedBox(
                    height: 15.h,
                  ),
                  shareTitleAndValue(
                      'Total Revenue',
                      ('\$' +
                          ((widget.rosterModel.cpoAthletes?.currentPricePerShare?.toDouble() ??
                                      0.0) *
                                  (widget.rosterModel.sharesBought ?? 0))
                              .toString())),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: FilledButton(
              onTap: () {
                Get.to(() => BuyScreen(widget.rosterModel.cpoAthletes ?? CpoModel()));
              },
              text: "Buy",
              reverseColor: true,
              isFullWidth: false,
              color: ColorManager.buttonGreyColor,
            )),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: FilledButton(
              onTap: () {
                Get.to(() => ExchangePlayerScreen(
                      rosterModel: widget.rosterModel,
                    ));
              },
              text: "Xchange",
              reverseColor: true,
              isFullWidth: false,
              color: ColorManager.buttonGreyColor,
            )),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: FilledButton(
              onTap: () {
                Get.to(() => const CashScreen());
              },
              text: "CashOut",
              reverseColor: true,
              isFullWidth: false,
              color: ColorManager.buttonGreyColor,
            )),
          ],
        ),
      ),
    ]));
  }

  getNewList() {
    return NewsTabWidget();

  }

  shareTitleAndValue(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        SizedBox(
          height: 7.h,
        ),
        Text(value,
            style: TextStyle(
                color: Colors.black,
                fontSize: StyleManager().largeFontSize,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}

