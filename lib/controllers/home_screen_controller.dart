import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/roster_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/count_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/stripe/response/create_customer/CreateCustomerReponse.dart';
import 'package:player_exchange/stripe/stripe_payment.dart';
import 'package:player_exchange/utils/session_manager.dart';

import '../models/current_public_offerings/cpo_model.dart';

class HomeScreenController extends GetxController {
  var isLoading = true.obs;
  RosterController rosterController = Get.put(RosterController());
  var cpoModelList_Popular = <CpoModel>[].obs;

  @override
  void onInit() {
    getUserData();
    rosterController.getRoster();
    getCpoAthletes_Popular();
    super.onInit();
  }

  getUserData() async {
    User? user = await SessionManager.getUserData();
    if (user != null && user.id != null && user.id!.isNotEmpty) {
      User user1 = await APIRequests.doApi_getUserProfile(user.id!);
      SessionManager.setUserData(user1);
    }
  }

  Future<void> checkAndUpdateStripeCustomerId(BuildContext context) async {
    User? user = await SessionManager.getUserData();
    if (user != null &&
        user.id != null &&
        user.id!.isNotEmpty &&
        user.stripeCustomerId != null &&
        user.stripeCustomerId!.isEmpty) {
      Map<String, dynamic>? customerResponse =
          await StripePayment(context).getCustomerResponse(user.email ?? "");
      if (customerResponse == null) {
        // Navigator.of(context).pop();
        Fluttertoast.showToast(msg: 'Unable to create stripeCustomerId');
        return;
      }
      var userRes = CreateCustomerResponse.fromJson(customerResponse);
      user.stripeCustomerId = userRes.customer;

      APIRequests.doApi_updateUserProfile(user.id ?? "", user).then((value) => {getUserData()});
    }
  }

  void getCpoAthletes_Popular() async {
    try {
      CountModel countModel = await APIRequests.doApi_getCpoAthletes_Count();
      int count = countModel.count ?? 0;
      int skip = 0;
      int limit = 4;

      if (count > limit) {
        var max = (count - limit) + 1;
        Random random = Random();
        var _randomNumber = random.nextInt(max); // 0 to max
        skip = _randomNumber;
      }

      var atheletes = await APIRequests.doApi_getCpoAthletes_Popular(limit, skip);

      if (atheletes != null) {
        atheletes.shuffle();

        cpoModelList_Popular.value = atheletes;
      }
    } catch (e) {
      print(e);
    } finally {}

    // await populateMapAndCpoItemsList();
  }
}
