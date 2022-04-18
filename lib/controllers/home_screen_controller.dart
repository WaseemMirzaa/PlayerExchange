import 'package:get/get.dart';
import 'package:player_exchange/controllers/roster_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/utils/session_manager.dart';


class HomeScreenController extends GetxController {
  var isLoading = true.obs;
  RosterController rosterController = Get.put(RosterController());

  @override
  void onInit() {
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

}