
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/stripe/response/create_customer/CreateStripeAccount.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class WebViewCustom extends StatefulWidget {
  const WebViewCustom({Key? key, required this.stripeUrl,required this.accountId }) : super(key: key);

  final String stripeUrl;
  final String accountId;

  @override
  State<WebViewCustom> createState() => _WebViewAppState(stripeUrl,accountId);
}

class _WebViewAppState extends State<WebViewCustom> {
  String? url;
  String? accId;
  _WebViewAppState(String stripeUrl,String accountId){
    url = stripeUrl ;
    accId = accountId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body:  WebView(
        initialUrl: url.toString(),
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) async{
          debugPrint("success");
        },
        onPageFinished: (String urlNew) async {



          debugPrint('Page finished loading: $urlNew');
          if (urlNew.contains('https://example.com/success')) {
            AppDrawerController appDrawerController = Get.find();
            User user = appDrawerController.user.value;
            user.accountId = accId;
            await APIRequests.doApi_updateUserProfile(user.id ?? "", user);
            // FirebaseFirestore.instance.collection('users')
            //     .doc(FirebaseAuth.instance.currentUser!.uid)
            //     .update({'accountId': accId});

            Get.back(result: "Account Created");
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            //     builder: (context) => const dashboard.Dashboard()), (Route<dynamic> route) => false);
          }
          else if (urlNew.contains("https://example.com/reauth")) {
            Fluttertoast.showToast(msg: "Redirecting..");
            Map<String, dynamic>? stripeAccountID = await createStripeAccount();
            var stripe = AutoGenerate.fromJson(stripeAccountID!);
            Get.to(WebViewCustom( stripeUrl: stripe.link.url,
              accountId: stripe.account.id,));
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => WebViewCustom( stripeUrl: stripe.link.url,accountId: stripe.account.id,),
            //   ),
            // );
          }


        },
      ),
    );
  }
  Future<Map<String, dynamic>>? createStripeAccount() async{

    final response = await http.get(
      Uri.parse(
          'https://us-central1-flutter-sync-8b6cb.cloudfunctions.net/app/account'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response.statusCode == 200 ? jsonDecode(response.body) : null;
  }

}

