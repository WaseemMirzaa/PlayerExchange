//
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:player_exchange/models/auth/user_model.dart';
// import 'package:player_exchange/ui/screens/authentication/auth_screen.dart';
// import 'package:player_exchange/ui/widgets/custom_appbar.dart';
// import 'package:player_exchange/utils/assets_string.dart';
// import 'package:player_exchange/utils/session_manager.dart';
//
//
// class PdfViewerScreen extends StatefulWidget {
//   const PdfViewerScreen({Key? key, required this.pdfPath}) : super(key: key);
//
//   final String pdfPath;
//
//   @override
//   _PdfViewerScreenState createState() => _PdfViewerScreenState();
// }
//
// class _PdfViewerScreenState extends State<PdfViewerScreen> {
//   bool _isLoading = true;
//   PDFDocument document = PDFDocument();
//
//   @override
//   void initState() {
//     super.initState();
//
//     loadDocument();
//   }
//
//   loadDocument() async {
//     document = await PDFDocument.fromAsset(widget.pdfPath);
//     // document = await PDFDocument.fromURL('https://firebasestorage.googleapis.com/v0/b/player-exchange-ad78f.appspot.com/o/support.pdf?alt=media&token=5f7b1b5a-1618-44ef-80bd-0f7dc3835d21');
// // Load specific page
//     PDFPage pageOne = await document.get(page: 1);
//     setState(() => _isLoading = false);
//   }
//
//   changePDF(value) async {
//     setState(() => _isLoading = true);
//     if (value == 1) {
//       document = await PDFDocument.fromAsset('assets/sample2.pdf');
//     } else if (value == 2) {
//       document = await PDFDocument.fromURL(
//         "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf",
//         /* cacheManager: CacheManager(
//           Config(
//             "customCacheKey",
//             stalePeriod: const Duration(days: 2),
//             maxNrOfCacheObjects: 10,
//           ),
//         ), */
//       );
//     } else {
//       document = await PDFDocument.fromAsset('assets/sample.pdf');
//     }
//     setState(() => _isLoading = false);
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(
//       BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width,
//           maxHeight: MediaQuery.of(context).size.height),
//       designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
//     );
//     return Scaffold(
//       appBar: customAppBar(Get.context,
//           title: 'Support'.tr, leadingIcon: AssetsString().BackArrowIcon),
//       body: Center(
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator()): Container(),
//         //     : PDFViewer(
//         //   document: document,
//         //   zoomSteps: 1,
//         // ),
//       ),
//     );
//   }
// }