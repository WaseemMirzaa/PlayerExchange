import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:player_exchange/api/response/create_cutomer/CreatePaymentIntentResponse.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/utils/session_manager.dart';

class StripePayment {
  static final String primaryKey = 'pk_test_51KehMQGOzjebkLdAlkU4aJTvqoPkBfexDTDNjlzIiSdAFlXdbytudxQiZPUI0NbXChO3KHOuV1me1BhtWNcgoXRm000Rw07IIS';

  Map<String, dynamic>? paymentIntentData;
  BuildContext context;
  late CreatePaymentIntentResponse intentData;

  StripePayment(this.context);
  void initialize() {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      Stripe.publishableKey = primaryKey;
    } catch (e) {
      print("Exception" + e.toString());
    }
  }

  Future<bool> makePayment(String amountUSD) async {
    bool isSuccess = false;
    // LoadingIndicatorDialog().show(context);
    User? user = await SessionManager.getUserData();
    try {
      String amountCents = convertUsdToCent(amountUSD);
      paymentIntentData = await getPaymentResponse(amountCents, user?.stripeCustomerId ?? "");
      if (paymentIntentData == null) {
        Navigator.of(context).pop();
        Fluttertoast.showToast(msg: 'Unable to make payment please try again!');
        isSuccess = false;
      }
      intentData = CreatePaymentIntentResponse.fromJson(paymentIntentData!);
      // print(user.customer.toString() + "<>" + user.status.toString());

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: intentData.data!.clientSecret!,
                  applePay: true,
                  googlePay: true,
                  customerId: user!.stripeCustomerId ?? "",
                  testEnv: true,
                  style: ThemeMode.dark,
                  merchantCountryCode: 'US',
                  merchantDisplayName: 'ANNIE'))
          .then((value)  async {
        isSuccess = await displayPaymentSheet();
      });

      ///now finally display payment sheeet
    } catch (e, s) {
      print('exception:$e$s');
    }

    // LoadingIndicatorDialog().dismiss();
    return isSuccess;
  }

  Future<bool> displayPaymentSheet() async {
    bool isSuccess = false;
    try {
      await Stripe.instance
          .presentPaymentSheet(
              parameters: PresentPaymentSheetParameters(
        clientSecret: intentData.data?.clientSecret ?? "",
        confirmPayment: true,
      ))
          .then((newValue) {
        // print('payment intent' + paymentIntentData!['id'].toString());
        // print('payment intent' + paymentIntentData!['data'].paymentIntentData!['clientSecret'].toString());
        // print('payment intent' +
        //     paymentIntentData!['data'].paymentIntentData!['paymentIntent'].paymentIntentData!['amount'].toString());
        // print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Paid Successfully")));

        paymentIntentData = null;

        isSuccess = true;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }

    return isSuccess;
  }

  //Convert Usd to Cents
  convertUsdToCent(String amount) {
    final a = ((double.parse(amount)) * 100).toInt();
    return a.toString();
  }

  //Amount is in Cents
  Future<Map<String, dynamic>>? getPaymentResponse(
      String amountCents, String stripeCustomerId) async {
    Map<String, dynamic> json = {"amount": amountCents, "customer_id": stripeCustomerId};

    final response = await http.Client().post(
      Uri.parse(
          'https://us-central1-flutter-sync-8b6cb.cloudfunctions.net/app/createPaymentIntent'),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(json),
    );
    return response.statusCode == 200 ? jsonDecode(response.body) : null;
  }
}
