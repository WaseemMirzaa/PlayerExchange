import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:player_exchange/models/Exchange/exchange_player_model.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/favorite_model.dart';
import 'package:player_exchange/models/rosters/add_to_roster_request.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';

import 'api.dart';

class APIRequests {
  static var client = http.Client();
  static const header = {'Content-Type': 'application/json'};

  static Future<List<CpoModel>> doApi_getCpoAthletes({String position = "QB"}) async {
    String jsonStringFilter =
        '?filter={"where": {"position": "$position"},"include": [{"relation": "tiers"}]}';
    var completeUrl = Api.baseURL + 'cpo-athletes' + jsonStringFilter;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cpoModelListFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return <CpoModel>[];
    }
  }

  static Future<List<CpoModel>> doApi_getCpoAthletesWithNames({String playerName = ""}) async {
    // String jsonStringFilter =
    //     '?filter={"where": {"playerName": "$playerName"},"include": [{"relation": "tiers"}]}';
    String jsonStringFilter =
        '?filter[where][playerName][regexp]=/^$playerName/i&[include][relation]=tiers';
    // filter[where][name][regexp]=^n/i
    var completeUrl = Api.baseURL + 'cpo-athletes' + jsonStringFilter;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cpoModelListFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return <CpoModel>[];
    }
  }


  static Future<List<RosterModel>> doApi_getRoster(String userId) async {

    String jsonStringFilter = '?filter={"where": {"userId": "$userId"}, "include": [{"relation": "cpoAthletes"}]}';
    var completeUrl = Api.baseURL + 'rosters' + jsonStringFilter;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return rosterModelListFromJson(jsonString);
    } else {
      //show error message
      return <RosterModel>[];
    }
  }

  static Future<User> doApi_getUserProfile(String id) async {
    var completeUrl = Api.baseURL + 'users/' + id;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userFromJson(response.body);
    } else {
      //show error message
      return User();
    }
  }

  static Future<String?> doApi_updateUserProfile(String id, User user) async {
    var completeUrl = Api.baseURL + 'users/' + id;
    try {
      var response = await client.patch(Uri.parse(completeUrl),
          //   body: jsonEncode(<String, String>{
          // 'name': user.name ?? "",
          body: jsonEncode(user),
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        // Fluttertoast.showToast(msg: "Profile Updated");
        return Api.SUCCESS;
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Could not update profile.");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  //playerId is CpoModel.id not CpoModel.playerId
  static Future<FavoriteModel?> doApi_addToWatchList(String userId, String playerId) async {
    var completeUrl = Api.baseURL + 'favorites';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body:
              jsonEncode(<String, String>{'userId': userId ?? "", 'cpoAthletesId': playerId ?? ""}),
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        return await favoriteModelFromJson(jsonString);
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Unable to add");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<AddToRosterRequest?> doApi_addCpoToRosters(
      AddToRosterRequest addToRosterRequest) async {
    var completeUrl = Api.baseURL + 'rosters';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body: jsonEncode(addToRosterRequest), headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        return await addToRosterRequestFromJson(jsonString);
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Unable to add");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<String> doApi_removeFromWatchList(String id) async {
    var completeUrl = Api.baseURL + 'favorites/' + id;
    try {
      var response = await client.delete(Uri.parse(completeUrl), headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        return Api.SUCCESS;
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Unable to remove");
      }
    } catch (e) {
      print(e);
    }
    return Api.ERROR;
  }

  static Future<List<FavoriteModel>> doApi_getWatchList(String userId,
      {String playerId = ""}) async {
    String jsonStringFilter =
        '?filter={"where": {"userId": "$userId"},"include": [{"relation": "cpoAthletes"}]}';

    if (playerId.isNotEmpty) {
      jsonStringFilter = '?filter={"where": {"userId": "$userId", "cpoAthletesId": "$playerId"}}';
    }

    var completeUrl = Api.baseURL + 'favorites' + jsonStringFilter;

    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return favoriteModelListFromJson(jsonString);
    } else {
      //show error message
      return <FavoriteModel>[];
    }
  }


  static Future<bool> doApi_addExchangePlayer(num shares, num asking, String rosterId, String userId) async {
    var completeUrl = Api.baseURL + 'exchange-players';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body: jsonEncode(
              {'shares': shares, 'askingAmount': asking,'rosterId': rosterId,'userId': userId}
          ), headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        Fluttertoast.showToast(msg: "Successfully added");

        return true;
        // return await exchangePlayerModelListFromJson(jsonString);
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Unable to add");
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<List<ExchangePlayerModel>> doApi_getExchangePlayers() async {
    String jsonStringFilter =
        '?filter={"include": [{"relation": "roster", "scope": {"include" : [{"relation": "cpoAthletes"}]}}]}';
    var completeUrl = Api.baseURL + 'exchange-players' + jsonStringFilter;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return exchangePlayerModelListFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return <ExchangePlayerModel>[];
    }
  }
}
