import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/stripe/response/create_customer/CreatePaymentIntentResponse.dart';
import 'package:player_exchange/utils/session_manager.dart';

class StripePayment {
  //Renovision Test key
  // static final String primaryKey = 'pk_test_51KehMQGOzjebkLdAlkU4aJTvqoPkBfexDTDNjlzIiSdAFlXdbytudxQiZPUI0NbXChO3KHOuV1me1BhtWNcgoXRm000Rw07IIS';
  //Player Exchange TEST KEY
  static final String primaryKey = 'pk_test_51LD9YUF4ui5DHbUROFlf0BZnjORIhXcXoCUbmpYLOMkz0Cg8oUSS2RZpUVakikIvskQPRAFZ843tNcsQbqo9DaaS00YegsG5r7';



  static final String merchantName = "JayHawk";
  static final String merchantCountry = "US";
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
                  merchantCountryCode: merchantCountry,
                  merchantDisplayName: merchantName))
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
  static convertUsdToCent(String amount) {
    final a = ((double.parse(amount)) * 100).toInt();
    return a.toString();
  }

  //Amount is in Cents
  Future<Map<String, dynamic>>? getPaymentResponse(
      String amountCents, String stripeCustomerId) async {
    Map<String, dynamic> json = {"amount": amountCents, "customer_id": stripeCustomerId};

    final response = await http.Client().post(
      Uri.parse(
          "https://us-central1-player-exchange-ad78f.cloudfunctions.net/app/createPaymentIntent"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(json),
    );
    debugPrint("response code >> "+response.statusCode.toString());
    return response.statusCode == 200 ? jsonDecode(response.body) : null;
  }





  // Do it on Sign Up, create this customer and save it's id while sign up
  //Example
  //Map<String, dynamic>? customerResponse = await getCustomerResponse();
  //     if(customerResponse == null) {
  //       Fluttertoast.showToast(msg: 'Unable to signup please try again!');
  //       return;
  //     }
  //     var respUser = CreateCustomerResponse.fromJson(customerResponse);
  //      customerStripeId: respUser.customer,

  Future<Map<String, dynamic>>? getCustomerResponse(String email) async {
    Map<String, dynamic> json = {"email": email};

    final response = await http.post(
      Uri.parse(
          'https://us-central1-player-exchange-ad78f.cloudfunctions.net/app/create_customer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(json),
    );
    return response.statusCode == 200
        ? jsonDecode(response.body)
        : null;
  }

  // CASHOUT in BANK
  //Example:      payoutOrder(stripeId, dollarToCents(double.parse(budget)));
  Future<bool> payoutOrder(String stripId, String amount) async {
    bool isSuccess = false;

    Map<String, dynamic> json =
    {
      "stripe_account_id": stripId,
      "amount": amount,
    };

    final response = await http.post(
      Uri.parse(
          'https://us-central1-player-exchange-ad78f.cloudfunctions.net/app/payout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(json),
    );

    if(response.statusCode == 200){

      debugPrint(response.statusCode.toString() + response.body.toString()  + "<Error>");
      isSuccess = true;
      debugPrint("Operation Successful");
    } else{

      debugPrint(response.statusCode.toString() + response.body.toString()  + "<Error>" + json.toString());
      isSuccess = false;
      debugPrint("Operation failed");
    }
    return isSuccess;

  }

  //REFUND
  //Example
  //     Map<String, dynamic>? paymentIntent = getPaymentResponse(dollarToCents(double.parse(budget)), stripeId) as Map<String, dynamic>?;
  //     refundOrder(paymentIntent, dollarToCents(double.parse(budget)));
  refundOrder(Map<String, dynamic>? paymentIntent, String amount) async {
    Map<String, dynamic> json =
    {
      "payment_intent": paymentIntent,
      "amount": amount,
    };

    final response = await http.post(
      Uri.parse(
          'https://us-central1-player-exchange-ad78f.cloudfunctions.net/app/refund'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(json),
    );
    response.statusCode == 200
        ? debugPrint("Operation Successful")
        : debugPrint("Operation failed");
  }


  //Example
  //        Map<String, dynamic>? stripeAccountID = await createStripeAccount();
  //         var stripe = AutoGenerate.fromJson(stripeAccountID!);

  //WebViewCustom(
  //               stripeUrl: stripe.link.url,
  //               accountId: stripe.account.id,
  //             ),
  Future<Map<String, dynamic>?> createStripeAccount() async {
    final response = await http.get(
      Uri.parse(
          'https://us-central1-player-exchange-ad78f.cloudfunctions.net/app/account'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
    );
    if(response.statusCode == 200 || response.statusCode == 201){
      return jsonDecode(response.body);
    }else{
      Fluttertoast.showToast(msg: "Unable to create Account, please contact with Admin");
      return null;
    }
    // return response.statusCode == 200 ? jsonDecode(response.body) : null;
  }

}
