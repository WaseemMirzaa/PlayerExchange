import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/networking/api.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/widgets/loading_indicator_dialog.dart';
import 'package:player_exchange/utils/my_utils.dart';
import 'package:player_exchange/utils/session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class EditProfileScreenController extends GetxController {
  Rx<User> user = User().obs;

  @override
  Future<void> onInit() async {
    bool isloggedIn = await MyUtils.checkUserLoggedIn();
    if (isloggedIn) {
      getUserData();
    }
  }

  getUserData() async {
    user.value = (await SessionManager.getUserData())!;
  }

  Future<bool> saveProfile(File? image, String name, BuildContext context) async {
    String url = "";

    if (user == null && user.value == null) {
      return false;
    }

    LoadingIndicatorDialog().show(context, text: "Updating profile...");
    if (image != null) {
      url = await uploadImage(image);
      if (url != Api.ERROR)
        user.value.profilePicture = url;
    }

    if (name != null && name.isNotEmpty) {
      user.value.name = name;
      await APIRequests.doApi_updateUserProfile(user.value.id!, user.value);
    }
    LoadingIndicatorDialog().dismiss();
    return true;
  }

  Future<String> uploadImage(File uploadimage) async {
    String uploadurl = Api.baseURL + "attachments/upload";
    var postUri = Uri.parse(uploadurl);
    var request = new http.MultipartRequest("POST", postUri);
    // request.fields['user'] = 'blah';
    try {
      request.files.add(new http.MultipartFile.fromBytes(
          'file', await File.fromUri(uploadimage.uri).readAsBytes(),
          contentType: MediaType('image', 'jpeg'),
          filename: uploadimage.uri.path.split("/").last));

      StreamedResponse streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        print("Uploaded!");
        var jsondata = json.decode(response.body); //decode json data

        return jsondata["url"];
      }
    } catch (e) {
      print(e);
    }
    return Api.ERROR;
  }
}
