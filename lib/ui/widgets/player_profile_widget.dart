import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/teams/team_players_response.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/utils/style_manager.dart';

class PlayerProfileWidget extends StatelessWidget{
  PlayerProfileWidget({
    Key? key,
    required this.playerId,
  }) : super(key: key);

  final String playerId;
  Rx<Players> player = Players().obs;
  // ProfileScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    getPlayer();
    return Obx(() => buildProfile());
    // return circularProgressWidget();
  }

  Container circularProgressWidget(){
    return Container(
      color: Colors.black.withOpacity(0.5),
      child:  Center(
        child:SizedBox(// Center(

          child: CircularProgressIndicator(
            strokeWidth: 4.0,
            valueColor : AlwaysStoppedAnimation(Colors.grey),
          ),
          height: 50.0,
          width: 50.0,
        ),
      ),
    );
  }
  Container buildProfile() {
    return Container(
      child: SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Text(
          player.value.name ?? "",
          style: TextStyle(
              color: Colors.black,
              fontSize: StyleManager().largeFontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Postion',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              player.value.position ?? "",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Birth Date',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              player.value.birthDate ?? "",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Weight',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              player.value.weight?.toString() ?? "",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Height',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              player.value.height?.toString() ?? "",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'College',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              player.value.college?.toString() ?? "",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Draft',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              player.value.draft == null ? "" : 'Round ${player.value.draft?.round ?? "--"} Pick ${player.value.draft?.number ?? "--"}',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Team',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            )),
            Expanded(
                child: Text(
              player.value.draft?.team?.name ?? "",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ),
      // FilledButton(
      //   onTap: () {},
      //   text: "More",
      //   reverseColor: true,
      //   isFullWidth: true,
      //   color: ColorManager.blueGreyButtonColor,
      // ),
      // SizedBox(
      //   height: 20,
      // )
  ])),
    );
  }


  Future<void> getPlayer() async {
    player.value =  await APIRequests.doApi_getPlayer(playerId);
  }
}

class PlayerProfileController extends GetxController with StateMixin {
  Rx<Players> player = Players().obs;

  Future<void> getPlayer(playerId) async {

    // make status to loading
    change(null, status: RxStatus.loading());

    // Code to get data
    player.value =  await APIRequests.doApi_getPlayer(playerId);

    // if done, change status to success
    change(null, status: RxStatus.success());
  }
}
