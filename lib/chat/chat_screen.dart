// // ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
//
// import 'dart:convert';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
//
// import 'package:http/http.dart' as http;
//
// import '../../../../main.dart';
// import 'firebase_cloud_messaging.dart';
//
// class ClientChatMessageScreen extends StatefulWidget {
//   ClientChatMessageScreen(
//       this.chatId,
//       this.makeRequest,
//
//       this.otherUserId,
//       this.offerStatus, {
//         Key? key,
//       }) : super(key: key);
//
//   MakeRequest? makeRequest;
//   String? offerStatus;
//
//   String? chatId;
//   String otherUserId;
//
//   @override
//   State<StatefulWidget> createState() {
//     return _ClientChatMessageScreenState();
//   }
// }
//
// class _ClientChatMessageScreenState extends State<ClientChatMessageScreen> {
//   TextEditingController msgController = TextEditingController();
//   ScrollController _controller = new ScrollController();
//   Map<String, dynamic>? paymentIntentData;
//
//   String? chatId;
//   String? paymentPercentage;
//
//
//   @override
//   void initState() {
//     super.initState();
//
//
//     // stripePayment = StripePayment(context);
//     // stripePayment.initialize();
//     WidgetsFlutterBinding.ensureInitialized();
//     Stripe.publishableKey =
//         StripeKey;
//
//     setState(() {
//       String myId = FirebaseAuth.instance.currentUser?.uid ?? "";
//
//       if (widget.chatId == null) {
//         if (myId.compareTo(widget.otherUserId) > 0) {
//           chatId = myId + "-" + widget.otherUserId;
//         } else {
//           chatId = widget.otherUserId + "-" + myId;
//         }
//       } else {
//         chatId = widget.chatId;
//       }
//
//       _chatsStream = FirebaseFirestore.instance
//           .collection('chats')
//           .doc(chatId)
//           .collection('conversations')
//           .snapshots();
//
//       offerSent = false;
//     });
//   }
//
//
//
//
//
//   Stream<QuerySnapshot<Map<String, dynamic>>>? _chatsStream;
//   String? stripeCustomerId;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: normalBgColor,
//       appBar: AppBar(
//         backgroundColor: redBtn,
//         title: Text('Chat'),
//         actions: const [
//           // action button
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           if (_chatsStream != null)
//             StreamBuilder<QuerySnapshot>(
//                 stream: _chatsStream!,
//                 builder: (
//                     context,
//                     AsyncSnapshot<QuerySnapshot> snapshot,
//                     ) {
//                   if (snapshot.hasData) {
//                     List<ChatModel> messages = [];
//
//                     List ids = [];
//
//                     for (var doc in snapshot.data!.docs) {
//                       ChatModel message = ChatModel.fromJson(
//                           doc.data() as Map<String, dynamic>);
//                       message.id = doc.id;
//                       messages.add(message);
//                     }
//
//                     messages.sort((a, b) => a.timeStamp.compareTo(b.timeStamp));
//
//                     messages = messages.reversed.toList();
//
//                     return Padding(
//                       padding: EdgeInsets.only(bottom: 60),
//                       child: ListView.builder(
//                         controller: _controller,
//                         itemCount: messages.length,
//                         reverse: true,
//                         // shrinkWrap: true,
//                         padding: EdgeInsets.only(top: 10, bottom: 10),
//                         // physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           ChatModel message = messages[index];
//
//                           String content = message.messageContent;
//                           if (message.reference != null) {
//                             String id = message.reference!.id!;
//                             String budget = message.reference!.budget;
//                             String rooms = message.reference!.roomName;
//                             String jobName = message.reference!.jobName;
//                             String dimensions = message.reference!.dimentions;
//                             String description = message.reference!.description;
//                             String dates = message.reference!.dates.toString();
//
//                             if (message.reference!.status != null) {
//                               content =
//                               'Request ID: $id\n Name: ${jobName} \nRooms Name: $rooms\nBudget: $budget USD\nDimensions: $dimensions\nDescription: $description\nSchedule: $dates';
//                             } else {
//                               content =
//                               'Request ID: $id\n Name: ${jobName} \nRooms Name: $rooms\nBudget: $budget USD\nDimensions: $dimensions\nDescription: $description\nSchedule: $dates';
//                             }
//                           }
//
//                           if (message.reference != null &&
//                               message.reference?.status != null &&
//                               message.reference?.status == "posted") {
//                             return Container(
//                               padding: EdgeInsets.only(
//                                   left: 14, right: 14, top: 10, bottom: 10),
//                               child: Stack(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: (messages[index].receiverId ==
//                                         FirebaseAuth
//                                             .instance.currentUser?.uid
//                                         ? Alignment.topLeft
//                                         : Alignment.topRight),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: (messages[index].receiverId ==
//                                             FirebaseAuth
//                                                 .instance.currentUser?.uid
//                                             ? Colors.grey.shade300
//                                             : Colors.blue[200]),
//                                       ),
//                                       padding:
//                                       EdgeInsets.fromLTRB(16, 16, 16, 70),
//                                       child: Text(
//                                         content,
//                                         style: TextStyle(fontSize: 15),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     bottom: 10,
//                                     right: 10,
//                                     width: 80,
//                                     height: 50,
//                                     child: Container(
//                                       child: ActionButtonFullWidth(
//                                         btnHeight: 40,
//                                         borderColor: yellowBtn,
//                                         name: 'Accept',
//                                         bgColor: yellowBtn,
//                                         press: () async {
//                                           var collection = FirebaseFirestore
//                                               .instance
//                                               .collection('users');
//                                           var docSnapshot = await collection
//                                               .doc(FirebaseAuth
//                                               .instance.currentUser!.uid)
//                                               .get();
//                                           if (docSnapshot.exists) {
//                                             Map<String, dynamic>? data =
//                                             docSnapshot.data();
//                                             setState(() {
//                                               stripeCustomerId = data?[
//                                               'customerStripeId']; // <-- The value you want to retrieve.
//                                             });
//                                             // Call setState if needed.
//                                             // debugPrint(stripeCustomerId);
//
//                                             makePayment(
//                                                 message.reference!.budget,
//                                                 message);
//                                           }
//
//                                           // updateMessage(message);
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           } else if (message.reference?.status == "accepted") {
//                             return Container(
//                               padding: EdgeInsets.only(
//                                   left: 14, right: 14, top: 10, bottom: 10),
//                               child: Stack(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: (messages[index].receiverId ==
//                                         FirebaseAuth
//                                             .instance.currentUser?.uid
//                                         ? Alignment.topLeft
//                                         : Alignment.topRight),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: (messages[index].receiverId ==
//                                             FirebaseAuth
//                                                 .instance.currentUser?.uid
//                                             ? Colors.grey.shade300
//                                             : Colors.blue[200]),
//                                       ),
//                                       padding:
//                                       EdgeInsets.fromLTRB(16, 16, 16, 70),
//                                       child: Text(
//                                         content,
//                                         style: TextStyle(fontSize: 15),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     bottom: 10,
//                                     right: 10,
//                                     width: 80,
//                                     height: 50,
//                                     child: Container(
//                                       padding: const EdgeInsets.all(5),
//                                       height: 60,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           border: Border.all(
//                                               color: Colors.green,
//                                               width: 1,
//                                               style: BorderStyle.solid)),
//                                       child: Center(
//                                         child: Text(
//                                           "Accepted",
//                                           style: TextStyle(
//                                               color: Colors.green,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           } else {
//                             return Container(
//                               padding: EdgeInsets.only(
//                                   left: 14, right: 14, top: 10, bottom: 10),
//                               child: Stack(
//                                 children: <Widget>[
//                                   Align(
//                                     alignment: (messages[index].receiverId ==
//                                         FirebaseAuth
//                                             .instance.currentUser?.uid
//                                         ? Alignment.topLeft
//                                         : Alignment.topRight),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(20),
//                                         color: (messages[index].receiverId ==
//                                             FirebaseAuth
//                                                 .instance.currentUser?.uid
//                                             ? Colors.grey.shade400
//                                             : Colors.blue[200]),
//                                       ),
//                                       padding: EdgeInsets.all(16),
//                                       child: Text(
//                                         content,
//                                         style: TextStyle(fontSize: 15),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                     );
//                   } else {
//                     return Container();
//                   }
//                 }),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Container(
//               padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
//               height: 60,
//               width: double.infinity,
//               color: Colors.white,
//               child: Row(
//                 children: <Widget>[
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Expanded(
//                     child: TextField(
//                       controller: msgController,
//                       decoration: InputDecoration(
//                           hintText: "Write message...",
//                           hintStyle: TextStyle(color: Colors.black54),
//                           border: InputBorder.none),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       sendMessage();
//                     },
//                     child: Icon(
//                       Icons.send,
//                       color: Colors.white,
//                       size: 18,
//                     ),
//                     backgroundColor: yellowBtn,
//                     elevation: 0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<String?> getFcmToken(String uid) async {
//     String? fcmId;
//     var collection = FirebaseFirestore.instance.collection('users');
//     var docSnapshot = await collection.doc(uid).get();
//     if (docSnapshot.exists) {
//       Map<String, dynamic>? data = docSnapshot.data();
//       var value = data?['fcmToken'];
//       fcmId = value != "" ? value : "";
//     }
//     return fcmId;
//   }
//
//   Future<String?> getUserName(String uid) async {
//     String? name;
//     var collection = FirebaseFirestore.instance.collection('users');
//     var docSnapshot = await collection.doc(uid).get();
//     if (docSnapshot.exists) {
//       Map<String, dynamic>? data = docSnapshot.data();
//       var value = data?['firstName'];
//       name = value != "" ? value : "";
//     }
//     return name;
//   }
//
//   bool offerSent = false;
//
//   Future<void> sendMessage() async {
//     if (validate()) {
//       msg = msgController.text;
//
//       msgController.clear();
//       String? receiverFcmToken =
//       await getFcmToken(widget.otherUserId) as String;
//       //TODO firebaseAuth is missing
//       // String? userName =
//       // await getUserName(FirebaseAuth.instance.currentUser!.uid) as String;
//
//       if (offerSent || (widget.makeRequest == null && widget.bidData == null)) {
//         sendTextMessage();
//         FirebaseCloudMessaging.sendNotification(
//             "New Message",
//             "You have Received a new message from " + userName,
//             receiverFcmToken);
//       } else {
//         DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
//             .instance
//             .collection('chats')
//             .doc(chatId)
//             .collection('refrences')
//             .doc(widget.makeRequest!.id)
//             .get();
//
//         if (doc != null &&
//             doc.exists &&
//             doc.data() != null &&
//             doc.data()!.keys.isNotEmpty) {
//           await sendTextMessage();
//           FirebaseCloudMessaging.sendNotification("New Message",
//               "You have Received a new message.", receiverFcmToken);
//         } else {
//           await FirebaseFirestore.instance
//               .collection('chats')
//               .doc(chatId)
//               .collection('refrences')
//               .doc(widget.makeRequest!.id)
//               .set(widget.makeRequest!.toJson());
//
//           Map<String, dynamic> message = <String, dynamic>{
//             'senderId': FirebaseAuth.instance.currentUser?.uid ?? '',
//             'receiverId': widget.otherUserId,
//             'messageContent': ' ',
//             'timeStamp': DateTime.now().millisecondsSinceEpoch,
//             'reference': widget.makeRequest!.toJson()
//           };
//           await FirebaseFirestore.instance
//               .collection('chats')
//               .doc(chatId)
//               .collection('conversations')
//               .add(message);
//           sendTextMessage();
//           FirebaseCloudMessaging.sendNotification("New Message",
//               "You have Received a new message.", receiverFcmToken);
//         }
//       }
//     }
//   }
//
//   bool validate() {
//     if (msgController.text.isEmpty) return false;
//
//     return true;
//   }
//
//   Future<void> sendTextMessage() async {
//     //  setState(() {
//     offerSent = true;
//     // });
//     Map<String, dynamic> message = <String, dynamic>{
//       'senderId': FirebaseAuth.instance.currentUser?.uid ?? '',
//       'receiverId': widget.otherUserId,
//       'messageContent': msg,
//       'timeStamp': DateTime.now().millisecondsSinceEpoch,
//     };
//
//     await FirebaseFirestore.instance
//         .collection('chats')
//         .doc(chatId)
//         .collection('conversations')
//         .add(message);
//
//     Map<String, dynamic> participants = <String, dynamic>{
//       FirebaseAuth.instance.currentUser?.uid ?? '': true,
//       widget.otherUserId: true,
//     };
//
//     Map<String, dynamic> map = <String, dynamic>{
//       'participants': participants,
//       'lastMessage': message
//     };
//
//     await FirebaseFirestore.instance.collection('chats').doc(chatId).set(map);
//   }
//
//   String msg = "";
//
//   void updateMessage(ChatModel message) async {
//     print('ID ${message.id}');
//     print('ID Ref ${message.reference!.id}');
//
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return ProgressDialouge(message: 'Accepting Offer');
//         });
//     message.reference!.status = 'accepted';
//
//     FirebaseFirestore.instance
//         .collection("offers")
//         .doc(message.reference!.id)
//         .update({'status': 'accepted'}).then((_) {
//       FirebaseFirestore.instance
//           .collection('chats')
//           .doc(widget.chatId)
//           .collection('conversations')
//           .doc(message.id)
//           .update({'reference': message.reference!.toJson()}).then((value) {
//         FirebaseFirestore.instance
//             .collection('client_request')
//             .doc(message.reference!.id)
//             .delete()
//             .then((value) {
//           Navigator.of(context).pop();
//         });
//       });
//     });
//   }
//   void getPaymentPercentage() async {
//     var collection = FirebaseFirestore.instance.collection('settings');
//     var docSnapshot =
//     await collection.doc("rufAeF8aSgBVfVaSgQvX").get();
//     if (docSnapshot.exists) {
//       Map<String, dynamic>? data = docSnapshot.data();
//       var value = data?['payment_percentage']; //
//       paymentPercentage = value != "" ? value : ""; // in case of internet unavailability
//     }
//   }
//
//   Future<void> makePayment(String amount, ChatModel message) async {
//     try {
//       amount = '${amount}00'; // dollar to cents
//       paymentIntentData = await getPaymentResponse(amount);
//       if (paymentIntentData == null) {
//         Navigator.of(context).pop();
//         Fluttertoast.showToast(msg: 'Unable to make payment please try again!');
//         return;
//       }
//       var intentData = CreatePaymentIntentResponse.fromJson(paymentIntentData!);
//
//       await Stripe.instance
//           .initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: intentData.data!.clientSecret!,
//             applePay: false,
//             googlePay: false,
//             customerId: stripeCustomerId,
//             testEnv: false,
//             merchantCountryCode: "US",
//             merchantDisplayName: "User",
//             style: ThemeMode.dark,
//           ))
//           .then((value) {
//         displayPaymentSheet(message, intentData.data!.clientSecret);
//       });
//
//       ///now finally display payment sheeet
//     } catch (e, s) {
//       print('exception:$e$s');
//     }
//   }
//
//   displayPaymentSheet(ChatModel message, String? clientSecretKey) async {
//     try {
//       await Stripe.instance
//           .presentPaymentSheet(
//           parameters: PresentPaymentSheetParameters(
//             clientSecret: clientSecretKey!,
//             confirmPayment: true,
//           ))
//           .then((newValue) {
//         updateMessage(message);
//
//         debugPrint('payment intent' + paymentIntentData!['id'].toString());
//         debugPrint(
//             'payment intent' + paymentIntentData!['client_secret'].toString());
//         debugPrint('payment intent' + paymentIntentData!['amount'].toString());
//         debugPrint('payment intent' + paymentIntentData.toString());
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Paid successfully!")));
//
//         debugPrint("Other Id: "+widget.otherUserId  +" Sender Id: " + message.senderId + " Receiver Id: "+ message.receiverId);
//         String? receiverFcmToken = getFcmToken(widget.otherUserId) as String;
//         FirebaseCloudMessaging.sendNotification(
//             "Offer Accepted", "Offer Accepted", receiverFcmToken);
//         paymentIntentData = null;
//       }).onError((error, stackTrace) {
//         debugPrint('Exception/DISPLAY PAYMENT SHEET==> $error $stackTrace');
//       });
//     } on StripeException catch (e) {
//       debugPrint('Exception/DISPLAY PAYMENT SHEET==> $e');
//       showDialog(
//           context: context,
//           builder: (_) => const AlertDialog(
//             content: Text("Cancelled "),
//           ));
//     } catch (e) {
//       debugPrint('$e');
//     }
//   }
//
//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100;
//     return a.toString();
//   }
//
//   Future<Map<String, dynamic>>? getPaymentResponse(String amount) async {
//     Map<String, dynamic> json = {
//       "amount": amount,
//       "customer_id": stripeCustomerId
//     };
//
//     final response = await http.post(
//       Uri.parse(
//           'https://us-central1-flutter-sync-8b6cb.cloudfunctions.net/app/createPaymentIntent'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(json),
//     );
//     return response.statusCode == 200 ? jsonDecode(response.body) : "";
//   }
// }
