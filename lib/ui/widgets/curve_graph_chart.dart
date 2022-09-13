import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/Networking/api_requests.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/constants.dart';
import '../../main.dart';
import '../../models/chart_response_model.dart';
import '../../utils/style_manager.dart';

class CurveChart extends StatefulWidget {


  String playerId;
  String? priceShare;

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

  CurveChart({ required this.playerId,this.priceShare, Key? key}) : super(key: key);

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
    return isGraphLoaded ?Row(
      children: [
        SizedBox(width: 2,),
        SizedBox(
          width: 50,
          child: LineChart(
            LineChartData(
              lineTouchData: widget.lineTouchData,
              gridData: FlGridData( show: false ),
              titlesData: FlTitlesData( show: false ),
              borderData: widget.borderData,
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  colors: [points.isNotEmpty? checkColor(): ColorManager.greenColor],
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                  spots: points,

                )
              ],
              maxX: xMax,
              maxY: yMax,
              minY: 0.0
            ),
            swapAnimationDuration: const Duration(milliseconds: 250),
          ),
        ),
        SizedBox(width: 5,),
        widget.priceShare != null? Row(
          children: [
            Icon(
              points.isNotEmpty ? checkIcon() : Icons.circle,
              color: points.isNotEmpty? checkColor(): ColorManager.greenColor,
            ),
            Text(
              widget.priceShare.toString() == "empty" ? "---" :'\$'+widget.priceShare.toString(),
              style: TextStyle(
                  fontSize: StyleManager().smallFontSize,
                  fontWeight: FontWeight.w600,
                  color: points.isNotEmpty? checkColor(): ColorManager.greenColor),
            ),
          ],
        ): Container(),
      ],
    ): Container(
      child:Row(
        children: [
          Center(child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(color: ColorManager.greenColor,))),
        ],
      ),
    );
  }
  checkColor() {
    if (points[points.length - 1].y >= points[points.length - 2].y ) {
      return ColorManager.greenColor;
    } else {
      return Colors.red;
    }
  }

  checkIcon(){
    if (points[points.length - 1].y >= points[points.length - 2].y ) {
      return Icons.arrow_drop_up_rounded;
    } else {
      return Icons.arrow_drop_down_outlined;
    }
  }
}



