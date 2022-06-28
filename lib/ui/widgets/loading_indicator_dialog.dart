import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:player_exchange/utils/color_manager.dart';

class LoadingIndicatorDialog {
  static final LoadingIndicatorDialog _singleton = LoadingIndicatorDialog._internal();
  late BuildContext _context;
  static bool isDisplayed = false;

  factory LoadingIndicatorDialog() {
    return _singleton;
  }

  LoadingIndicatorDialog._internal();

  show(BuildContext context, {String text = 'Loading...', bool dismissable  =true}) {
    if(isDisplayed) {
      return;
    }
    isDisplayed = true;
    showDialog<void>(
        context: context,
        barrierDismissible: dismissable,
        builder: (BuildContext context) {
          _context = context;
          return WillPopScope(
            onWillPop: () async => dismissable,
            child: SimpleDialog(
              backgroundColor: Colors.white,
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
                        child: CircularProgressIndicator(),
                      ),
                      Text(text,
                          style: TextStyle(fontSize: 15, color: ColorManager.greenColor),
                          textAlign: TextAlign.center
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16),
                      //   child: Text(text),
                      // )
                    ],
                  ),
                )
              ] ,
            ),
          );
        }
    );
  }

  dismiss() {
    if(isDisplayed) {
      Navigator.of(_context).pop();
      isDisplayed = false;
    }
  }

}