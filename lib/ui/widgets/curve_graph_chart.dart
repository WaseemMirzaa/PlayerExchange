import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/Networking/api_requests.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import '../../main.dart';
import '../../models/chart_response_model.dart';

class CurveChart extends StatefulWidget {


  String playerId;

  LineTouchData lineTouchData = LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.white,
    ),
  );
  FlBorderData borderData =  FlBorderData(
    show: true,
    border:  Border.all(color: Colors.transparent),
  );

  CurveChart({ required this.playerId,Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}
class _ChartState extends State<CurveChart> {

  bool isGraphLoaded = false;
  var graphPoints = <ChartResponseModel?>[];
  List<FlSpot> points = [];
  double xMax = 0.0;
  double yMax = 0.0;

  @override
  void initState() {
    super.initState();
    double maxValue = 0.0;
    APIRequests.doApi_getChartData_Player(widget.playerId, GraphApiConstants.days, GraphApiConstants.daysCountPlayer).then((value) => {
      graphPoints = value,
      for (int i = 0; i< graphPoints.length ; i++){
        if (graphPoints[i]!.value!.toDouble()  > maxValue) maxValue = graphPoints[i]!.value!.toDouble(),
      },
      for(;maxValue % 5 != 0;){
        maxValue++,
      },
      for (int i = 0; i< graphPoints.length ; i++){
        points.add(FlSpot(i +1 , graphPoints[i]!.value!.toDouble()))
      },
      yMax = maxValue,
      xMax = double.parse(graphPoints.length.toString()),

      setState(() { isGraphLoaded = true; })
    });
  }

  @override
  Widget build(BuildContext context) {
    return isGraphLoaded ?LineChart(
      LineChartData(
        lineTouchData: widget.lineTouchData,
        gridData: FlGridData( show: false ),
        titlesData: FlTitlesData( show: false ),
        borderData: widget.borderData,
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            colors: [ColorManager.greenColor],
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
            spots: points,

          )
        ],
        maxX: xMax,
        maxY: yMax,
      ),
      swapAnimationDuration: const Duration(milliseconds: 250),
    ): Container(
      child:const Center(child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(color: ColorManager.greenColor,))),
    );
  }
}



