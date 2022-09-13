import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:player_exchange/utils/constants.dart';

import '../Networking/api_requests.dart';
import '../models/auth/user_model.dart';
import '../utils/session_manager.dart';

 AndroidNotificationChannel channel = const AndroidNotificationChannel(
     'high_importance_channel',
     'High Importance Notifications',
     'Android Notifications',
     importance: Importance.high,
     playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Working! :  ${message.messageId}');
}
class FirebaseCloudMessaging {

  static Future<void> initializeFirebaseMessaging() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Future<void> startNotificationService ({required String userId}) async {
      String? token = await FirebaseMessaging.instance.getToken();
      // await FirebaseFirestore.instance
      //         .collection(FirestoreCollections.users)
      //         .doc(userId)
      //         .update({'fcmToken': token});

      User? user = await SessionManager.getUserData();
      user!.fcmToken = token;
      //await APIRequests.doApi_updateUserProfile(user.id ?? "", user);

  }
  static Future<void> stopNotificationService ({required String userId}) async {
    // await FirebaseFirestore.instance
    //     .collection(FirestoreCollections.users)
    //     .doc(userId)
    //     .update({'fcmToken': ''});
    User? user = await SessionManager.getUserData();
    user!.fcmToken = "";
    await APIRequests.doApi_updateUserProfile(user.id ?? "", user);
  }

  static showNotification() async{
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                'Android Notifications',
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
  }

  static sendNotification(String title,String msg, String to) async {
    Map<String, dynamic> json =
    {
      "title": title,
      "msg": msg,
      "tokens": [to]
    };

    final response = await http.post(
      Uri.parse(
          'https://us-central1-flutter-sync-8b6cb.cloudfunctions.net/app/sendFCM'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(json),
    );
    response.statusCode == 200
        ? debugPrint("Notification sent successfully")
        : debugPrint("Notification sending failed");
  }

  static testNotification (){
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing ",
        "How you doing ?",
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                'Android Notifications',
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

}