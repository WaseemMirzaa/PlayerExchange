import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:player_exchange/Networking/API.dart';
import 'package:player_exchange/Networking/APIRequests.dart';
import 'package:player_exchange/models/Current%20Public%20Offerings/Responses/CPOModel.dart';
import 'package:player_exchange/models/Current%20Public%20Offerings/requests/CPORequest.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class CPOController extends GetxController {
  var isLoading = true.obs;
  var userList = <CpoModel>[].obs;

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
