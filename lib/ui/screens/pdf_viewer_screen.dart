
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/ui/screens/authentication/auth_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/session_manager.dart';

import 'home_tabs/tabs_screen.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({Key? key, required this.pdfPath}) : super(key: key);

  final String pdfPath;

  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PDFDocument document = PDFDocument();


  @override
  void initState() {
    super.initState();

    init();

  }

  init() async{
    // Load from assets
    document = await PDFDocument.fromAsset(widget.pdfPath);
    setState(() { });

// // Load from URL
//     PDFDocument doc = await PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf');
//
// // Load from file
//     File file  = File('...');
//     PDFDocument doc = await PDFDocument.fromFile(file);
  }


  @override
  void setState(VoidCallback fn) {

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
    );
    return Scaffold(
      appBar: customAppBar(Get.context,
          title: 'Support'.tr, leadingIcon: AssetsString().BackArrowIcon),
      body: Center(
          child:
          // _isLoading
          //     ? Center(child: CircularProgressIndicator())
          //     :
          PDFViewer(document: document)),
    );
  }
}
