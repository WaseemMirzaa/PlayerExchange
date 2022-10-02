import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/exchange/exchange_player_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/screens/exchange_player/select_exchange_player_detail_screen.dart';
import 'package:player_exchange/ui/widgets/circle_avatar_named_widget.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  var list = <ExchangePlayerModel>[].obs;

  var headingStyle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w600,
  );
  var itemStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  // final YoutubePlayerController youtubeController = YoutubePlayerController(
  //   initialVideoId: 'NG6pvXpnIso',
  //   flags: const YoutubePlayerFlags(
  //     autoPlay: false,
  //     mute: true,
  //   ),
  // );


  @override
  void initState() {
    APIRequests.doApi_getExchangePlayers().then((value) => {
      list.value = value
    });
  }

  @override
  Widget build(BuildContext context) {
    // APIRequests.doApi_getExchangePlayers().then((value) => {
    //   list.value = value
    // });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Xchange",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "",
                    style: headingStyle,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Name",
                    style: headingStyle,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Team",
                    style: headingStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Pos.",
                    style: headingStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Price",
                    style: headingStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Shares",
                    style: headingStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Obx(() => Expanded(
              child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return getItemWidget(list.value[i]);
                },
              ),
            )),
            // YoutubePlayer(
            //   controller: youtubeController,
            //   showVideoProgressIndicator: true,
            //   progressColors: const ProgressBarColors(
            //     playedColor: Colors.redAccent,
            //     handleColor: Color(0xffFF6757),
            //   ),
            //   onReady: () {},
            // ),
          ],
        ),
      ),
    );
  }

  Widget getItemWidget(ExchangePlayerModel exchangePlayerModel) {
    return GestureDetector(
        onTap: () {
          Get.to(() => SelectExchangePlayerDetailScreen(exchangePlayerModel: exchangePlayerModel,));
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                      child: CircleAvatarNamedWidget(url:exchangePlayerModel.roster?.cpoAthletes?.profilePicture ?? "", name: exchangePlayerModel.roster?.cpoAthletes?.playerName ?? "", radius: 17,)

                ),

                Expanded(
                  flex: 2,
                  child: Text(
                    exchangePlayerModel.roster?.cpoAthletes?.playerName ?? "",
                    style: itemStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Team Here",
                    // item.team,
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    exchangePlayerModel.roster?.cpoAthletes?.position ?? "",                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "\$" + exchangePlayerModel.askingAmount.toString(),
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    exchangePlayerModel.shares.toString(),
                    style: itemStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )));

  }
}
