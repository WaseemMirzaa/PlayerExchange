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
import 'package:player_exchange/ui/screens/authentication/reset_password_screen.dart';
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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();


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
                        "Forgot Password",
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: Theme(
                        data: DefaultStyleConfigs().textFieldTheme(),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.emailAddress,
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
                                Icons.email_outlined,
                                color: ColorManager.greenColor,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                                maxHeight: ScreenUtil().setHeight(23)),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: ColorManager.greenColor,
                                fontSize: StyleManager().mediumFontSize),
                          ),
                          controller: emailController,
                          validator: (txt) {
                            // if (EmailValidator.validate(
                            //     signUpController.emailEditingController.text))
                            //   return null;
                            // else
                            return 'Enter Valid Email';
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(30)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: FilledButton(
                          text: "Send Otp",
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
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Email Required');

      return false;
    }

    if (!emailController.text.isEmail) {
      Fluttertoast.showToast(msg: 'Invalid Email');

      return false;
    }

    return true;
  }

  void callForgotApi() async {
    if (validate()) {

      LoadingIndicatorDialog().show(context, text: "Sending Email...");

      bool isSuccess = await APIRequests.doApi_ForgotPassword_SendEmail(emailController.text.trim());

      LoadingIndicatorDialog().dismiss();

      if(isSuccess)
        Get.to(ResetPasswordScreen(email: emailController.text.trim(),));

    }
  }
}
