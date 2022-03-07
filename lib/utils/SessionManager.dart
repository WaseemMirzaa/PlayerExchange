import 'dart:convert';

import 'package:player_exchange/models/auth/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String USER_KEY = "USER_KEY";

  static Future<void> saveUserData(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(USER_KEY, jsonEncode(user));
  }

  Future<User?> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? json = preferences.getString(USER_KEY);

    if (json != null) {
      User user = User.fromJson(jsonDecode(json));
      return user;
    }
    return null;
  }
}
