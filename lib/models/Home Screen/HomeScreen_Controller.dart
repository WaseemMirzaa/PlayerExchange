import 'package:get/get.dart';
import 'package:player_exchange/Networking/APIRequests.dart';
import 'package:player_exchange/models/Rosters/Controller/Roster_Controller.dart';
import 'package:player_exchange/models/Rosters/Responses/Roster_Model.dart';


class HomeScreenController extends GetxController {
  var isLoading = true.obs;
  var rosterList = <RosterModel>[].obs;
RosterController rosterController = Get.put(RosterController());

  @override
  void onInit() {
    rosterController.getRoster();
    super.onInit();

  }


}