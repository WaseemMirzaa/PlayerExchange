import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/networking/api_requests.dart';

class RosterController extends GetxController {
  var isLoading = true.obs;
  var rosterList = <RosterModel>[].obs;
  var itemList = <Widget>[].obs;
  var ascendingRosterList = <RosterModel>[].obs;


  void getRoster() async {
    try {
      isLoading(true);
      var roster = await APIRequests.doApi_getRoster();
      if (roster != null) {
        rosterList.value = roster;
        sortAscendingList(roster);

      }
    } finally {
      isLoading(false);
    }
  }

  void sortAscendingList(var roster){
    ascendingRosterList.value.addAll(roster);
    ascendingRosterList.sort((a,b) => a.cpoAthletes!.currentPricePerShare!.compareTo(b.cpoAthletes!.currentPricePerShare!));
  }
}






