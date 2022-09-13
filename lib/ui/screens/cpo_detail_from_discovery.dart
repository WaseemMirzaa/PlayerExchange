import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/cpo_detail_discovery_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/teams/team_players_response.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/circle_avatar_named_widget.dart';
import 'package:player_exchange/ui/widgets/comment_profile_widget.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/ui/widgets/player_profile_widget.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
// import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../main.dart';
import '../../utils/constants.dart';
import '../widgets/curve_graph_chart.dart';
import '../widgets/header_graph_chart.dart';
import 'buy_and_watch/buy_screen.dart';

class CpoDetailFromDiscovery extends StatefulWidget {
  final CpoModel cpoModel;

  const CpoDetailFromDiscovery({Key? key, required this.cpoModel}) : super(key: key);

  @override
  _CpoDetailFromDiscoveryState createState() => _CpoDetailFromDiscoveryState();
}

class _CpoDetailFromDiscoveryState extends State<CpoDetailFromDiscovery> {
  CPODetailDiscoveryController cpoDetailDiscoveryController =
      Get.put(CPODetailDiscoveryController());
  AppDrawerController appDrawerController = Get.find<AppDrawerController>();
  int activeIndex = 0;
  late final YoutubePlayerController youtubeController = YoutubePlayerController(
    // initialVideoId: 'NG6pvXpnIso',
    initialVideoId: widget.cpoModel.video ?? "",
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );
  // late VideoPlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    graphController
        .fetchData( widget.cpoModel.id ?? "", GraphApiConstants.days, GraphApiConstants.daysCount);

  }


  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.network(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Padding(
        padding: ButtonTheme.of(context).padding,
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cpoModel.playerName ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: StyleManager().largeFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatarNamedWidget(url: widget.cpoModel.profilePicture ?? "", name: widget.cpoModel.playerName ?? "", radius: 32,)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$ ' + widget.cpoModel.currentPricePerShare.toString(),
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' \$' + (widget.cpoModel.currentPricePerShare! * widget.cpoModel.sharesAvailable!).toString(),
                                    style: TextStyle(
                                        fontSize: StyleManager().smallFontSize,
                                        fontWeight: FontWeight.w600,
                                        color: ColorManager.greenColor),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: ColorManager.greenColor,
                                    size: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'available_shares'.tr),
                            TextSpan(
                                style: TextStyle(color: ColorManager.greenColor),
                                text: " " + widget.cpoModel.sharesAvailable.toString() ),
                          ]))
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'open'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.greenColor), text: '\$ --- '),
                          ])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'high'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.greenColor), text: '\$ --- '),
                          ])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'low'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.lowPriceColor),
                                text: '\$ --- '),
                          ])),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              HeaderChartWidget(playerId: widget.cpoModel.id ?? ""),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 35.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 0;
                              });
                            },
                            child: OfferHeading(
                                title: 'chart'.tr,
                                isEnable: activeIndex == 0,
                                isTransparent: activeIndex != 0))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 1;
                              });
                            },
                            child: OfferHeading(
                                title: 'news'.tr,
                                isEnable: activeIndex == 1,
                                isTransparent: activeIndex != 1))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 2;
                              });
                            },
                            child: OfferHeading(
                                title: 'comments'.tr,
                                isEnable: activeIndex == 2,
                                isTransparent: activeIndex != 2))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 3;
                              });
                            },
                            child: OfferHeading(
                                title: 'profile'.tr,
                                isEnable: activeIndex == 3,
                                isTransparent: activeIndex != 3))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 10, left: 10, right: 10),
                child: CustomDivider(),
              ),
            ])),
            getTabbedWigget(activeIndex)
          ],
        ),
      ),
    );
  }

  getTabbedWigget(int index) {
    if (index == 0) {
      return getChartWidget();
    }
    if (index == 1) {
      return getNewList();
    }
    if (index == 2) {
      return CommentProfileWidget(
        cpoModel: widget.cpoModel,
      );
    }
    if (index == 3) {
      return PlayerProfileWidget(playerId: widget.cpoModel.playerId ?? "",);
    }
  }

  getChartWidget() {
    cpoDetailDiscoveryController.getWatchList(
        appDrawerController.user.value.id ?? "", widget.cpoModel.id ?? "");
    // _controller = VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    return Obx(() {
      return SliverList(
          delegate: SliverChildListDelegate([
        Container(
            // padding: EdgeInsets.symmetric(
            //   vertical: 15,
            // ),
            // child: Scaffold(
            //   body: Center(
            //     child: _controller.value.isInitialized
            //         ? AspectRatio(
            //       aspectRatio: _controller.value.aspectRatio,
            //       child: VideoPlayer(_controller),
            //     )
            //         : Container(),
            //   ),
            //   floatingActionButton: FloatingActionButton(
            //     onPressed: () {
            //       setState(() {
            //         _controller.value.isPlaying
            //             ? _controller.pause()
            //             : _controller.play();
            //       });
            //     },
            //     child: Icon(
            //       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            //     ),
            //   ),
            // ),
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
        Text(
          'Justin Fields Throws 20 yards td pass to put bears up at half...',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        Text(
          '2d',
          style: TextStyle(color: ColorManager.colorTextGray, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    shareTitleAndValue(
                        'Share Cost', '\$' + widget.cpoModel.currentPricePerShare.toString(),
                        isShowGraph: true),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    shareTitleAndValue(
                        'Share Available', '\$' + widget.cpoModel.sharesAvailable.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FilledButton(
                  onTap: () {
                    Get.to(() => BuyScreen(widget.cpoModel));
                  },
                  text: "Buy",
                  reverseColor: true,
                  isFullWidth: false,
                  color: ColorManager.blueGreyButtonColor,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: FilledButton(
                  onTap: () {
                    //Add to watch list
                    if (!cpoDetailDiscoveryController.isWatched.value) {
                      cpoDetailDiscoveryController.addToWatchList(
                          appDrawerController.user.value.id ?? "", widget.cpoModel.id ?? "");
                    } else {
                      cpoDetailDiscoveryController.removeFromWatchList();
                    }
                  },
                  text: cpoDetailDiscoveryController.isWatched.value ? "Unwatch" : "Watch",
                  reverseColor: true,
                  isFullWidth: false,
                  color: ColorManager.blueGreyButtonColor,
                ),
              ),
              // FilledButton(onTap: (){
              //   Get.to(()=>const WatchScreen());
              // },text: "Watch",reverseColor: true,isFullWidth: false,color: ColorManager.blueGreyButtonColor,),
            ],
          ),
        ),
        CustomDivider(),
      ]));
    });
  }

  getNewList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((_, index) {
      return getSingleItem('Jones continue to strugle', 'Espn');
    }, childCount: 5));
  }

  getSingleItem(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: StyleManager().mediumFontSize,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 7.h,
          ),
          Text(subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: StyleManager().smallFontSize,
              ))
        ],
      ),
    );
  }

  shareTitleAndValue(String title, String value, {bool isShowGraph = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.black)),
        SizedBox(
          height: 7.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: StyleManager().largeFontSize,
                    fontWeight: FontWeight.w600)),
            isShowGraph
                ? Row(
                    children: [
                      Icon(
                        Icons.arrow_drop_up_rounded,
                        color: ColorManager.greenColor,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          height: 70,
                          child: Center(child: CurveChart(playerId: widget.cpoModel.id ?? "")))
                    ],
                  )
                : SizedBox.shrink()
          ],
        ),
      ],
    );
  }


  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }
}

