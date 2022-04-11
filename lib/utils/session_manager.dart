import 'dart:convert';

import 'package:player_exchange/models/auth/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String USER_KEY = "USER_KEY";
  static const String USER_ID_KEY = "USER_ID_KEY";

  static Future<void> setUserData(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(USER_KEY, jsonEncode(user));
  }

  static Future<User?> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? json = preferences.getString(USER_KEY);

    if (json != null) {
      User user = User.fromJson(jsonDecode(json));
      return user;
    }
    return null;
  }

}
