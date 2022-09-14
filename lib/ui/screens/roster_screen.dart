import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/roster_controller.dart';
import 'package:player_exchange/models/exchange/exchange_player_model.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/ui/screens/home_tabs/exchange_player_offer_screen.dart';
import 'package:player_exchange/ui/screens/roster_detail_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';

class RosterScreen extends StatefulWidget {

  RosterScreen({Key? key, this.isFromExchangeScreen = false, this.exchangePlayerModel = null})
      : super(key: key);
  RosterController rosterController =Get.put(RosterController());
  bool isFromExchangeScreen;
  ExchangePlayerModel? exchangePlayerModel = ExchangePlayerModel(); //This is the model againt which i will send offer to swap with my roster

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
                  widget.isFromExchangeScreen ? Get.to(ExchangePlayerOfferScreen(myRoster:widget.rosterController.rosterList[index] ,
                    exchangePlayerModel: widget.exchangePlayerModel ?? ExchangePlayerModel(),)):
                  Get.to(RosterDetailScreen(rosterModel: widget.rosterController.rosterList[index]));
                },
                child: RoasterListItem(isRoster: true, rosterModel: widget.rosterController.rosterList[index],
                cpoModel: widget.rosterController.rosterList[index].cpoAthletes ?? CpoModel(),));
          }, childCount: widget.rosterController.rosterList.length)),
          SliverList(
              delegate: SliverChildListDelegate([
            // SvgPicture.asset(AssetsString().WheelImage),
                SizedBox(height: 300),

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
                  title: '${widget.rosterController.countQBs} QBs',
                  isEnable: true,
                  enableColor: ColorManager.buttonGreyColor,
                  textColor: Colors.black,
                ),
                OfferHeading(
                  title: '${widget.rosterController.countRBs} RBs',
                  isEnable: true,
                  enableColor: ColorManager.buttonGreyColor,
                  textColor: Colors.black,
                ),
                OfferHeading(
                  title: '${widget.rosterController.countTEs} TEs',
                  isEnable: true,
                  enableColor: ColorManager.buttonGreyColor,
                  textColor: Colors.black,
                ),
                OfferHeading(
                  title: '${widget.rosterController.countWRs} WRs',
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
