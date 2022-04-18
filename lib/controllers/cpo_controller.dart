import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/screens/current_public_offering_screen.dart';

class CPOController extends GetxController {
  var isLoading = true.obs;
  var userList = <CpoModel>[].obs;
  RxMap tierAthletesMap = new Map().obs;
  RxList<CpoListItem> cpoItemList = <CpoListItem>[].obs;

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

    await populateMapAndCpoItemsList();

  }


  populateMapAndCpoItemsList() async{
    tierAthletesMap.clear();
    cpoItemList.clear();
    for(CpoModel cpoModel in userList.value){
      //If tier already exists
      if(tierAthletesMap.keys.contains(cpoModel.tiers?.name)){
        if(tierAthletesMap[cpoModel.tiers?.name] != null) {
          tierAthletesMap[cpoModel.tiers?.name]!.add(cpoModel);
        }

        cpoItemList.add(CpoShareItem(cpoModel: cpoModel));
      }
      //If tier does not exists
      else{
        List cpoModels = [];
        cpoModels.add(cpoModel);
        tierAthletesMap.assign(cpoModel.tiers?.name, cpoModels);
        cpoItemList.add(CpoHeadingItem(cpoModel: cpoModel));
        cpoItemList.add(CpoShareItem(cpoModel: cpoModel));


      }
    }
    // print("tierAthletesMap"+ tierAthletesMap.toString());
  }

}
