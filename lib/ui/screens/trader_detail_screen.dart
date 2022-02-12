import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player_exchange/ui/screens/buyAndWatch/buy_screen.dart';
import 'package:player_exchange/ui/screens/cash_screen.dart';
import 'package:player_exchange/ui/screens/exchange_player.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/new_tab_widget.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:get/get.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_tabs/exchnage_screen.dart';

class TraderDetailScreen extends StatefulWidget {
  const TraderDetailScreen({Key? key}) : super(key: key);

  @override
  _TraderDetailScreenState createState() => _TraderDetailScreenState();
}

class _TraderDetailScreenState extends State<TraderDetailScreen> {
  int activeIndex = 0;
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
                    backgroundImage: NetworkImage(
                        'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
                    backgroundColor: Colors.transparent,
                  ),
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
                                    '\$16.45',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_drop_up_rounded,
                                        color: ColorManager.greenColor,
                                      ),
                                      Text(
                                        '9\% ',
                                        style: TextStyle(
                                            fontSize:
                                                StyleManager().smallFontSize,
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
                                text: ' 375'),
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
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                text: 'open'.tr + " : "),
                            TextSpan(
                                style:
                                    TextStyle(color: ColorManager.greenColor),
                                text: '\$ 375'),
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
                                text: '\$ 375'),
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
                                text: '\$ 375'),
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
                          color: ColorManager.colorTextGray,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'FanNation',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 15.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
                              fit: BoxFit.fill,
                            ),
                            // shape: BoxShape.rectangle,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('5 Hours ago',
                        style: TextStyle(
                            color: ColorManager.colorTextGray, fontSize: 11))
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
                          fit: BoxFit.fill,
                        ),
                        // shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ],
            ),
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
                  shareTitleAndValue('Share', '\$15'),
                  SizedBox(
                    height: 15.h,
                  ),
                  shareTitleAndValue('Ave. Cost', '\$15'),
                  SizedBox(
                    height: 15.h,
                  ),
                  shareTitleAndValue('Total Investment', '\$15'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  shareTitleAndValue('Current Value', '\$15'),
                  SizedBox(
                    height: 15.h,
                  ),
                  shareTitleAndValue('Total Value', '\$15'),
                  SizedBox(
                    height: 15.h,
                  ),
                  shareTitleAndValue('Total Revenue', '\$15')
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
                Get.to(() => const BuyScreen());
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
                Get.to(() => const ExchangePlayerScreen());
              },
              text: "eXchange",
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
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
      if (index == 0) {
        return Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 15),
          child: Container(
            color: ColorManager.lightGreyDivider,
            height: 1,
          ),
        );
      }
      return getSingleItem('Jones continue to strugle', 'ESPN');
    }, childCount: 5));
  }

  getSingleItem(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
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

  getCommentView() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Container(
          color: ColorManager.lightGreyDivider,
          height: 1,
        ),
      ),
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
            radius: 15.0,
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
                    fontSize: StyleManager().smallFontSize),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Just Now',
                style:
                    TextStyle(color: ColorManager.colorTextGray, fontSize: 12),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Lorem Ipsum is simply dummy text of  ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: StyleManager().smallFontSize),
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
      Container(
        color: ColorManager.lightGreyDivider,
        height: 1,
      ),
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
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            )),
            Expanded(
                child: Text(
              'QB',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            )),
            Expanded(
                child: Text(
              '24',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            )),
            Expanded(
                child: Text(
              '220',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            )),
            Expanded(
                child: Text(
              '6\'5\"',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            )),
            Expanded(
                child: Text(
              'Duke',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            )),
            Expanded(
                child: Text(
              'Round 1 Pick 6',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            )),
            Expanded(
                child: Text(
              'Giants',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
