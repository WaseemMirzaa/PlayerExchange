import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class MyProgressDialog{

  showProgress(context) async {
    /// Create progress dialog
    ProgressDialog pd = ProgressDialog(context: context);

    /// Set options
    /// Max and msg required
    pd.show(
      max: 100,
      msg: '',
      progressBgColor: Colors.transparent,
    );
  }
  hideProgress(context) async{

  }

  // _valuableProgress(context) async {
  //   ProgressDialog pd = ProgressDialog(context: context);
  //
  //   pd.show(
  //     max: 100,
  //     msg: 'File Downloading...',
  //
  //     /// Assign the type of progress bar.
  //     progressType: ProgressType.valuable,
  //   );
  //   for (int i = 0; i <= 100; i++) {
  //     pd.update(value: i);
  //     i++;
  //     await Future.delayed(Duration(milliseconds: 100));
  //   }
  // }
  //
  // _preparingProgress(context) async {
  //   ProgressDialog pd = ProgressDialog(context: context);
  //
  //   /// show the state of preparation first.
  //   pd.show(
  //     max: 100,
  //     msg: 'Preparing Download...',
  //     progressType: ProgressType.valuable,
  //   );
  //
  //   /// Added to test late loading starts
  //   await Future.delayed(Duration(milliseconds: 3000));
  //   for (int i = 0; i <= 100; i++) {
  //     /// You can indicate here that the download has started.
  //     pd.update(value: i, msg: 'File Downloading...');
  //     i++;
  //     await Future.delayed(Duration(milliseconds: 100));
  //   }
  // }
  //
  // _customProgress(context) async {
  //   ProgressDialog pd = ProgressDialog(context: context);
  //
  //   /// show the state of preparation first.
  //   pd.show(
  //       max: 100,
  //       msg: 'Preparing Download...',
  //       progressType: ProgressType.valuable,
  //       backgroundColor: Color(0xff212121),
  //       progressValueColor: Color(0xff3550B4),
  //       progressBgColor: Colors.white70,
  //       msgColor: Colors.white,
  //       valueColor: Colors.white);
  //
  //   /// Added to test late loading starts
  //   await Future.delayed(Duration(milliseconds: 3000));
  //   for (int i = 0; i <= 100; i++) {
  //     /// You can indicate here that the download has started.
  //     pd.update(value: i, msg: 'File Downloading...');
  //     i++;
  //     await Future.delayed(Duration(milliseconds: 100));
  //   }
  // }
}