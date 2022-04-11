import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';

import 'package:player_exchange/models/rosters/roster_model.dart';

import 'api.dart';


class APIRequests {
  static var client = http.Client();


  static Future<List<CpoModel>> doApi_getCpoAthletes({String position = "QB"}) async {
    String jsonStringFilter = '?filter={"where": {"position": "$position"},"include": [{"relation": "tiers"}]}';
    var completeUrl = Api.baseURL + 'cpo-athletes' + jsonStringFilter;
    var response = await client.get(Uri.parse(
      completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return cpoModelListFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return <CpoModel>[];
    }
  }


  static Future<List<RosterModel>> doApi_getRoster() async {
    String jsonStringFilter = '?filter={"include": [{"relation": "cpoAthletes"}]}';
    var completeUrl = Api.baseURL + 'rosters' + jsonStringFilter;
    var response = await client.get(Uri.parse(
        completeUrl));
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
    var response = await client.get(Uri.parse(
        completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userFromJson(response.body);
    } else {
      //show error message
      return User();
    }
  }


}
