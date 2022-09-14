
import 'package:flutter/material.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

      appBar: AppBar(
        backgroundColor: ColorManager.greenColor,
        title: Text(title ?? ''),
      ),
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

