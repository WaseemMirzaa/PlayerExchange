import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:player_exchange/Networking/api.dart';
import 'package:player_exchange/Networking/api_requests.dart';
import 'package:player_exchange/controllers/cpo_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
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
  final CPOController cpoController = Get.put(CPOController());
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   mainAxisSize: MainAxisSize.max,
                  //   children: [
                  //     Text(
                  //       'tier_1'.tr,
                  //       style: TextStyle(
                  //           color: ColorManager.greenColor,
                  //           fontSize: StyleManager().smallFontSize,
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //     Text(
                  //       'shares_available'.tr,
                  //       style: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: StyleManager().smallFontSize),
                  //     ),
                  //   ],
                  // ),
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

// Widget _buildListItem() {
//   return Column(
//     children: <Widget>[
//       Padding(
//         padding: EdgeInsets.only(top: 0, left: 0, right: 0),
//         child: Align(
//           alignment: Alignment.topLeft,
//           child: Text(
//             'Tier',
//             style: TextStyle(
//                 color: ColorManager.greenColor,
//                 fontSize: StyleManager().smallFontSize,
//                 fontWeight: FontWeight.w500),
//           ),
//         ),
//       ),
//       ListView.builder(
//         padding: EdgeInsets.only(top: 8.0),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 16.0,
//               vertical: 8.0,
//             ),
//             child: Text(
//               'Patrick Homes$index',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: StyleManager().mediumFontSize,
//                   fontWeight: FontWeight.w500),
//             ),
//           );
//         },
//         itemCount: 4,
//         shrinkWrap: true,
//         // todo comment this out and check the result
//         physics:
//             ClampingScrollPhysics(), // todo comment this out and check the result
//       ),
//     ],
//   );
// }
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
          'Shares Available',
          style: TextStyle(
              color: Colors.grey, fontSize: StyleManager().smallFontSize),
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
        Get.to(RosterDetailFromDiscovery());
      },
      // child: ShareSingleItem(
      //   index: index,
      // ),
      child: ShareSingleItem(
        cpoModel: cpoModel,
      ));

  @override
  // TODO: implement cpoModel
  late final CpoModel cpoModel;

}
