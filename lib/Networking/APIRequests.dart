import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:player_exchange/Networking/API.dart';
import 'package:player_exchange/models/Current%20Public%20Offerings/Responses/CPO_Model.dart';
import 'package:player_exchange/models/Current%20Public%20Offerings/requests/CPO_Request.dart';
import 'package:player_exchange/models/Rosters/Responses/Roster_Model.dart';


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


}
