import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/theming/theme_model.dart';
import 'package:player_exchange/ui/screens/splash_screen.dart';
import 'package:player_exchange/utils/constants.dart';
import 'package:player_exchange/utils/local_strings.dart';

class PlayerExchange extends StatelessWidget {
  const PlayerExchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
    );
  }
}
