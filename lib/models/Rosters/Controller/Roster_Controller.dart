import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:player_exchange/Networking/APIRequests.dart';
import 'package:player_exchange/models/Rosters/Responses/Roster_Model.dart';

class RosterController extends GetxController {
  var isLoading = true.obs;
  var rosterList = <RosterModel>[].obs;
  var itemList = <Widget>[].obs;


  void getRoster() async {
    try {
      isLoading(true);
      var roster = await APIRequests.doApi_getRoster();
      if (roster != null) {
        rosterList.value = roster;
      }
    } finally {
      isLoading(false);
    }
  }
}






