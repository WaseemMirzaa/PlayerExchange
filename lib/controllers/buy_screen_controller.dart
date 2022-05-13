import 'package:get/get.dart';
import 'package:player_exchange/models/rosters/add_to_roster_request.dart';
import 'package:player_exchange/networking/api_requests.dart';

class BuyScreenController extends GetxController {
  @override
  void onInit() {}

  Future<bool> addToRosters(
      String userId,
      int sharesBought,
      double currentValue,
      double averageCost,
      double totalValue,
      double totalInvestment,
      double totalRevenue,
      String cpoAthletesId) async {
    AddToRosterRequest addToRosterRequest = AddToRosterRequest(
        userId: userId,
        sharesBought: sharesBought,
        currentValue: currentValue,
        averageCost: averageCost,
        totalValue: totalValue,
        totalInvestment: totalInvestment,
        totalRevenue: totalRevenue,
        cpoAthletesId: cpoAthletesId);

    return await APIRequests.doApi_addCpoToRosters(addToRosterRequest) == null ? false : true;
  }
}
