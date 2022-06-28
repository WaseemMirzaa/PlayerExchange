import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_text_field.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
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
      appBar: customAppBar(context, title: 'Message', trailing: [
        FlatButton(
            onPressed: () {}, child: SvgPicture.asset(AssetsString().EditIcon))
      ]),
      body: Container(
        // width: double.infinity,
        // height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w,vertical: 10.h
                ),
                height: 40.h,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(100)
                ),
                child : const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search,color: Colors.black,),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical:5.0),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),*/
              CustomTextField(
                hintText: 'Search',
                controller: TextEditingController(),
                prefix: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                isRoundedCorner: true,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 0,
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int position) {
                    return Container(
                        // decoration: BoxDecoration(
                        //     border: Border(
                        //         bottom: BorderSide(color: HexToColor(MyConstants.borderClr))
                        //     )
                        // ),
                        height: 80,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                      'https://expressionengine.com/asset/images/avatars/avatar_2621.png'),
                                  backgroundColor: Colors.transparent,
                                ),
                                // chatUserModel.data[position].chat!=null && chatUserModel.data[position].chat.length>0?
                                Positioned(
                                  bottom: -3,
                                  right: 0,
                                  child:
                                      // chatUserModel.data[position].chat[0].senderId==MyConstants.id?
                                      // Container():
                                      // chatUserModel.data[position].chat[0].totalunread!=null &&chatUserModel.data[position].chat[0].totalunread=="0"?
                                      // Container()
                                      //     :
                                      Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: ColorManager.greenColor,
                                      shape: BoxShape.circle,
                                      // borderRadius: BorderRadius.circular(width)
                                    ),
                                    child: Text(
                                      "5",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                                // :
                                // Container()
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "John Doe",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18),
                                      ),
                                      Icon(
                                        Icons.check,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Hi",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: ColorManager.colorTextGray),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            /*Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // SizedBox(height: 10,),
                                Row(
                                  children: [
                                    // chatUserModel.data[position].chat==null || chatUserModel.data[position].chat.length<=0?
                                    // Container(width: 24,):
                                    // chatUserModel.data[position].chat[0].receiverId==MyConstants.id?
                                    // Container(width: 24,)
                                    //     :
                                    // chatUserModel.data[position].chat[0].smsAlertStatus=="0"?
                                    Icon(Icons.check,color: ColorManager.buttonGreyColor,),
                                        // :
                                    // Image.asset('assets/d_tick.png',width: 24,color: Colors.blueAccent),
                                    // chatUserModel.data[position].chat==null || chatUserModel.data[position].chat.length<=0?
                                    // Container():
                                    Text("1 day ago",style: TextStyle(fontFamily: 'poppins',color:ColorManager.buttonGreyColor,))
                                  ],
                                ),
                              ],
                            ),*/
                          ],
                        ));
                  }),
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
      ),
    );
  }
}
