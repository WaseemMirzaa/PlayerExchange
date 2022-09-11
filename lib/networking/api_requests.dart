import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:player_exchange/models/Exchange/exchange_player_model.dart';
import 'package:player_exchange/models/Exchange/offer.dart';
import 'package:player_exchange/models/auth/error_response.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/current_public_offerings/comment_model.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/models/favorite_model.dart';
import 'package:player_exchange/models/rosters/add_to_roster_request.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/models/teams/team_players_response.dart';
import 'package:player_exchange/models/teams/teams_response.dart';
import 'package:player_exchange/models/transactions/transaction_model.dart';

import '../models/chart_response_model.dart';
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

  static Future<CpoModel> doApi_getCpoAthleteWithID({String playerId = ""}) async {
    String jsonStringFilter =
        '?filter[where][playerId][regexp]=/^$playerId/i&[include][relation]=tiers';
    var completeUrl = Api.baseURL + 'cpo-athletes' + jsonStringFilter;
    var response = await client.get(Uri.parse(completeUrl));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var cpoModelList = cpoModelListFromJson(jsonString);
        return cpoModelList.length > 0 ? cpoModelList[0] : CpoModel();
      } else {
        //show error message
        Fluttertoast.showToast(msg: Api.apiErrorResponse);
        return CpoModel();
      }
    } catch (e) {
      print(e);
      return CpoModel();
    }
  }

  static Future<List<RosterModel>> doApi_getRoster(String userId) async {
    String jsonStringFilter =
        '?filter={"where": {"userId": "$userId"}, "include": [{"relation": "cpoAthletes"}]}';
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




  // static Future<String> doApi_updateUserProfile(String id, User user) async {
  //   var completeUrl = Api.baseURL + 'users/' + id;
  //   try {
  //     var response = await client.patch(Uri.parse(completeUrl),
  //         //   body: jsonEncode(<String, String>{
  //         // 'name': user.name ?? "",
  //         body: jsonEncode(user),
  //         headers: header);
  //     if (response.statusCode == 200 || response.statusCode == 204) {
  //       var jsonString = response.body;
  //       // Fluttertoast.showToast(msg: "Profile Updated");
  //       return Api.SUCCESS;
  //     } else {
  //       //show error message
  //       Fluttertoast.showToast(msg: "Could not update profile.");
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return Api.ERROR;
  // }

  //playerId is CpoModel.id not CpoModel.playerId
  static Future<FavoriteModel?> doApi_addToWatchList(String userId, String playerId) async {
    var completeUrl = Api.baseURL + 'favorites';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body: jsonEncode(<String, String>{'userId': userId, 'cpoAthletesId': playerId}),
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

  static Future<bool> doApi_addExchangePlayer(
      num shares, num asking, String rosterId, String userId) async {
    var completeUrl = Api.baseURL + 'exchange-players';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body: jsonEncode(
              {'shares': shares, 'askingAmount': asking, 'rosterId': rosterId, 'userId': userId}),
          headers: header);
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

  static Future<TeamsResponse> doApi_getTeams() async {
    var completeUrl = Api.baseURL + 'teams';
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return teamsResponseFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return TeamsResponse();
    }
  }

  static Future<TeamPlayersResponse> doApi_getPlayersFromTeam(String teamId) async {
    var completeUrl = Api.baseURL + 'teams-with-players/' + teamId;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return teamPlayersResponseFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return TeamPlayersResponse();
    }
  }

  static Future<Players> doApi_getPlayer(String playerId) async {
    var completeUrl = Api.baseURL + 'player/' + playerId;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return playersFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return Players();
    }
  }

  static Future<List<TransactionModel>> doApi_getTransactions({String userId = ""}) async {
    String jsonStringFilter = '?filter[where][userId][regexp]=/^$userId/i';
    // filter[where][name][regexp]=^n/i
    var completeUrl = Api.baseURL + 'transactions' + jsonStringFilter;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return transactionModelListFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return <TransactionModel>[];
    }
  }

  static Future<TransactionModel?> doApi_addTransaction(TransactionModel transactionModel) async {
    var completeUrl = Api.baseURL + 'transactions';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body:
              // jsonEncode(transactionModel),
              jsonEncode({
            "userId": transactionModel.userId,
            "type": transactionModel.type,
            "paymentType": transactionModel.paymentType,
            "amount": transactionModel.amount,
            "shares": transactionModel.shares,
            "playerId": transactionModel.playerId,
            "playerName": transactionModel.playerId,
          }),
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        return await transactionModelFromJson(jsonString);
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Unable to create a Transaction.");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<String?> doApi_removeTransaction(String transactionId) async {
    var completeUrl = Api.baseURL + 'transactions/' + transactionId;
    try {
      var response = await client.delete(Uri.parse(completeUrl), headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        return await jsonString; //It should be transaction id
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Unable to create a Transaction.");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<CommentModel?> doApi_addComment(String senderId, String text, String cpoAthletesId,
      String senderName, String senderProfile) async {
    var completeUrl = Api.baseURL + 'comments';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body: jsonEncode({
            "senderId": senderId,
            "text": text,
            "cpoAthletesId": cpoAthletesId,
            "senderName": senderName,
            "senderProfile": senderProfile,
          }),
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        return await commentModelFromJson(jsonString);
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Unable to post your comment.");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<CommentModel>> doApi_getComments(
      {String userId = "", String cpoAthletesId = ""}) async {
    String jsonStringFilter =
        '?filter[where][cpoAthletesId][regexp]=/^$cpoAthletesId/i&filter[order]=createdAt ASC';

    var completeUrl = Api.baseURL + 'comments/' + userId + jsonStringFilter;
    var response = await client.get(Uri.parse(completeUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return commentModelListFromJson(jsonString);
    } else {
      //show error message
      Fluttertoast.showToast(msg: Api.apiErrorResponse);
      return <CommentModel>[];
    }
  }

  static Future<bool> doApi_ForgotPassword_SendEmail(
    String email,
  ) async {
    var completeUrl = Api.baseURL + 'user/forget-password-email';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body: jsonEncode({
            "email": email,
          }),
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        return true;
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Unable to send verification Email");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to send verification Email");
      print(e);
    }
    return false;
  }

  static Future<bool> doApi_ResetPassword(
  String email, String newPass, String otp) async {
    var completeUrl = Api.baseURL + 'user/forget-password';
    try {
      var response = await client.post(Uri.parse(completeUrl),
          body: jsonEncode({
            "email": email,
            "password": newPass,
            "secretKey": otp,
          }),
          headers: header);
      if (response.statusCode == 200 || response.statusCode == 204) {
        var jsonString = response.body;
        return true;
      } else {
        //show error message
        Fluttertoast.showToast(msg: "Invalid Otp Entered");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to validate Otp");
      print(e);
    }
    return false;
  }







  static Future<String> doApi_updateUserProfile(String id, User user) async {
    var completeUrl = Api.baseURL + 'users/' + id;


      var dio = Dio();
      try {
        final response = await dio.patch(completeUrl,
            data: user.toJson(),
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }));

        print ("updateUserProfile response: " + response.toString());
        if (response.data != null && response.statusCode == 200 || response.statusCode == 204) {
          return Api.SUCCESS;
        }
      } on DioError catch (e) {
        e.printError();

        if (e.response != null) {
          print('has response' + e.response?.data);
          Fluttertoast.showToast(msg: "Could not update profile.");
        } else {
          Fluttertoast.showToast(msg: e.response.toString());
        }
      }
    return Api.ERROR;

  }


  static Future<Offer?> doApi_postOffer(Offer offer) async {
    var completeUrl = Api.baseURL + 'offers';

    var dio = Dio();
    try {
      final response = await dio.post(completeUrl,
          data: offer.toJson(),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      print ("offer response: " + response.toString());
      if (response.data != null && response.statusCode == 200 || response.statusCode == 204) {
        Fluttertoast.showToast(msg: "Offer Sent");

        return Offer.fromJson(response.data);
      }
    } on DioError catch (e) {
      e.printError();

      if (e.response != null) {
        // print('has response' + e.response?.data ?? "");
        Fluttertoast.showToast(msg: "Could not send offer.");
      } else {
        Fluttertoast.showToast(msg: e.response.toString());
      }
    }
    return null;

  }


  static Future<List<Offer?>> doApi_getOffers(Offer offer) async {
    var completeUrl = Api.baseURL + 'offers';

    var dio = Dio();
    try {
      final response = await dio.get(completeUrl,);

      print ("offer response: " + response.toString());
      if (response.data != null && response.statusCode == 200 || response.statusCode == 204) {
        return offerModelListFromJson(response.data);
      }
    } on DioError catch (e) {
      e.printError();

      if (e.response != null) {
        print('has response' + e.response?.data );
        Fluttertoast.showToast(msg: "Could not update profile.");
      } else {
        Fluttertoast.showToast(msg: e.response.toString());
      }
    }
    return [];

  }

  static Future<List<ChartResponseModel?>> doApi_getChartData_Player(String playerId, String duration,int count) async {
    //duration = day, week, month, year
    //count is number of any duration
    var completeUrl = Api.baseURL + 'cpo-athletes/${playerId}/athlete-share-price-trends-data?duration=${duration}&count=${count}';

    var dio = Dio();
    try {
      final response = await dio.get(completeUrl,);

      //print ("response: " + response.toString());
      if (response.data != null && response.statusCode == 200 || response.statusCode == 204) {
        //debugPrint(response.data.toString());
        return chartModelListFromJson(response.data);
      }
    } on DioError catch (e) {
      e.printError();

      if (e.response != null) {
        print('has response' + e.response?.data ?? "");
        Fluttertoast.showToast(msg: "Could not update chart.");
      } else {
        Fluttertoast.showToast(msg: e.response.toString());
      }
    }
    return [];

  }

  static Future<List<ChartResponseModel?>> doApi_getChartData_User(String userId, String duration,int count) async {
    //duration = day, week, month, year
    //count is number of any duration
    var completeUrl = Api.baseURL + 'cpo-athletes/${userId}/athlete-share-price-trends-data?duration=${duration}&count=${count}';

    var dio = Dio();
    try {
      final response = await dio.get(completeUrl,);

      print ("response: " + response.toString());
      if (response.data != null && response.statusCode == 200 || response.statusCode == 204) {
        return chartModelListFromJson(response.data);
      }
    } on DioError catch (e) {
      e.printError();

      if (e.response != null) {
        print('has response' + e.response?.data ?? "");
        Fluttertoast.showToast(msg: "Could not update chart.");
      } else {
        Fluttertoast.showToast(msg: e.response.toString());
      }
    }
    return [];

  }

}
