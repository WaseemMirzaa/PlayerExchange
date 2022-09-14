import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:player_exchange/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/app_drawer_controller.dart';
import 'controllers/graph_controller.dart';
import 'firebase_options.dart';

FirebaseFirestore fireStore = FirebaseFirestore.instance;
 late final SharedPreferences prefs;
final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
GraphController graphController = Get.put(GraphController());
AppDrawerController appDrawerController = Get.put(AppDrawerController(), permanent: true);


Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print(" --- foreground message received ---");
    print(remoteMessage.notification!.title);
    print(remoteMessage.notification!.body);
  });

  prefs = await SharedPreferences.getInstance();
  appDrawerController.getUserData();
  runApp(const PlayerExchange());

  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print(" --- foreground message received ---");
    print(remoteMessage.notification!.title);
    print(remoteMessage.notification!.body);
  });

}

/// Top level function to handle incoming messages when the app is in the background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(" --- background message received ---");
  print(message.notification!.title);
  print(message.notification!.body);
}



