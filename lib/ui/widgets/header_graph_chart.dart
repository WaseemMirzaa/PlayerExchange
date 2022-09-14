import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/main.dart';
import 'package:player_exchange/utils/constants.dart';

import '../../utils/color_manager.dart';
import '../../utils/style_manager.dart';
import 'chart.dart';

class HeaderChartWidget extends StatefulWidget {
  final String playerId;
  final bool? isUser;
  final Function(String)? onDurationSelect;

  const HeaderChartWidget({
    required this.playerId,
    this.isUser,
    this.onDurationSelect,
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderChartWidget> createState() => _HeaderChartWidgetState();
}

class _HeaderChartWidgetState extends State<HeaderChartWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 150,
            padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
            color: ColorManager.chartBackgroundColor,
            child: Chart(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Row(
            children: [
              Container(
                padding: currentIndex == 0
                    ? EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)
                    : null,
                color: currentIndex == 0 ? ColorManager.greenColor : null,
                child: InkWell(
                  onTap: (() {
                    widget.onDurationSelect?.call("day");
                    setState(() {
                      currentIndex = 0;
                    });
                    graphController.fetchData(
                        widget.playerId, GraphApiConstants.days, GraphApiConstants.daysCount,
                        isUser: widget.isUser ?? false);
                  }),
                  child: Text(
                    'Days'.tr,
                    style: TextStyle(
                        color: currentIndex == 0 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: StyleManager().smallFontSize),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                padding: currentIndex == 1
                    ? EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)
                    : null,
                color: currentIndex == 1 ? ColorManager.greenColor : null,
                child: InkWell(
                  onTap: () {
                    widget.onDurationSelect?.call("week");
                    setState(() {
                      currentIndex = 1;
                    });
                    graphController.fetchData(
                        widget.playerId, GraphApiConstants.weeks, GraphApiConstants.weeksCount,
                        isUser: widget.isUser ?? false);
                  },
                  child: Text(
                    'Weeks'.tr,
                    style: TextStyle(
                        color: currentIndex == 1 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: StyleManager().smallFontSize),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                padding: currentIndex == 2
                    ? EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)
                    : null,
                color: currentIndex == 2 ? ColorManager.greenColor : null,
                child: InkWell(
                  onTap: () {
                    widget.onDurationSelect?.call("month");
                    setState(() {
                      currentIndex = 2;
                    });
                    graphController.fetchData(
                        widget.playerId, GraphApiConstants.months, GraphApiConstants.monthsCount,
                        isUser: widget.isUser ?? false);
                  },
                  child: Text(
                    'Months'.tr,
                    style: TextStyle(
                        color: currentIndex == 2 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: StyleManager().smallFontSize),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                padding: currentIndex == 3
                    ? EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)
                    : null,
                color: currentIndex == 3 ? ColorManager.greenColor : null,
                child: InkWell(
                  onTap: () {
                    widget.onDurationSelect?.call("year");
                    setState(() {
                      currentIndex = 3;
                    });
                    graphController.fetchData(
                        widget.playerId, GraphApiConstants.years, GraphApiConstants.yearsCount,
                        isUser: widget.isUser ?? false);
                  },
                  child: Text(
                    'Years'.tr,
                    style: TextStyle(
                        color: currentIndex == 3 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: StyleManager().smallFontSize),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
