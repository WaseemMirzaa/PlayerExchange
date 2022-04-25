import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/favorite_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/utils/session_manager.dart';

class DiscoverScreenController extends GetxController{

  RxList<FavoriteModel> favoriteList = <FavoriteModel>[].obs;

  @override
  void onInit() {
  }

  Future<List<FavoriteModel>> getWatchList() async {
    User? user = await getUserData();
    if(user != null && user.id != null) {
      favoriteList.value = await APIRequests.doApi_getWatchList(user.id ?? "");
    }

    return favoriteList;
  }

  Future<User?> getUserData() async {
      User? user = await SessionManager.getUserData();
      return user;
    }
}