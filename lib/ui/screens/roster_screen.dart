import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/roster_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/ui/screens/home_tabs/exhange_screen_group_two.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';

class RosterScreen extends StatefulWidget {
   RosterScreen({Key? key, bool isFromExchangeScreen = false})
      : super(key: key);
  RosterController rosterController =Get.put(RosterController());

  @override
  _RosterScreenState createState() => _RosterScreenState();
}

class _RosterScreenState extends State<RosterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(Get.context,
          title: 'roster'.tr, leadingIcon: AssetsString().BackArrowIcon),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
            return InkWell(
                onTap: () {
                  Get.to(ExchangeScreenSecond());
                },
                child: RoasterListItem(isRoster: true, rosterModel: widget.rosterController.rosterList[index],
                cpoModel: widget.rosterController.rosterList[index].cpoAthletes ?? CpoModel(),));
          }, childCount: widget.rosterController.rosterList.length)),
          SliverList(
              delegate: SliverChildListDelegate([
            SvgPicture.asset(AssetsString().WheelImage),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'create_a_full_roster'.tr,
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OfferHeading(
                  title: '2QBs',
                  isEnable: true,
                  enableColor: ColorManager.buttonGreyColor,
                  textColor: Colors.black,
                ),
                OfferHeading(
                  title: '3RBs',
                  isEnable: true,
                  enableColor: ColorManager.buttonGreyColor,
                  textColor: Colors.black,
                ),
                OfferHeading(
                  title: '2TEs',
                  isEnable: true,
                  enableColor: ColorManager.buttonGreyColor,
                  textColor: Colors.black,
                ),
                OfferHeading(
                  title: '3WRs',
                  isEnable: true,
                  enableColor: ColorManager.buttonGreyColor,
                  textColor: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'to_receive'.tr,
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w700),
                    text: '1 Free Stock'),
                TextSpan(style: TextStyle(color: Colors.black), text: ' or '),
                TextSpan(
                    style: TextStyle(
                        color: ColorManager.greenColor,
                        fontWeight: FontWeight.w700),
                    text: '\$' + '5 to invest'),
              ])),
            ),
            SizedBox(height: 20),
          ]))
        ],
      ),
    );
  }

  @override
  void initState() {
    widget.rosterController.getRoster();
  }
}
