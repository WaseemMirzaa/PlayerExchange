import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/home_screen_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/utils/session_manager.dart';

class RosterController extends GetxController {
  var isLoading = true.obs;
  var rosterList = <RosterModel>[].obs;
  var itemList = <Widget>[].obs;
  var ascendingRosterList = <RosterModel>[].obs;
  RxInt countQBs = 0.obs;
  RxInt countRBs = 0.obs;
  RxInt countTEs = 0.obs;
  RxInt countWRs = 0.obs;
  Rx<User?> user = User().obs;
  // HomeScreenController homeScreenController = Get.find();

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

    countPositions();
    setTotalValueInUser();
  }

  void sortAscendingList(var roster){
    ascendingRosterList.clear();
    ascendingRosterList.value.addAll(roster);
    ascendingRosterList.sort((a,b) => a.cpoAthletes!.currentPricePerShare!.compareTo(b.cpoAthletes!.currentPricePerShare!));
  }

  void countPositions(){
    countQBs.value = 0;
    countRBs.value = 0;
    countTEs.value = 0;
    countWRs.value = 0;
    for(RosterModel rosterModel in rosterList){
      rosterModel.cpoAthletes?.position == "QB" ? countQBs.value++ : countQBs;
      rosterModel.cpoAthletes?.position == "RB" ? countRBs.value++ : countRBs;
      rosterModel.cpoAthletes?.position == "TE" ? countTEs.value++ : countTEs;
      rosterModel.cpoAthletes?.position == "WR" ? countWRs.value++ : countWRs;
    }
  }

  Future<void> setTotalValueInUser() async {
    num totalValue = 0;
    for(RosterModel rosterModel in rosterList){
      totalValue += rosterModel.totalValue ?? 0.0;
    }

    user = (await SessionManager.getUserData()).obs;
    // User user = appDrawerController.user.value;
    user.value!.totalValue = totalValue;

    await APIRequests.doApi_updateUserProfile(user.value?.id ?? "", user.value!);

    // user.value.totalValue;
    // SessionManager.setUserData();


  }
}






