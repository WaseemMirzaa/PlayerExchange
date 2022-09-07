import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:player_exchange/utils/constants.dart';

import '../Networking/api_requests.dart';
import '../models/chart_response_model.dart';

class GraphController extends GetxController{

  var graphPoints = <ChartResponseModel?>[].obs;
  var updatePoints = <FlSpot>[].obs;
  RxDouble maxYAxisValue = 5.0.obs;
  RxDouble interval = 1.0.obs;

  @override
  void onInit() {
    super.onInit();

  }

  fetchData(String id,String duration, int count, {bool isUser = false}) async{
    List<FlSpot> points = [];
    double maxValue = GraphApiConstants.defaultGraphMaxIndex;
    double multiplier = 0.0 ;
    if (isUser){
      await APIRequests.doApi_getChartData_User(id, duration, count).then((value) =>
      {
        graphPoints.value = value,
        maxValue = graphPoints.value[0]?.value?.toDouble() ?? 0.0,

        for (int i = 0; i< graphPoints.value.length ; i++){
          if (graphPoints.value[i]!.value!.toDouble()  > maxValue) maxValue = graphPoints.value[i]!.value!.toDouble(),
          // points.add(FlSpot(i +1 , ran.nextInt(5).toDouble() ))
        },
        for(;maxValue % 5 != 0;){
          maxValue++,
        },
        multiplier = maxValue / 5,
        for (int i = 0; i< graphPoints.value.length ; i++){
          points.add(FlSpot(i +1 , graphPoints.value[i]!.value!.toDouble() ))
        },
        updatePoints.value = points,
        interval.value = multiplier == 0.0 ? 1 : multiplier,
        maxYAxisValue.value = maxValue == 0.0 ? GraphApiConstants.defaultGraphMaxIndex : maxValue,
      });
    }
    else {
      await APIRequests.doApi_getChartData_Player(id, duration, count).then((value) =>
      {
        graphPoints.value = value,
        maxValue = graphPoints.value[0]?.value?.toDouble() ?? 0.0,

        for (int i = 0; i< graphPoints.value.length ; i++){
          if (graphPoints.value[i]!.value!.toDouble()  > maxValue) maxValue = graphPoints.value[i]!.value!.toDouble(),
          // points.add(FlSpot(i +1 , ran.nextInt(5).toDouble() ))
        },
        for(;maxValue % 5 != 0;){
          maxValue++,
        },
        multiplier = maxValue / 5,
        for (int i = 0; i< graphPoints.value.length ; i++){
          points.add(FlSpot(i +1 , graphPoints.value[i]!.value!.toDouble() ))
        },
        updatePoints.value = points,
        interval.value = multiplier == 0.0 ? 1 : multiplier,
        maxYAxisValue.value = maxValue == 0.0 ? GraphApiConstants.defaultGraphMaxIndex : maxValue,
      });
    }




    debugPrint("max value");
    debugPrint(maxYAxisValue.toString());
    debugPrint("Points: ");
    debugPrint(updatePoints.value.toString());
  }


}