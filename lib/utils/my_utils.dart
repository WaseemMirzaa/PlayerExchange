import 'dart:ffi';

import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/screens/authentication/login_screen.dart';

import 'session_manager.dart';

class MyUtils {
  static Future<bool> checkUserLoggedIn() async {
    User? user = await SessionManager.getUserData();
    if (user == null || user.id == null || user.id!.isEmpty) {
      SessionManager.setUserData(new User());
      Get.to(LoginScreen());

      return false;
    }
    return true;
  }

  ///Receive the Response object returned by the Dio request library
// static void printRespond(Response response) {
//   Map httpLogMap = Map();
//   httpLogMap.putIfAbsent("requestUrl", () => "${response.request.uri}");
//   httpLogMap.putIfAbsent("requestHeaders", () => response.request.headers);
//   httpLogMap.putIfAbsent("requestQueryParameters", () => response.request.queryParameters);
//   httpLogMap.putIfAbsent("requestPostdata", () => response.request.data);
//   httpLogMap.putIfAbsent("respondData", () => response.data);
//
//   // printJson(httpLogMap);
// }

}
