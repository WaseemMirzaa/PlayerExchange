import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/theming/theme_model.dart';
import 'package:player_exchange/ui/screens/splash_screen.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:player_exchange/utils/local_strings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat/chat_provider.dart';
import 'main.dart';

class PlayerExchange extends StatelessWidget {
  const PlayerExchange({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ChatProvider>(
            create: (_) => ChatProvider(
                prefs: prefs,
                firebaseStorage: firebaseStorage,
                firebaseFirestore: fireStore))
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: Get
        //     .put(ThemeModel())
        //     .currentTheme
        //     .value,
        title: 'Player Exchnage',
        theme: ThemeModel.light,
        darkTheme: ThemeModel.dark,
        navigatorKey: Constants().navigatorKey,
        scaffoldMessengerKey: Constants().scaffoldMessengerKey,
        translations: LocaleString(),
        locale: Locale('en', 'US'),
        home: SplashScreen(),
      ),
    );
  }
}
