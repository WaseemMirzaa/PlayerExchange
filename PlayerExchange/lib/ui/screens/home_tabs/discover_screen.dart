import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:player_exchange/ui/screens/detail_page/team_detail_screen.dart';
import 'package:player_exchange/ui/screens/roster_detail_from_discovery.dart';
import 'package:player_exchange/ui/widgets/ascending_list_item.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/custom_text_field.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'NG6pvXpnIso',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Browse",
                    style: TextStyle(
                        fontSize: StyleManager().largeFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                  hintText: 'Search',
                  controller: TextEditingController(),
                  prefix: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  isRoundedCorner: true),
              Container(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Teams",
                          style: TextStyle(
                              fontSize: StyleManager().mediumFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        // SizedBox(width: 3,),
                        // Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 12,)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 10.h,
              ),
              Wrap(
                  spacing: 1.0,
                  runSpacing: 4,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: addTeams()),
              Container(
                height: 10.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(
                    opacity: 0,
                    child: SvgPicture.asset(AssetsString().ArrowDown),
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Watch'.tr,
                            style: TextStyle(
                                fontSize: StyleManager().mediumFontSize,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ))),
                  SvgPicture.asset(AssetsString().ArrowDown)
                  // Expanded(flex: 1, child: SvgPicture.asset(AssetsString().ArrowDown),),

                  // SizedBox(width: 3,),
                  // Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 12,)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 220.h,
                width: double.infinity,
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return InkWell(
                        onTap: () {
                          Get.to(RosterDetailFromDiscovery());
                        },
                        child: RoasterListItem(
                          isShowSharesLabel: false,
                        ));
                  },
                  itemCount: 5,
                  separatorBuilder: (_, index) => CustomDivider(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: YoutubePlayer(
                  controller: youtubeController,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.redAccent,
                    handleColor: Color(0xffFF6757),
                  ),
                  onReady: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  List<Widget> addTeams() {
    List<Widget> myTags = <Widget>[];
    for (int i = 0; i < 12; i++) {
      myTags.add(GestureDetector(
        onTap: () {
          Get.to(() => TeamDetailScreen());
        },
        child: Card(
          elevation: 0,
          // elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border:
                    Border.all(color: ColorManager.lightGreyDivider, width: 1)),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              "EUR ${(i + 1).toString()}",
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ),
        ),
      )); // TODO: Whatever layout you need for each widget.
    }
    return myTags;
  }
}
