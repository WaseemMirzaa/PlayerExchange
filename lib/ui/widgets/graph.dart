import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color_manager.dart';
import '../../utils/style_manager.dart';
import 'chart.dart';

class HeaderChartWidget extends StatefulWidget {
  const HeaderChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderChartWidget> createState() => _HeaderChartWidgetState();
}

class _HeaderChartWidgetState extends State<HeaderChartWidget> {
  @override
  void initState() {
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 150,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            color: ColorManager.chartBackgroundColor,
            child: Chart(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Row(
            children: [
              // Text(
              //   'live'.tr,
              //   style: TextStyle(
              //       color: ColorManager.greenColor,
              //       fontWeight: FontWeight.w500,
              //       fontSize: StyleManager().smallFontSize),
              // ),
              // SizedBox(
              //   width: 50,
              // ),
              InkWell(
                onTap: ((){

                }),
                child: Text(
                  'Days'.tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: StyleManager().smallFontSize),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'Weeks'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: StyleManager().smallFontSize),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'Months'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: StyleManager().smallFontSize),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'Years'.tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: StyleManager().smallFontSize),
              ),
            ],
          ),
        ),

      ],
    );
  }
}