import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player_exchange/ui/screens/cash_offer_screen.dart';
import 'package:player_exchange/ui/screens/roster_screen.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPlayer_detailScreen extends StatefulWidget {
  const SelectPlayer_detailScreen({Key? key}) : super(key: key);

  @override
  _SelectPlayer_detailScreenState createState() =>
      _SelectPlayer_detailScreenState();
}

class _SelectPlayer_detailScreenState extends State<SelectPlayer_detailScreen> {
  int activeIndex = 0;
  final YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'NG6pvXpnIso',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Padding(
        padding: ButtonTheme.of(context).padding,
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'JONES QBNY'.tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: StyleManager().largeFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                    backgroundColor: Colors.transparent,
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
                                '\$ 16.45',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$' + '75',
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
                                text: 'available_shares'.tr),
                            TextSpan(
                                style:
                                    TextStyle(color: ColorManager.greenColor),
                                text: ' 375 '),
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
                                text: '\$ 375 '),
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
                                text: '\$ 375 '),
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
                                text: '\$ 375 '),
                          ])),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150.h,
                padding: EdgeInsets.all(15),
                color: ColorManager.chartBackgroundColor,
                child: Chart(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'live'.tr,
                          style: TextStyle(
                              color: ColorManager.greenColor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                            width: 50,
                            child: OfferHeading(title: '1Q', isEnable: false))
                      ],
                    ),
                    Text(
                      '2 Q'.tr,
                      style: TextStyle(
                          color: ColorManager.buttonBorderGreyColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
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
      return getCommentView();
    }
    if (index == 3) {
      return getProfileVew();
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
                    Get.to(RosterScreen());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Select a player from your ',
                      style: TextStyle(
                          color: ColorManager.colorTextGray,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                            text: ' roster',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 17)),
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
                    fontSize: 17),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(CashOfferScreen());
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
                          fontSize: 17),
                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                            text: 'cash offer',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 17)),
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
                      SvgPicture.asset(AssetsString().RiseChartIcon)
                    ],
                  )
                : SizedBox.shrink()
          ],
        ),
      ],
    );
  }

  getCommentView() {
    return SliverList(
        delegate: SliverChildListDelegate([
      FilledButton(
        onTap: () {},
        text: "Post",
        reverseColor: true,
        isFullWidth: true,
        color: ColorManager.blueGreyButtonColor,
      ),
      singleCommentItem(),
      singleCommentItem(),
      singleCommentItem(),
      singleCommentItem(),
    ]));
  }

  singleCommentItem() {
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prince 475',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: StyleManager().mediumFontSize),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Just Now',
                style: TextStyle(color: ColorManager.buttonBorderGreyColor),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Lorem Ipsum is simply dummy text of  ',
                style: TextStyle(
                    color: Colors.grey, fontSize: StyleManager().smallFontSize),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  SvgPicture.asset(AssetsString().ThumbsUpIcon),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '2',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  SvgPicture.asset(AssetsString().ThumbsDownIcon),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '3',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  getProfileVew() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'JONES QBNY'.tr,
          style: TextStyle(
              color: Colors.black,
              fontSize: StyleManager().largeFontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Postion',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              'QB',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Age',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              '24',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Weight',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              '220',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Height',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              '6\'5\"',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'College',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              'Duke',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Draft',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              'Round 1 Pick 6',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Team',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              'Giants',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      FilledButton(
        onTap: () {},
        text: "More",
        reverseColor: true,
        isFullWidth: true,
        color: ColorManager.blueGreyButtonColor,
      ),
      SizedBox(
        height: 20,
      )
    ]));
  }
}
