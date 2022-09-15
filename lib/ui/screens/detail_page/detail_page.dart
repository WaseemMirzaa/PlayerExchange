import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/ui/screens/buy_and_watch/buy_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/widgets/ascending_list_item.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/comment_profile_widget.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/ui/widgets/outline_button_with_icon_text.dart';
import 'package:player_exchange/ui/widgets/player_profile_widget.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../main.dart';
import '../../widgets/header_graph_chart.dart';
import '../../widgets/new_tab_widget.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int activeIndex=0;
  final YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'NG6pvXpnIso',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    graphController
        .fetchData(appDrawerController.user.value.id ?? "", GraphApiConstants.days, GraphApiConstants.daysCount);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'JONES QBNY'.tr,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: StyleManager().largeFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Colors.transparent,
                      ),
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
                                    '\$ 16.45',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$' + '75',
                                        style: TextStyle(
                                            fontSize: StyleManager().smallFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
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
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        text: 'available_shares'.tr),
                                    TextSpan(
                                        style: TextStyle(color: ColorManager.greenColor),
                                        text: ' 375 '),
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
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        text: 'open'.tr + " : "),
                                    TextSpan(
                                        style: TextStyle(color: ColorManager.greenColor),
                                        text: '\$ 375 '),
                                  ])),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        text: 'high'.tr + " : "),
                                    TextSpan(
                                        style: TextStyle(color: ColorManager.greenColor),
                                        text: '\$ 375 '),
                                  ])),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                        text: 'low'.tr + " : "),
                                    TextSpan(
                                        style:
                                        TextStyle(color: ColorManager.lowPriceColor),
                                        text: '\$ 375 '),
                                  ])),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  HeaderChartWidget(playerId: appDrawerController.user.value.id ?? ""),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 35.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: InkWell(onTap: (){setState(() {
                          activeIndex=0;
                        });}, child: OfferHeading(title: 'chart'.tr,isEnable: activeIndex==0,isTransparent:activeIndex!=0))),
                        Expanded(child: InkWell(onTap: (){setState(() {
                          activeIndex=1;
                        });},child: OfferHeading(title: 'news'.tr,isEnable: activeIndex==1,isTransparent:activeIndex!=1))),
                        Expanded(child: InkWell(onTap: (){setState(() {
                          activeIndex=2;
                        });},child: OfferHeading(title: 'comments'.tr,isEnable: activeIndex==2,isTransparent:activeIndex!=2))),
                        Expanded(child: InkWell(onTap: (){setState(() {
                          activeIndex=3;
                        });},child: OfferHeading(title: 'profile'.tr,isEnable: activeIndex==3,isTransparent:activeIndex!=3))),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 8.0,bottom: 10,left: 10,right: 10),
                    child: CustomDivider(),
                  ),
                ])),

            getTabbedWigget(activeIndex)
          ],
        ),
      ),
    );
  }

  getTabbedWigget(int index){
    if(index==0){
      return getChartWidget();
    }
    if(index==1){
      return getNewList();
    }
    if(index==2){
      return CommentProfileWidget(
        cpoModel: /*widget.rosterModel.cpoAthletes ??*/ new CpoModel(),
      );
    }
    if(index==3){
      return PlayerProfileWidget(playerId: "playerId from cpoModel",);
    }
  }

  getChartWidget(){
    return SliverList(delegate: SliverChildListDelegate([
      Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child:  YoutubePlayer(
          controller: youtubeController,
          showVideoProgressIndicator: true,
          progressColors: const ProgressBarColors(
            playedColor: Colors.redAccent,
            handleColor: Color(0xffFF6757),
          ),
          onReady: () {

          },
        ),
      ),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                shareTitleAndValue('Share', '\$15'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                shareTitleAndValue('Current Value', '\$15'),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: FilledButton(onTap: (){
                Get.to(()=> BuyScreen(new CpoModel()));
              },
                text: "Buy",reverseColor: true,isFullWidth: false,color: ColorManager.blueGreyButtonColor,),
            ),
            SizedBox(width: 15.w,),
            Expanded(
              child: FilledButton(onTap: (){

                TabsScreen.currentIndex = 1;
                Get.offAll(() => TabsScreen(selectedIndex: 1,));

              },text: "Watch",reverseColor: true,isFullWidth: false,color: ColorManager.blueGreyButtonColor,),
            ),
            // FilledButton(onTap: (){
            //   Get.to(()=>const WatchScreen());
            // },text: "Watch",reverseColor: true,isFullWidth: false,color: ColorManager.blueGreyButtonColor,),
          ],
        ),
      ),
      CustomDivider(),


        ]));
  }

  getNewList(){
    return NewsTabWidget();

  }


  shareTitleAndValue(String title,String value){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: TextStyle(color: Colors.grey)),
        SizedBox(height: 7.h,),
        Text(value,style: TextStyle(color: Colors.black,fontSize: StyleManager().largeFontSize,fontWeight: FontWeight.w600)),
      ],);
  }




}
