import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/utils/my_utils.dart';
import 'package:player_exchange/utils/session_manager.dart';

class EditProfileScreenController extends GetxController{

  Rx<User> user = User().obs;

  @override
  Future<void> onInit() async {
    bool isloggedIn = await MyUtils.checkUserLoggedIn();
    if(isloggedIn){
      getUserData();
    }
  }

  getUserData() async{
    user.value = (await SessionManager.getUserData())!;
  }
}