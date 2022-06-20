import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/favorite_model.dart';
import 'package:player_exchange/models/teams/teams_response.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/utils/session_manager.dart';

class DiscoverScreenController extends GetxController {
  RxList<FavoriteModel> favoriteList = <FavoriteModel>[].obs;
  RxList<Teams> teamsList = <Teams>[].obs;

  @override
  void onInit() {}

  Future<List<FavoriteModel>> getWatchList() async {
    User? user = await getUserData();
    if (user != null && user.id != null) {
      favoriteList.value = await APIRequests.doApi_getWatchList(user.id ?? "");
    }

    return favoriteList;
  }

  Future<User?> getUserData() async {
    User? user = await SessionManager.getUserData();
    return user;
  }

  Future<List<Teams>> getTeamsList() async {
    teamsList.clear();
    TeamsResponse teamsResponse;
    try {
      teamsResponse = await APIRequests.doApi_getTeams();

      for(Conferences conferences in teamsResponse.conferences ?? []){
            for(Divisions divisions in conferences.divisions ?? []){
              teamsList.value.addAll(divisions.teams ?? []);
            }
          }
    } catch (e) {
      print(e);
    }

    return teamsList;
  }
}
