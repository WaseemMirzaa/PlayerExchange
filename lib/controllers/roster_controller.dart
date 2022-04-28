import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/utils/session_manager.dart';

class RosterController extends GetxController {
  var isLoading = true.obs;
  var rosterList = <RosterModel>[].obs;
  var itemList = <Widget>[].obs;
  var ascendingRosterList = <RosterModel>[].obs;


  void getRoster() async {
    Rx<User?> user = (await SessionManager.getUserData()).obs;

    try {
      isLoading(true);
      var roster = await APIRequests.doApi_getRoster(user.value?.id ?? "");
      if (roster != null) {
        rosterList.value = roster;
        sortAscendingList(roster);

      }
    } finally {
      isLoading(false);
    }
  }

  void sortAscendingList(var roster){
    ascendingRosterList.clear();
    ascendingRosterList.value.addAll(roster);
    ascendingRosterList.sort((a,b) => a.cpoAthletes!.currentPricePerShare!.compareTo(b.cpoAthletes!.currentPricePerShare!));
  }
}






