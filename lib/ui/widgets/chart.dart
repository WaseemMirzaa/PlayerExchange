import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/utils/color_manager.dart';
import '../../main.dart';

class Chart extends StatefulWidget {

  LineTouchData lineTouchData = LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.white,
    ),
  );
  FlBorderData borderData =  FlBorderData(
    show: true,
    border:  Border.all(color: Colors.grey.withOpacity(0.5)),
  );

  Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}
class _ChartState extends State<Chart> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => LineChart(
      LineChartData(
        lineTouchData: widget.lineTouchData,
        gridData: FlGridData(show: false),
        titlesData: LineTitle.getTitlesData(),
        borderData: widget.borderData,
        lineBarsData: [
          LineChartBarData(
            isCurved: false,
            colors: [ColorManager.greenColor],
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(show: false),
            spots: graphController.updatePoints,
          )
        ],
         maxX: graphController.graphPoints.length.toDouble(),
         maxY: graphController.maxYAxisValue.value.toDouble(),

      ),
      swapAnimationDuration: const Duration(milliseconds: 250),
    ));
  }
}

class LineTitle {
  static getTitlesData() {
    return FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
          getTextStyles:(value, _ ) => const TextStyle(
            color: Colors.black , fontSize: 7
          ),
          getTitles: (value){
          return value.toInt().toString();
        },
        margin: 10,interval: 1,
        reservedSize: 5
      ),
        leftTitles:  SideTitles(
          showTitles: true,

          getTextStyles:(value, _) => const TextStyle(
              color: Colors.black , fontSize: 7
          ),
          getTitles: (value){
            return value.toInt().toString();
          },
          margin: 10,
          reservedSize: 10,
          interval: graphController.interval.value
        ),
      rightTitles: SideTitles(
        showTitles: false
      ),
      topTitles: SideTitles(
        showTitles: false
      )
    );

  }
}


