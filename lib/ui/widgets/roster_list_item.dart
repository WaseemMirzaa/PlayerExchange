import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/roster_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/circle_avatar_named_widget.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

import 'curve_graph_chart.dart';

class RoasterListItem extends StatefulWidget {
  int index = 0;
  bool isRoster;
  CpoModel cpoModel;
  RosterModel rosterModel = RosterModel();

  RoasterListItem({Key? key, this.isRoster = true, required this.cpoModel, required this.rosterModel}) : super(key: key);

  @override
  _RoasterListItemState createState() => _RoasterListItemState();
}

class _RoasterListItemState extends State<RoasterListItem> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

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
            child: CircleAvatarNamedWidget(url: widget.cpoModel.profilePicture ?? "", name: widget.cpoModel.playerName ?? "", radius: 22,)

          ),
          Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cpoModel.playerName.toString(),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: StyleManager().smallFontSize,
                        fontWeight: FontWeight.w600),
                  ),
                  widget.isRoster
                      ? Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            widget.rosterModel.sharesBought.toString() +' Shares',
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
                  widget.cpoModel.position.toString()+'\n'+"Team",
                  // widget.rosterController.rosterList[widget.index].obs.value.cpoAthletes!..toString(), TODO Put team in Model
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: StyleManager().smallFontSize),
                ),
              )),
          Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 70,
                child: Center(child: CurveChart(playerId: widget.cpoModel.id ?? "", priceShare: widget.cpoModel.currentPricePerShare.toString())))),

        ],
      ),
    );
  }
}
