import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:player_exchange/Networking/API.dart';
import 'package:player_exchange/models/Current%20Public%20Offerings/Responses/CPOModel.dart';
import 'package:player_exchange/models/Current%20Public%20Offerings/requests/CPORequest.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class CpoController extends GetxController {
  var cpoList = <CpoModel>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {}

  void callCPOModelApi() async {
    // ProgressDialog pd = ProgressDialog(context: context);
    // pd.show(max: 100, msg: 'Loading');

    CpoRequest request = CpoRequest(where: Where(position: "QB"));

    var dio = Dio();
    try {
      final response = await dio.get(Api.baseURL + 'cpo-athletes',
          queryParameters: {"filters": request.toJson()},
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      // pd.close();

      if (response.data != null) {
        print(response.data);
        List<CpoModel> models = cpoListFromJson(response.data.toString());
        cpoList.assignAll(models);
        //
        //   TabsScreen.currentIndex = 0;
        //
        //   Get.off(() => TabsScreen(selectedIndex: 0,));
        //
        //
        // }

      }
    } on DioError catch (e) {
      // pd.close();
      cpoList.assignAll([]);
    }
  }
}
