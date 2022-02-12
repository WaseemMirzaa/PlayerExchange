import 'package:flutter/material.dart';
import 'package:player_exchange/ui/screens/roster_detail_from_discovery.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/ui/widgets/share_single_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

class CurrentPublicOfferingScreen extends StatefulWidget {
  const CurrentPublicOfferingScreen({Key? key}) : super(key: key);

  @override
  _CurrentPublicOfferingScreenState createState() =>
      _CurrentPublicOfferingScreenState();
}

class _CurrentPublicOfferingScreenState
    extends State<CurrentPublicOfferingScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Text(
                  'current_public_offering'.tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: StyleManager().largeFontSize,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                )
              ])),
              SliverToBoxAdapter(
                child: Container(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                activeIndex = 0;
                              });
                            },
                            child: Container(
                                height: 30,
                                width: 50,
                                child: OfferHeading(
                                  title: "QB",
                                  isEnable: activeIndex == 0 ? true : false,
                                ))), GestureDetector(
                            onTap: () {
                              setState(() {
                                activeIndex = 1;
                              });
                            },
                            child: Container(
                                height: 30,
                                width: 50,
                                child: OfferHeading(
                                  title: "RB",
                                  isEnable: activeIndex == 1 ? true : false,
                                ))), GestureDetector(
                            onTap: () {
                              setState(() {
                                activeIndex = 2;
                              });
                            },
                            child: Container(
                                height: 30,
                                width: 50,
                                child: OfferHeading(
                                  title: "WR",
                                  isEnable: activeIndex == 2 ? true : false,
                                ))), GestureDetector(
                            onTap: () {
                              setState(() {
                                activeIndex = 3;
                              });
                            },
                            child: Container(
                                height: 30,
                                width: 50,
                                child: OfferHeading(
                                  title: "TE",
                                  isEnable: activeIndex == 3 ? true : false,
                                ))),
                      ],
                    )

                    /*     ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(onTap: (){
                        setState(() {
                          activeIndex=index;
                        });
                      }, child: Container(height: 30,width: 50, child: OfferHeading(title: "QB",isEnable: activeIndex==index?true:false,)));
                    },
                  ),*/
                    ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  height: 15,
                ),
                Text(
                  'price_per_share'.tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: StyleManager().smallFontSize,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'tier_1'.tr,
                      style: TextStyle(
                          color: ColorManager.greenColor,
                          fontSize: StyleManager().smallFontSize,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'shares_available'.tr,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: StyleManager().smallFontSize),
                    ),
                  ],
                ),
              ])),
              SliverList(
                  delegate: SliverChildBuilderDelegate((_, index) {
                return ShareSingleItem(
                  index: index,
                );
              }, childCount: 5)),
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'tier_2'.tr,
                      style: TextStyle(
                          color: ColorManager.greenColor,
                          fontSize: StyleManager().smallFontSize,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'shares_available'.tr,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: StyleManager().smallFontSize),
                    ),
                  ],
                ),
              ])),
              SliverList(
                  delegate: SliverChildBuilderDelegate((_, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(RosterDetailFromDiscovery());
                  },
                  child: ShareSingleItem(
                    index: index,
                  ),
                );
              }, childCount: 10)),
            ],
          ),
        ));
  }
}
