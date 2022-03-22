import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/Home%20Screen/HomeScreen_Controller.dart';
import 'package:player_exchange/models/Rosters/Controller/Roster_Controller.dart';
import 'package:player_exchange/models/Rosters/Responses/Roster_Model.dart';
import 'package:player_exchange/ui/screens/detail_page/detail_page.dart';
import 'package:player_exchange/ui/screens/roster_detail_screen.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

class RoasterListItem extends StatefulWidget {
  int index = 0;
  bool isShowSharesLabel;

  RosterController rosterController = Get.put(RosterController());

  RoasterListItem({Key? key, this.isShowSharesLabel = true,this.index=0}) : super(key: key);

  @override
  _RoasterListItemState createState() => _RoasterListItemState();
}

class _RoasterListItemState extends State<RoasterListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: ColorManager.lightGreyDivider, width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10, 0, 10),
            child: CircleAvatar(
              radius: 20.0,
              foregroundImage: NetworkImage(
                  'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
          Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.rosterController.rosterList[widget.index].obs.value.cpoAthletes!.playerName.toString(),

                    style: TextStyle(
                        color: Colors.black,
                        fontSize: StyleManager().mediumFontSize,
                        fontWeight: FontWeight.w600),
                  ),
                  widget.isShowSharesLabel
                      ? Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            widget.rosterController.rosterList[widget.index].obs.value.sharesBought.toString() +' Shares',
                            style: TextStyle(color: ColorManager.colorTextGray),
                          ),
                        )
                      : SizedBox.shrink()

                ],
              )),
          Flexible(
              flex: 1,
              child: Container(
                child: Text(
                  widget.rosterController.rosterList[widget.index].obs.value.cpoAthletes!.position.toString()+'\n'+"Team",
                  // widget.rosterController.rosterList[widget.index].obs.value.cpoAthletes!..toString(), TODO Put team in Model
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: StyleManager().smallFontSize),
                ),
              )),
          Flexible(
              flex: 1, child: SvgPicture.asset(AssetsString().RiseChartIcon)),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_drop_up_rounded,
                    color: ColorManager.greenColor,
                  ),
                  Text(
                   '\$'+widget.rosterController.rosterList[widget.index].obs.value.currentValue.toString(),
                    style: TextStyle(
                        fontSize: StyleManager().smallFontSize,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.greenColor),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
