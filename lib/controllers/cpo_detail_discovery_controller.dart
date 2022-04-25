import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:player_exchange/models/favorite_model.dart';
import 'package:player_exchange/networking/api.dart';
import 'package:player_exchange/networking/api_requests.dart';

class CPODetailDiscoveryController extends GetxController {
  RxBool isWatched = false.obs;
  RxList<FavoriteModel> favoriteSingleItemList = <FavoriteModel>[].obs;


  @override
  void onInit() {
    super.onInit();
  }

  Future<String> addToWatchList(String userId, String id) async {
    String status = Api.ERROR;
    var favorite = await APIRequests.doApi_addToWatchList(userId, id);
    if(favorite != null) {
      favoriteSingleItemList.value.clear();
      favoriteSingleItemList.value.add(favorite);
      isWatched.value = true;
      status = Api.SUCCESS;
    }
    else{
      status = Api.ERROR;
    }

    return status;
  }

  Future<String> removeFromWatchList() async {
    String status = Api.ERROR;
    if(isWatched.value && favoriteSingleItemList.isNotEmpty)
      status = await APIRequests.doApi_removeFromWatchList(favoriteSingleItemList[0].id ?? "");

    if(status == Api.SUCCESS)
      isWatched.value = false;

    return status;
  }

  Future<List<FavoriteModel>> getWatchList(String userId, String id) async {
    favoriteSingleItemList.value = await APIRequests.doApi_getWatchList(userId, playerId: id);
    if(favoriteSingleItemList.isEmpty){
      isWatched.value = false;
    } else{
      isWatched.value = true;
    }

    return favoriteSingleItemList;
  }
}
