import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:player_exchange/controllers/team_detail_screen_controller.dart';
import 'package:player_exchange/models/teams/teams_response.dart';
import 'package:player_exchange/ui/widgets/popular_list_item.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/outline_button_with_icon_text.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/ui/widgets/team_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TeamDetailScreen extends StatefulWidget {
  const TeamDetailScreen({Key? key, required this.team}) : super(key: key);
  final Teams team;

  @override
  _TeamDetailScreenState createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  TeamDetailScreenController teamDetailScreenController = Get.put(TeamDetailScreenController());
  int selectedIndex = 0;


  // final YoutubePlayerController youtubeController = YoutubePlayerController(
  //   initialVideoId: 'NG6pvXpnIso',
  //   flags: const YoutubePlayerFlags(
  //     autoPlay: false,
  //     mute: true,
  //   ),
  // );


  @override
  void initState() {
    teamDetailScreenController.getTeamsList(widget.team.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                // Container(height: 23.h,),
                Row(
                  children: [
                    Expanded(
                      flex: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.team.name}',
                                style: TextStyle(
                                    fontSize: StyleManager().largeFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Expanded(
                                flex: 15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(AssetsString().steeler),
                                    Container(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Obx(() => Container(
                            height: 350,
                            width: double.infinity,
                            child: ListView.separated(
                              itemBuilder: (_, index) {
                                return TeamListItem(players: teamDetailScreenController.playerList[index],);
                              },
                              itemCount: teamDetailScreenController.playerList.length,
                              separatorBuilder: (_, index) => CustomDivider(),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 23.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  // child: Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(50.0),
                  //   ),
                  //   elevation: 0,
                  //   child: YoutubePlayer(
                  //     controller: youtubeController,
                  //     showVideoProgressIndicator: true,
                  //     progressColors: const ProgressBarColors(
                  //       playedColor: Colors.redAccent,
                  //       handleColor: Color(0xffFF6757),
                  //     ),
                  //     onReady: () {},
                  //   ),
                  // ),
                ),
              ])),
            ]),
          ),
        ));
  }

  shareTitleAndValue(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        SizedBox(
          height: 7,
        ),
        Text(value,
            style: TextStyle(
                color: Colors.black,
                fontSize: StyleManager().largeFontSize,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
