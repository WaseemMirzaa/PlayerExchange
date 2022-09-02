import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/ui/screens/detail_page/detail_page.dart';
import 'package:player_exchange/ui/screens/cpo_detail_from_discovery.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'circle_avatar_named_widget.dart';

class AscendingListItem extends StatefulWidget {
  final RosterModel rosterModel;
  const AscendingListItem({Key? key, required this.rosterModel}) : super(key: key);

  @override
  _AscendingListItemState createState() => _AscendingListItemState();
}

class _AscendingListItemState extends State<AscendingListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(() => CpoDetailFromDiscovery(cpoModel: widget.rosterModel.cpoAthletes ?? CpoModel()));
        },
        child: Container(
          height: 190,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatarNamedWidget(url: widget.rosterModel.cpoAthletes?.profilePicture ?? "", name: widget.rosterModel.cpoAthletes?.playerName ?? "", radius: 27,)

                  ),
                ),
                Text(
                  widget.rosterModel.cpoAthletes!.playerName ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: StyleManager().mediumFontSize,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.rosterModel.cpoAthletes!.position.toString(),
                  style: TextStyle(color: ColorManager.colorTextGray),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_drop_up_rounded,
                      color: ColorManager.greenColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Text(
                        '\$' + widget.rosterModel.currentValue.toString(),
                        style: TextStyle(
                            fontSize: StyleManager().smallFontSize,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.greenColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
