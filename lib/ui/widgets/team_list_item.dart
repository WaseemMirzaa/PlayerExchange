import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/teams/team_players_response.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/screens/detail_page/detail_page.dart';
import 'package:player_exchange/ui/screens/cpo_detail_from_discovery.dart';
import 'package:player_exchange/ui/screens/roster_detail_screen.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/loading_indicator_dialog.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/cached_network_image.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

import 'circle_avatar_named_widget.dart';
import 'curve_graph_chart.dart';

class TeamListItem extends StatefulWidget {
  const TeamListItem({Key? key, required this.players}) : super(key: key);
  final Players players;

  @override
  _TeamListItemState createState() => _TeamListItemState();
}

class _TeamListItemState extends State<TeamListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        LoadingIndicatorDialog().show(context,);
        CpoModel cpoModel = await APIRequests.doApi_getCpoAthleteWithID(playerId: widget.players.id ?? "");
        LoadingIndicatorDialog().dismiss();
        if(cpoModel.playerId != null) {
          Get.to(() => CpoDetailFromDiscovery(cpoModel: cpoModel,));
        } else {
          Fluttertoast.showToast(msg: "Player not available in Current Public Offerings");
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatarNamedWidget(name: widget.players.name ?? "", url: "",),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${widget.players.name}',
                    // '',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: StyleManager().smallFontSize,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: 60,
                        height: 70,
                        child: Center(child: CurveChart(playerId: widget.players.id ?? "")))),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up_rounded,
                          color: ColorManager.greenColor,
                        ),
                        Text(
                          '\$' + '---',
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

