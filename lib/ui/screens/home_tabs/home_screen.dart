import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:player_exchange/Networking/API.dart';
import 'package:player_exchange/Networking/APIRequests.dart';
import 'package:player_exchange/models/Current%20Public%20Offerings/controller/CPO_Controller.dart';
import 'package:player_exchange/models/Home%20Screen/HomeScreen_Controller.dart';
import 'package:player_exchange/models/Rosters/Controller/Roster_Controller.dart';
import 'package:player_exchange/ui/screens/buyAndWatch/watch_screen.dart';
import 'package:player_exchange/ui/screens/buyAndWatch/watch_screen.dart';
import 'package:player_exchange/ui/screens/cash_screen.dart';
import 'package:player_exchange/ui/screens/current_public_offering_screen.dart';
import 'package:player_exchange/ui/screens/detail_page/detail_page.dart';
import 'package:player_exchange/ui/screens/drawer.dart';
import 'package:player_exchange/ui/screens/roster_screen.dart';
import 'package:player_exchange/ui/screens/trader_detail_screen.dart';
import 'package:player_exchange/ui/widgets/ascending_list_item.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/outline_button_with_icon_text.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenController homeScreenController = Get.put(
      HomeScreenController());


  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: Text('Home'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: CustomScrollView(slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'you_are_up'.tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: StyleManager().smallFontSize),
                            )),
                        OutlineButtonWithIconText(
                          text: 'rewards'.tr,
                          icon: AssetsString().RewadIcon,
                          onTap: () {
                            Get.to(() => WatchScreen());
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        Text(
                          '\$' + '450',
                          style: TextStyle(
                              fontSize: StyleManager().mediumFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: ColorManager.greenColor,
                        ),
                        Text(
                          '\$' + '25 Today',
                          style: TextStyle(
                              fontSize: StyleManager().smallFontSize,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.greenColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 00,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'JONES QB',
                          style: TextStyle(
                              fontSize: StyleManager().mediumFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        FilledButton(
                          onTap: () {
                            Get.to(CurrentPublicOfferingScreen());
                          },
                          text: 'cpo'.tr,
                          isFullWidth: false,
                          padding: 5,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 23,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      color: ColorManager.chartBackgroundColor,
                      child: Chart(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 16, right: 16),
                    child: Row(
                      children: [
                        Text(
                          'live'.tr,
                          style: TextStyle(
                              color: ColorManager.greenColor,
                              fontWeight: FontWeight.w500,
                              fontSize: StyleManager().smallFontSize),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '1Q'.tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: StyleManager().smallFontSize),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: CustomDivider(
                      height: 0.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'cash'.tr + " :",
                          style: TextStyle(
                              fontSize: StyleManager().mediumFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(CashScreen());
                          },
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                            decoration: BoxDecoration(
                                color: ColorManager.greenColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Text(
                                  '\$' + '75',
                                  style: TextStyle(
                                      fontSize: StyleManager().smallFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 23,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: FilledButton(
                      onTap: () {
                        Get.to(CurrentPublicOfferingScreen());
                      },
                      text: 'invest'.tr,
                      reverseColor: true,
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: FilledButton(
                      onTap: () {
                        Get.to(RosterScreen());
                      },
                      text: 'roster'.tr,
                      reverseColor: true,
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(RosterScreen());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'roster'.tr,
                                style: TextStyle(
                                    fontSize: StyleManager().mediumFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black,
                                size: 12,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    return Container(
                      height: 220,
                      width: double.infinity,
                      child: ListView.separated(
                        itemBuilder: (_, index) {
                          return InkWell(
                              onTap: () {
                                Get.to(TraderDetailScreen());
                              },
                              child: RoasterListItem(index:index));
                        },
                        itemCount: widget.homeScreenController.rosterController.rosterList.obs.value.length,
                        separatorBuilder: (_, index) => CustomDivider(),
                      ),
                    );

                  }),

                  Container(
                    width: double.infinity,
                    height: 230,
                    // width: MediaQuery.of(context).size.width,
                    color: ColorManager.chartBackgroundColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'ascending'.tr,
                            style: TextStyle(
                                fontSize: StyleManager().largeFontSize,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        // AscendingListItem()
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            itemBuilder: (_, index) {
                              return AscendingListItem();
                            },
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 5,
                          ),
                        )
                      ],
                    ),
                  )
                ])),
          ]),
        ));
  }
}
