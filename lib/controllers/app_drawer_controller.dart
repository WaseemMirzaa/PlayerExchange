import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/utils/session_manager.dart';

class AppDrawerController extends GetxController{

  User? user = new User();
  @override
  void onInit() {
    getUserData();
  }
  getUserData() async{
    user = await SessionManager.getUserData();
  }
}