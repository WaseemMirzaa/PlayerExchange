import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:player_exchange/Networking/api.dart';
import 'package:player_exchange/Networking/api_requests.dart';
import 'package:player_exchange/controllers/cpo_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/ui/screens/cpo_detail_from_discovery.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/ui/widgets/cpo_share_single_item.dart';
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
  final CPOController cpoController = Get.put(CPOController());
  int activeIndex = 0;


  @override
  void initState() {
    print("CPO Screen: initState");
    cpoController.getCpoAthletes("QB");

  }

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
                                  cpoController.getCpoAthletes("QB");
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 50,
                                  child: OfferHeading(
                                    title: "QB",
                                    isEnable: activeIndex == 0 ? true : false,
                                  ))),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeIndex = 1;
                                  cpoController.getCpoAthletes("RB");
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 50,
                                  child: OfferHeading(
                                    title: "RB",
                                    isEnable: activeIndex == 1 ? true : false,
                                  ))),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeIndex = 2;
                                  cpoController.getCpoAthletes("WR");
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 50,
                                  child: OfferHeading(
                                    title: "WR",
                                    isEnable: activeIndex == 2 ? true : false,
                                  ))),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeIndex = 3;
                                  cpoController.getCpoAthletes("TE");
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
                      ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      'Price per Share',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: StyleManager().smallFontSize,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ])),
                Obx(() {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate((_, index) {
                    final item = cpoController.cpoItemList[index];
                    return ListTile(
                      title: item.buildTitle(context),
                      visualDensity: VisualDensity.compact,
                    );
                  }, childCount: cpoController.cpoItemList.length));
                }),
                // SliverList(
                //   delegate: SliverChildListDelegate([
                //     _buildListItem(),
                //     _buildListItem(),
                //     _buildListItem(),
                //     _buildListItem(),
                //     _buildListItem(),
                //     _buildListItem(),
                //   ]),
                // )
              ],
            )));
  }


}

/// The base class for the different types of items the list can contain.
abstract class CpoListItem {
  CpoModel get cpoModel;
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class CpoHeadingItem implements CpoListItem {
  String sharesAvailable = "Shares Available";

  CpoHeadingItem({required this.cpoModel});

  @override
  Widget buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          cpoModel.tiers?.name ?? "",
          style: TextStyle(
              color: ColorManager.greenColor,
              fontSize: StyleManager().smallFontSize,
              fontWeight: FontWeight.w500),
        ),
        Text(
          'Shares\nAvailable',
          style: TextStyle(
              color: Colors.grey, fontSize: StyleManager().smallFontSize),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  // TODO: implement cpoModel
  late final CpoModel  cpoModel;


}

/// A ListItem that contains data to display a message.
class CpoShareItem implements CpoListItem {
  CpoShareItem({required CpoModel cpoModel}) {
    this.cpoModel = cpoModel;
  }

  @override
  Widget buildTitle(BuildContext context) => GestureDetector(
      onTap: () {
        Get.to(CpoDetailFromDiscovery(cpoModel: cpoModel,));
      },
      child: CpoShareSingleItem(
        cpoModel: cpoModel,
      ));

  @override
  // TODO: implement cpoModel
  late final CpoModel cpoModel;

}
