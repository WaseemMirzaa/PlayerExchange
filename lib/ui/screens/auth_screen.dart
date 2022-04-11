import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/auth_screen_controller.dart';
import 'package:player_exchange/ui/screens/login_screen.dart';
import 'package:player_exchange/ui/screens/sign_up_screen.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthScreenController authScreenController = Get.put(AuthScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        child: InkWell(
          onTap: (){
            if (Get.isDarkMode)
              Get.changeThemeMode(ThemeMode.light);
            else
              Get.changeThemeMode(ThemeMode.dark);

            // var locale = Locale('ur','PK');
            // // var locale = Locale('en','US');
            // Get.updateLocale(locale);
          },
          child: Column(children: [
            Flexible(flex: 4, child:Center(child: Image.asset(AssetsString().AppLogo,width: 220.28.w,height: 80.44.h,))),
            Flexible(flex: 2,child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              FilledButton(onTap: (){
                Get.to(LoginScreen());
              },text: 'login'.tr,reverseColor: true,),
              Padding(
                padding:  EdgeInsets.all(15.0.h),
                child: Text('or',style: TextStyle(color: ColorManager.buttonBorderGreyColor,fontSize: StyleManager().largeFontSize),),
              ),
              FilledButton(onTap: (){
                Get.to(SignUpScreen());
              },text: 'create_an_account'.tr,),
            ],)),
          ],)


          ,
        ),
      ),
    );;
  }
}
