import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/cpo_controller.dart';
import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
import 'package:player_exchange/utils/style_manager.dart';

class CpoShareSingleItem extends StatelessWidget {
  final CpoModel cpoModel;
  final CPOController cpoController = Get.put(CPOController());

  CpoShareSingleItem({Key? key, required this.cpoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 1,
              child: Text(
                cpoModel.obs.value.playerName.toString(),
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
                        '\$' +
                            cpoModel.obs.value.currentPricePerShare.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: StyleManager().smallFontSize,
                            fontWeight: FontWeight.w500),
                      )),
                  Flexible(
                      flex: 1,
                      child: Text(
                        // index==0?'100000':"",
                        cpoModel.sharesAvailable.toString(),
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
