import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/networking/api_requests.dart';

class CPOController extends GetxController {
  var isLoading = true.obs;
  var userList = <CpoModel>[].obs;
  var itemList = <Widget>[].obs;

  @override
  void onInit() {
    getCpoAthletes("QB");
    super.onInit();
  }

  void getCpoAthletes(String positionName) async {
    try {
      isLoading(true);
      var users = await APIRequests.doApi_getCpoAthletes(position: positionName);
      if (users != null) {
        userList.value = users;
      }
    } finally {
      isLoading(false);
    }
  }
}
