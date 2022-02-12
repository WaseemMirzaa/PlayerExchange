import 'package:flutter/material.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

class ShareSingleItem extends StatelessWidget {
  int index=0;

   ShareSingleItem({Key? key,this.index=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 1,
              child: Text(
                index.toString()+'-Patric Mahomes',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: StyleManager().smallFontSize,
                    fontWeight: FontWeight.w500),
              )),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 1,
                      child: Text(
                        '\$ 25',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: StyleManager().smallFontSize,
                            fontWeight: FontWeight.w500),
                      )),
                  Flexible(
                      flex: 1,
                      child: Text(
                        index==0?'100000':"",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
