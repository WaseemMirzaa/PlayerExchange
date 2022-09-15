
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/assets_string.dart';
import '../widgets/custom_appbar.dart';

class WebViewGenericCustom extends StatefulWidget {
  const WebViewGenericCustom({Key? key, required this.url, required this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  State<WebViewGenericCustom> createState() => _WebViewAppCustomState(url, title);
}

class _WebViewAppCustomState extends State<WebViewGenericCustom> {
  String? url, title;
  _WebViewAppCustomState(String stripeUrl, String name){
    url = stripeUrl ;
    title = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: title ?? "", leadingIcon: AssetsString().BackArrowIcon),      // appBar: AppBar(
      //   backgroundColor: ColorManager.greenColor,
      //   title: Text(title ?? ''),
      // ),
      body:  WebView(
        initialUrl: url.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) async{
          debugPrint("success");
        },
        onPageFinished: (String urlNew) async {

        },
      ),
    );
  }


}

