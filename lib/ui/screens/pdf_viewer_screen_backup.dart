
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter/foundation.dart';


class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({Key? key, required this.pdfPath}) : super(key: key);

  final String pdfPath;

  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> with WidgetsBindingObserver {



  String pathPDF = "https://firebasestorage.googleapis.com/v0/b/player-exchange-ad78f.appspot.com/o/support.pdf?alt=media&token=5f7b1b5a-1618-44ef-80bd-0f7dc3835d21";


  @override
  void initState() {
    super.initState();

    init();

  }

  init() async{


  }






  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: customAppBar(Get.context,
          title: 'Support'.tr, leadingIcon: AssetsString().BackArrowIcon),
      body: const PDF().cachedFromUrl(pathPDF,
          placeholder: (progress) => Center(
            child: Text("Loading - $progress %"),
          ),
          errorWidget: (error) => const Center(
            child: Text("An error occurred while opening bill PDF"),
          )),


    );


  }


}
