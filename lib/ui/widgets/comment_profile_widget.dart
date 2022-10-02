import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/models/current_public_offerings/comment_model.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/utils/DateUtilsCustom.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:time_elapsed/time_elapsed.dart';

import 'circle_avatar_named_widget.dart';

class CommentProfileWidget extends StatelessWidget {
  CommentProfileWidget({
    Key? key,
    required this.cpoModel,
  }) : super(key: key);

  CpoModel cpoModel;
  TextEditingController msgController = TextEditingController();
  AppDrawerController appDrawerController = Get.find();
  RxList list = <CommentModel>[].obs;
  RxList revertedList = <CommentModel>[].obs;

  @override
  Widget build(BuildContext context) {
    getComments();

    // return SliverList(
    //     delegate: SliverChildListDelegate([
    //   Padding(
    //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
    //     child: Container(
    //       color: ColorManager.lightGreyDivider,
    //       height: 1,
    //     ),
    //   ),
    //   getCommentBox(),
    // Obx(() => ListView.builder(
    //   itemCount: revertedList.length,
    //   shrinkWrap: true,
    //   itemBuilder: (context, i) {
    //     return getCommentItem(revertedList.value[i]);
    //   },
    // )),

    return Obx(() => SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => getCommentItem(index),
            childCount: revertedList.length + 2,
          ),
        ));
    // FilledButton(
    //   onTap: () {
    //
    //   },
    //   text: "Post",
    //   reverseColor: true,
    //   isFullWidth: true,
    //   color: ColorManager.blueGreyButtonColor,
    // ),
    // singleCommentItem(),
    // singleCommentItem(),
    // singleCommentItem(),
    // singleCommentItem(),
    // ]));
  }

  Container getCommentBox() {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.blueGreyButtonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
      height: 60,
      // width: double.infinity,
      // color: Colors.grey[200],

      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              smartQuotesType: SmartQuotesType.disabled,
              controller: msgController,
              style: TextStyle(color: Colors.black54),
              decoration: const InputDecoration(
                  hintText: "Write comment...",
                  hintStyle: TextStyle(color: Colors.black54),
                  // labelStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              sendComment();
            },
            child: Icon(
              Icons.send,
              color: Colors.white,
              size: 18,
            ),
            backgroundColor: ColorManager.greenColor,
            elevation: 0,
          ),
        ],
      ),
    );
  }

  getCommentItem(int index) {
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Container(
          color: ColorManager.lightGreyDivider,
          height: 1,
        ),
      );
    } else if (index == 1) {
      return getCommentBox();
    } else {
      CommentModel commentModel = revertedList.value[index - 2];
      return Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatarNamedWidget(url: commentModel.senderProfile ?? "",name: commentModel.senderName?? "",),
            // CircleAvatar(
            //   radius: 15.0,
            //   backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            //   backgroundColor: Colors.transparent,
            // ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commentModel.senderName ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: StyleManager().smallFontSize),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    // 'Just Now',
                    DateUtilsCustom.getElapsedTime(commentModel.createdAt ?? ""),
                    style: TextStyle(color: ColorManager.colorTextGray, fontSize: 12),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    commentModel.text ?? "",
                    style: TextStyle(color: Colors.black, fontSize: StyleManager().smallFontSize),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(AssetsString().ThumbsUpIcon),
                  //     SizedBox(
                  //       height: 3,
                  //     ),
                  //     Text(
                  //       commentModel.likesCount?.toString() ?? "0",
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //     SizedBox(
                  //       width: 7,
                  //     ),
                  //     SvgPicture.asset(AssetsString().ThumbsDownIcon),
                  //     SizedBox(
                  //       height: 3,
                  //     ),
                  //     Text(
                  //       commentModel.dislikesCount?.toString() ?? "0",
                  //       style: TextStyle(color: Colors.grey),
                  //     )
                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  Future<void> getComments() async {
    list.value = await APIRequests.doApi_getComments(
        userId: appDrawerController.user.value.id ?? "", cpoAthletesId: cpoModel.id ?? "");

    revertedList.clear();
    for (int i = list.length - 1; i >= 0; i--) {
      revertedList.add(list[i]);
      // APIRequests.doApi_getUserProfile(revertedList[i]?.value?.senderId ?? "").then((user) {
      //   revertedList[i]?.value?.senderName = user.name;
      //   revertedList[i]?.value?.senderProfile = user.profilePicture;
      // });
    }


  }

  String msg = "";

  // Future<String?> getFcmToken (String uid) async{
  //   String? fcmId;
  //   var collection = FirebaseFirestore.instance.collection('users');
  //   var docSnapshot = await collection.doc(uid).get();
  //   if (docSnapshot.exists) {
  //     Map<String, dynamic>? data = docSnapshot.data();
  //     var value = data?['fcmToken'];
  //     fcmId = value != "" ? value : "";
  //   }
  //   return fcmId;
  // }

  Future<void> sendComment() async {
    if (validate()) {
      //Hide Keyboard
      FocusManager.instance.primaryFocus?.unfocus();

      msg = msgController.text;

      msgController.text = "";
      // String? receiverFcmToken = await getFcmToken(widget.otherUserId) as String;
      // String? userName = await getUserName(FirebaseAuth.instance.currentUser!.uid) as String;

      CommentModel? commentModel = await APIRequests.doApi_addComment(
          appDrawerController.user.value.id ?? "",
          msg,
          cpoModel.id ?? "",
          appDrawerController.user.value.name ?? "",
          appDrawerController.user.value.profilePicture ?? "");

      if (commentModel != null) list.add(commentModel);

      revertedList.insert(0, commentModel);
      // APIRequests.doApi_getUserProfile(commentModel?.value?.senderId ?? "").then((user) {
      //   commentModel?.value?.senderName = user.name;
      //   commentModel?.value?.senderProfile = user.profilePicture;
      // });
      // revertedList.clear();
      // for(int i = list.length - 1; i >= 0; i--){
      //   revertedList.add(list[i]);
      // }
      // FirebaseCloudMessaging.sendNotification("New Message", "You have Received a new message from "+ userName, receiverFcmToken);

    }
  }

  bool validate() {
    if (msgController.text.isEmpty) return false;

    return true;
  }
}
