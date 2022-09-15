import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/graph_controller.dart';
import 'package:player_exchange/controllers/home_screen_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/ui/screens/app_drawer.dart';
import 'package:player_exchange/ui/screens/buy_and_watch/watch_screen.dart';
import 'package:player_exchange/ui/screens/Transactions/cash_screen.dart';
import 'package:player_exchange/ui/screens/current_public_offering_screen.dart';
import 'package:player_exchange/ui/screens/roster_detail_screen.dart';
import 'package:player_exchange/ui/screens/roster_screen.dart';
import 'package:player_exchange/ui/widgets/ascending_list_item.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/outline_button_with_icon_text.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:player_exchange/utils/style_manager.dart';

import '../../../main.dart';
import '../../widgets/header_graph_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());


  String? userId;

  @override
  void initState() {

    debugPrint(appDrawerController.user.value.id ??"");debugPrint("id found");
    homeScreenController.checkAndUpdateStripeCustomerId(context);
    homeScreenController.rosterController.getRoster();
    appDrawerController.getUserData();



    graphController
        .fetchData(appDrawerController.user.value.id ?? "", GraphApiConstants.days, GraphApiConstants.daysCount);

  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                            "You're Up",
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
                        // '\$' + '${appDrawerController.user.value.totalValue}',
                        '\$' + '${homeScreenController.rosterController.user.value?.totalValue ?? "0"}',
                        style: TextStyle(
                            fontSize: StyleManager().mediumFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_drop_up_rounded,
                        color: ColorManager.greenColor,
                      ),
                      Text(
                        '\$' + '-- Today',
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
                        appDrawerController.user.value.name ?? "",
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
                    HeaderChartWidget(playerId: appDrawerController.user.value.id ?? "", isUser: true),
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
                          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                          decoration: BoxDecoration(
                              color: ColorManager.greenColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Text(
                                '\$${appDrawerController.user.value.walletAmount}',
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
                // Padding(
                //   padding: const EdgeInsets.only(left: 16, right: 16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           Get.to(RosterScreen());
                //         },
                //         child: Row(
                //           mainAxisSize: MainAxisSize.max,
                //           children: [
                //             Text(
                //               'roster'.tr,
                //               style: TextStyle(
                //                   fontSize: StyleManager().mediumFontSize,
                //                   fontWeight: FontWeight.w600,
                //                   color: Colors.black),
                //             ),
                //             SizedBox(
                //               width: 3,
                //             ),
                //             Icon(
                //               Icons.arrow_forward_ios_rounded,
                //               color: Colors.black,
                //               size: 12,
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 15,
                ),
                CustomDivider(),
                Container(
                  width: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(RosterDetailScreen(
                              rosterModel:
                                  homeScreenController.rosterController.rosterList[index]));
                        },
                        child: RoasterListItem(
                          isRoster: true,
                          rosterModel: homeScreenController.rosterController.rosterList[index],
                          cpoModel:
                              homeScreenController.rosterController.rosterList[index].cpoAthletes ??
                                  CpoModel(),
                        ),
                      );
                    },
                    itemCount: homeScreenController.rosterController.rosterList.length > 4
                        ? 3 : homeScreenController.rosterController.rosterList.length,
                    separatorBuilder: ( _ , index ) => CustomDivider(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  // width: MediaQuery.of(context).size.width,
                  color: ColorManager.chartBackgroundColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Popular'.tr,
                          style: TextStyle(
                              fontSize: StyleManager().largeFontSize,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      // AscendingListItem()
                      SizedBox(
                        height: 210,
                        child: ListView.builder(
                          itemBuilder: (_, index) {
                            return AscendingListItem(
                                rosterModel: homeScreenController
                                    .rosterController.ascendingRosterList[index]);
                          },
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              homeScreenController.rosterController.ascendingRosterList.length,
                        ),
                      )
                    ],
                  ),
                )
              ])),
            ]),
          ));
    });
  }
}


