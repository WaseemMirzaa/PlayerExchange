import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/Rosters/Responses/Roster_Model.dart';
import 'package:player_exchange/ui/screens/detail_page/detail_page.dart';
import 'package:player_exchange/ui/screens/roster_detail_from_discovery.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Get.to(() => RosterDetailFromDiscovery());
        },
        child: Container(
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
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Text(
                  'Jones',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: StyleManager().mediumFontSize,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'QB Bills',
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
                    Text(
                      '\$' + '1.45',
                      style: TextStyle(
                          fontSize: StyleManager().smallFontSize,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.greenColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
