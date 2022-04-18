import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/utils/my_utils.dart';
import 'package:player_exchange/utils/session_manager.dart';

class AppDrawerController extends GetxController {
  Rx<User> user = User().obs;

  @override
  void onInit() {
    getUserData();
  }

  getUserData() async {
    bool isloggedIn = await MyUtils.checkUserLoggedIn();
    if (isloggedIn) {
      user.value = await SessionManager.getUserData() ?? User();
    }
  }
}
