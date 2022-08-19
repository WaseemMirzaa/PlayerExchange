import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/Networking/api.dart';
import 'package:player_exchange/controllers/login_screen_controller.dart';
import 'package:player_exchange/models/auth/error_response.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/auth/sign_in_request.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/screens/authentication/login_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/screens/authentication/sign_up_screen.dart';
import 'package:player_exchange/ui/widgets/circle-progress-bar.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/default_style_config.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/loading_indicator_dialog.dart';
import 'package:player_exchange/utils/session_manager.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);
  final email;
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController otpController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .33,
                  width: MediaQuery.of(context).size.width * .50,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SplashLogo(height: MediaQuery.of(context).size.height * .33,),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Image.asset(
                        AssetsString().AppLogo,
                        height: ScreenUtil().setHeight(
                            MediaQuery.of(context).size.height * .20),
                      ),

                      Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            fontWeight: FontWeight.w600,
                            color: ColorManager.greenColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Column(
                  children: [
                    //OTP
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: Theme(
                        data: DefaultStyleConfigs().textFieldTheme(),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.number,
                          // controller: signUpController.emailEditingController,
                          style: TextStyle(
                              color: ColorManager.greenColor,
                              fontSize: StyleManager().mediumFontSize),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorManager.greenColor),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(10),
                                  left: ScreenUtil().setWidth(10)),
                              child: Icon(
                                Icons.radar,
                                color: ColorManager.greenColor,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                                maxHeight: ScreenUtil().setHeight(23)),
                            labelText: 'OTP - 6 digit',
                            labelStyle: TextStyle(
                                color: ColorManager.greenColor,
                                fontSize: StyleManager().mediumFontSize),
                          ),
                          controller: otpController,
                          validator: (txt) {
                            if (otpController.text.isNum && otpController.text.length == 6)
                              return null;
                            else
                              return 'Enter Valid OTP';
                          },
                        ),


                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    //PASSWORD
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: Theme(
                        data: DefaultStyleConfigs().textFieldTheme(),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.visiblePassword,
                          // controller:
                          // signUpController.passwordEditingController,
                          obscureText: true,
                          style: TextStyle(
                              color: ColorManager.greenColor,
                              fontSize: StyleManager().mediumFontSize),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: ColorManager.greenColor),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(10),
                                  left: ScreenUtil().setWidth(10)),
                              child: Icon(
                                Icons.lock,
                                color: ColorManager.greenColor,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                                maxHeight: ScreenUtil().setHeight(23)),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: ColorManager.greenColor,
                                fontSize: StyleManager().mediumFontSize),
                          ),
                          controller: passwordController,
                          validator: (txt) {
                            if (passwordController.text.length > 6)
                              return null;
                            else
                              return 'Enter Valid Password. Minimum length is 6 digit';
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    //CONFIRM PASSWORD
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: Theme(
                        data: DefaultStyleConfigs().textFieldTheme(),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.visiblePassword,
                          // controller:
                          // signUpController.passwordEditingController,
                          obscureText: true,
                          style: TextStyle(
                              color: ColorManager.greenColor,
                              fontSize: StyleManager().mediumFontSize),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: ColorManager.greenColor),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(10),
                                  left: ScreenUtil().setWidth(10)),
                              child: Icon(
                                Icons.lock,
                                color: ColorManager.greenColor,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                                maxHeight: ScreenUtil().setHeight(23)),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: ColorManager.greenColor,
                                fontSize: StyleManager().mediumFontSize),
                          ),
                          controller: confirmPasswordController,
                          validator: (txt) {
                            // if (passwordController.text == confirmPasswordController.text)
                            //   return null;
                            // else
                            //   return 'Password Mismatch';
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: FilledButton(
                          text: "Reset",
                          onTap: () {
                            callForgotApi();
                          }),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  bool validate() {
    if (otpController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'OTP Required');
      return false;
    }
    if (otpController.text.length != 6) {
      Fluttertoast.showToast(msg: 'Invalid OTP');
      return false;
    }
    if (passwordController.text.length < 6){
      Fluttertoast.showToast(msg: 'Enter Valid Password. Minimum length is 6 digit');
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Fluttertoast.showToast(msg: 'Password Mismatch');
      return false;
    }


    return true;
  }

  void callForgotApi() async {
    if (validate()) {

      LoadingIndicatorDialog().show(context, text: "Updating Password...");

      bool isSuccess = await APIRequests.doApi_ResetPassword(widget.email, confirmPasswordController.text, otpController.text);

      LoadingIndicatorDialog().dismiss();

      if(isSuccess){
        Fluttertoast.showToast(msg: "Successfully updated");
        Get.offAll(LoginScreen());

      }

    }
  }
}
