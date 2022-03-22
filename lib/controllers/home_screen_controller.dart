import 'package:get/get.dart';
import 'package:player_exchange/controllers/roster_controller.dart';


class HomeScreenController extends GetxController {
  var isLoading = true.obs;
RosterController rosterController = Get.put(RosterController());

  @override
  void onInit() {
    rosterController.getRoster();
    super.onInit();

  }


}