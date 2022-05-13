// import 'dart:convert';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
//
// class StripePayment extends StatefulWidget {
//   const StripePayment({Key? key}) : super(key: key);
//
//   @override
//   _StripePaymentState createState() => _StripePaymentState();
// }
//
// class _StripePaymentState extends State<StripePayment> {
//   Map<String, dynamic>? paymentIntentData;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stripe Payment'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () async {
//               await makePayment();
//             },
//             child: Center(
//               child: Container(
//                 height: 50,
//                 width: 100,
//                 decoration: const BoxDecoration(color: Colors.green),
//                 child: const Center(
//                   child: Text('pay'),
//                 ),
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () async {
//               initialize();
//             },
//             child: Center(
//               child: Container(
//                 height: 50,
//                 width: 100,
//                 decoration: const BoxDecoration(color: Colors.green),
//                 child: const Center(
//                   child: Text('Initialize'),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> makePayment() async {
//     try {
//       paymentIntentData = await createPaymentIntent('20', 'USD');
//       await Stripe.instance
//           .initPaymentSheet(
//               paymentSheetParameters: SetupPaymentSheetParameters(
//                   paymentIntentClientSecret:
//                       paymentIntentData!['client_secret'],
//                   applePay: true,
//                   googlePay: true,
//                   testEnv: true,
//                   style: ThemeMode.dark,
//                   merchantCountryCode: 'US',
//                   merchantDisplayName: 'ANNIE'))
//           .then((value) {});
//
//       ///now finally display payment sheeet
//       displayPaymentSheet();
//     } catch (e, s) {
//       print('exception:$e$s');
//     }
//   }
//
//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance
//           .presentPaymentSheet(
//               parameters: PresentPaymentSheetParameters(
//         clientSecret: paymentIntentData!['client_secret'],
//         confirmPayment: true,
//       ))
//           .then((newValue) {
//         print('payment intent' + paymentIntentData!['id'].toString());
//         print(
//             'payment intent' + paymentIntentData!['client_secret'].toString());
//         print('payment intent' + paymentIntentData!['amount'].toString());
//         print('payment intent' + paymentIntentData.toString());
//         //orderPlaceApi(paymentIntentData!['id'].toString());
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("paid successfully")));
//
//         paymentIntentData = null;
//       }).onError((error, stackTrace) {
//         print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//       });
//     } on StripeException catch (e) {
//       print('Exception/DISPLAYPAYMENTSHEET==> $e');
//       showDialog(
//           context: context,
//           builder: (_) => const AlertDialog(
//                 content: Text("Cancelled "),
//               ));
//     } catch (e) {
//       print('$e');
//     }
//   }
//
//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100;
//     return a.toString();
//   }
//
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount('20'),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       //print(body);
//       var response = await http.post(
//           Uri.parse('https://api.stripe.com/v1/payment_intents'),
//           body: body,
//           headers: {
//             'Authorization':
//                 'Bearer sk_test_51KehMQGOzjebkLdA7ZC6SE0x3FNIqLzMpyi4Hd6tW4jxXssjzfxnHpUkKWYCRVpJfrQuye66A5X5sXbbAq2zUnWn00Fa8eYbEN',
//             'Content-Type': 'application/x-www-form-urlencoded'
//           });
//       print('Create Intent reponse ===> ${response.body.toString()}');
//       return jsonDecode(response.body);
//     } catch (err) {
//       print('err charging user: ${err.toString()}');
//     }
//   }
//
//   void initialize() {
//     try {
//       WidgetsFlutterBinding.ensureInitialized();
//       Stripe.publishableKey =
//           'pk_test_51KehMQGOzjebkLdAlkU4aJTvqoPkBfexDTDNjlzIiSdAFlXdbytudxQiZPUI0NbXChO3KHOuV1me1BhtWNcgoXRm000Rw07IIS';
//     } catch (e) {
//       print("Exception" + e.toString());
//     }
//   }
// }
