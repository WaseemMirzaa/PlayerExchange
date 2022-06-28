import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/roster_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/stripe/response/create_customer/CreateCustomerReponse.dart';
import 'package:player_exchange/stripe/stripe_payment.dart';
import 'package:player_exchange/utils/session_manager.dart';

class HomeScreenController extends GetxController {
  var isLoading = true.obs;
  RosterController rosterController = Get.put(RosterController());

  @override
  void onInit() {
    getUserData();
    rosterController.getRoster();
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

      APIRequests.doApi_updateUserProfile(user.id ?? "", user).then((value) => {
        getUserData()
      });
    }
  }
}
