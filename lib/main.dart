import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:player_exchange/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

FirebaseFirestore fireStore = FirebaseFirestore.instance;
 late final SharedPreferences prefs;
final FirebaseStorage firebaseStorage = FirebaseStorage.instance;


Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  prefs = await SharedPreferences.getInstance();
  runApp(const PlayerExchange());

}


