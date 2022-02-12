import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:player_exchange/theming/theme_model.dart';
import 'package:player_exchange/ui/screens/auth_screen.dart';
import 'package:player_exchange/ui/screens/cash_offer_screen.dart';
import 'package:player_exchange/ui/screens/cash_screen.dart';
import 'package:player_exchange/ui/screens/current_public_offering_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/exchnage_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/home_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/profile_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/screens/login_screen.dart';
import 'package:player_exchange/ui/screens/roster_screen.dart';
import 'package:player_exchange/ui/screens/sign_up_screen.dart';
import 'package:player_exchange/ui/screens/trader_detail_screen.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 3),
    //         () => Get.offAll(AuthScreen()));

    Timer(Duration(seconds: 3), () => Get.offAll(AuthScreen()));

    // Timer(
    //     Duration(seconds: 3),
    //         () => Get.offAll(CashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: InkWell(
          onTap: () {
            // if (Get.isDarkMode)
            //   Get.changeThemeMode(ThemeMode.light);
            // else
            Get.changeThemeMode(ThemeMode.dark);

            // var locale = Locale('ur','PK');
            // // var locale = Locale('en','US');
            // Get.updateLocale(locale);
          },
          child: Center(
            child: Image.asset(
              AssetsString().AppLogo,
              width: 220.28.w,
              height: 80.44.h,
            ),
          ),
        ),
      ),
    );
  }
}
