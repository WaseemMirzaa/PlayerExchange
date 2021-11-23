import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:player_exchange/utils/color_manager.dart';

class Chart extends StatefulWidget {
  var data=LineChartData(
  lineTouchData: LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.white,
    ),
  ),
  gridData: FlGridData(show: false),
   titlesData: FlTitlesData(show: false),
  borderData: FlBorderData(
    show: false,
    border: const Border(
      bottom: BorderSide(color: Colors.transparent),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  ),
  lineBarsData: [LineChartBarData(
    isCurved: false,
    colors: [ ColorManager.greenColor],
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  )],
  // minX: 0,
  // maxX: 14,
  // maxY: 4,
  // minY: 0,
  );



   Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
       widget.data ,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }
}


