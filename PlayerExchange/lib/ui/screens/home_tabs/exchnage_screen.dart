import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:player_exchange/models/exchange_model.dart';
import 'package:player_exchange/ui/screens/detail_page/detail_page.dart';
import 'package:player_exchange/ui/screens/select_player_detail_screen.dart';
import 'package:player_exchange/ui/widgets/ascending_list_item.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/outline_button_with_icon_text.dart';
import 'package:player_exchange/ui/widgets/roster_list_item.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  List exchangeList = [
    ExchangeModel(
      name: "Gordon",
      team: "Din",
      pos: "RB",
      price: 25,
      share: 8,
      image: AssetsString().exchangeItem,
    ),
    ExchangeModel(
      name: "Gordon",
      team: "Din",
      pos: "RB",
      price: 25,
      share: 8,
      image: AssetsString().exchangeItem,
    ),
    ExchangeModel(
      name: "Dranold",
      team: "Car",
      pos: "QB",
      price: 5,
      share: 8,
      image: AssetsString().exchangeItem,
    ),
    ExchangeModel(
      name: "Dranold",
      team: "Car",
      pos: "QB",
      price: 5,
      share: 8,
      image: AssetsString().exchangeItem,
    ),
    ExchangeModel(
      name: "Ridley",
      team: "Atl",
      pos: "WR",
      price: 30,
      share: 10,
      image: AssetsString().exchangeItem,
    ),
    ExchangeModel(
      name: "Ridley",
      team: "Atl",
      pos: "WR",
      price: 30,
      share: 10,
      image: AssetsString().exchangeItem,
    ),
    ExchangeModel(
      name: "Andrews",
      team: "Bel",
      pos: "TE",
      price: 20,
      share: 5,
      image: AssetsString().exchangeItem,
    ),
    ExchangeModel(
      name: "Andrews",
      team: "Bel",
      pos: "TE",
      price: 20,
      share: 5,
      image: AssetsString().exchangeItem,
    ),
  ];

  var headingStyle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w600,
  );
  var itemStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "eXchange",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Name",
                      style: headingStyle,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Team",
                      style: headingStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Pos.",
                      style: headingStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Price",
                      style: headingStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Share",
                      style: headingStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: exchangeList.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return getItemWidget(exchangeList[i]);
                },
              ),
              YoutubePlayer(
                controller: youtubeController,
                showVideoProgressIndicator: true,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.redAccent,
                  handleColor: Color(0xffFF6757),
                ),
                onReady: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getItemWidget(ExchangeModel item) {
    return GestureDetector(
        onTap: () {
          Get.to(() => SelectPlayer_detailScreen());
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 15.0,
                        backgroundImage: NetworkImage(
                            'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        item.name,
                        style: itemStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    item.team,
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    item.pos,
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    item.price.toString(),
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    item.share.toString(),
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )));
    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 10),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         flex: 3,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //         Container(
    //         child: CircleAvatar(
    //         radius: 15.0,
    //           backgroundImage: NetworkImage('https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
    //           backgroundColor: Colors.transparent,
    //         ),
    //   ),
    //             SizedBox(width: 5.w,),
    //             Text(
    //               item.name,
    //               style: itemStyle,
    //             ),
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //         flex: 1,
    //         child: Text(
    //           item.team,
    //           style: itemStyle,
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //       Expanded(
    //         flex: 1,
    //         child: Text(
    //          item.pos,
    //           style: itemStyle,
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //       Expanded(
    //         flex: 1,
    //         child: Text(
    //           item.price.toString(),
    //           style: itemStyle,
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //       Expanded(
    //         flex: 1,
    //         child: Text(
    //           item.share.toString(),
    //           style: itemStyle,
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
