import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/favorite_model.dart';
import 'package:player_exchange/models/teams/team_players_response.dart';
import 'package:player_exchange/models/teams/teams_response.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/utils/session_manager.dart';

class TeamDetailScreenController extends GetxController {
  RxList<Players> playerList = <Players>[].obs;

  @override
  void onInit() {}

  Future<User?> getUserData() async {
    User? user = await SessionManager.getUserData();
    return user;
  }

  Future<List<Players>> getTeamsList(String teamId) async {
    playerList.clear();
    TeamPlayersResponse teamsResponse;
    try {
      teamsResponse = await APIRequests.doApi_getPlayersFromTeam(teamId);
      playerList.value = teamsResponse.players ?? [];
    } catch (e) {
      print(e);
    }

    return playerList;
  }
}
