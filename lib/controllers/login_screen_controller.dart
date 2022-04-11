import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/utils/session_manager.dart';

class LoginScreenController extends GetxController {
  @override
  void onInit() {
    getUserData();
  }

  getUserData() async {
    User? user = await SessionManager.getUserData();
    if (user != null && user.id != null && user.id!.isNotEmpty) {
      await Get.off(() => TabsScreen(
            selectedIndex: TabsScreen.currentIndex,
          ));
    }
  }
}
