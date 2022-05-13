import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/ui/screens/detail_page/detail_page.dart';
import 'package:player_exchange/ui/screens/cpo_detail_from_discovery.dart';
import 'package:player_exchange/ui/screens/roster_detail_screen.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

class TeamListItem extends StatefulWidget {
  const TeamListItem({Key? key}) : super(key: key);

  @override
  _TeamListItemState createState() => _TeamListItemState();
}

class _TeamListItemState extends State<TeamListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CpoDetailFromDiscovery(cpoModel: CpoModel(),));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
                  backgroundColor: Colors.transparent,
                ),
                Flexible(
                  flex: 6,
                  child: Expanded(
                    child: Text(
                      'Jones       ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: StyleManager().mediumFontSize,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: SvgPicture.asset(AssetsString().RiseChartIcon)),
                Flexible(
                    flex: 1,
                    child: Row(
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
                    )),
              ],
            ),
          ),
          Container(
            color: ColorManager.lightGreyDivider,
            height: 1,
          )
        ],
      ),
    );
  }
}
