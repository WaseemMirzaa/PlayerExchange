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
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/widgets/default_style_config.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/session_manager.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  LoginScreenController loginScreenController = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
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
                        "Sign In",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
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
                    SizedBox(height: ScreenUtil().setHeight(10)),
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
                            // if (signUpController
                            //     .passwordEditingController.text.length >
                            //     5)
                            //   return null;
                            // else
                            //   return 'Enter Valid Password';
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(20)),
                        child: TextButton(
                          child: Text(
                            'Forget password',
                            style: TextStyle(
                                fontSize: StyleManager().smallFontSize,
                                color: ColorManager.greenColor),
                          ),
                          onPressed: () {
                            // Get.to(ForgetPassword());
                            // *//*Get.to(ForgotPassword(),
                            // transition: languageService.isLtrOrRtl == TextDirection.ltr ? Transition.rightToLeft : Transition.leftToRight);*//*
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: FilledButton(
                          text: "Sign In",
                          onTap: () {
                            callSignInApi();
                          }),
                    )
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

    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Password Required');

      return false;
    }
    return true;
  }

  void callSignInApi() async {
    if (validate()) {
      SignInRequest signInRequest = SignInRequest();
      signInRequest.email = emailController.text;
      signInRequest.password = passwordController.text;
      signInRequest.fcmToken = '';

      ProgressDialog pd = ProgressDialog(context: context);
      pd.show(max: 100, msg: 'Loading');

      var dio = Dio();
      try {
        final response = await dio.post(Api.baseURL + 'user/login',
            data: signInRequest.toJson(),
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }));

        pd.close();

        print ("login response: " + response.toString());
        if (response.data != null) {
          UserModel userResponse = UserModel.fromJson(response.data);
          //  if(userResponse.user == null){
          //    Fluttertoast.showToast(msg: Api.apiErrorResponse);

          //   return;
          // }

          if (userResponse.message != null &&
              userResponse.message == 'Successfully logged in') {

            if(userResponse.user != null) {
              SessionManager.setUserData(userResponse.user!);
            }
            TabsScreen.currentIndex = 0;

            Get.off(() => TabsScreen(
                  selectedIndex: TabsScreen.currentIndex,
                ));
          } else {
            if (userResponse.message == null) {
              Fluttertoast.showToast(msg: Api.apiErrorResponse);
            } else {
              Fluttertoast.showToast(msg: userResponse.message.toString());
            }
          }
        }
      } on DioError catch (e) {
        pd.close();

        if (e.response != null) {
          print('has response');

          AuthErrorResponse resp = AuthErrorResponse.fromJson(e.response!.data);

          print('has error ${resp.toString()}');

          Fluttertoast.showToast(
              msg: resp.error?.message ?? "Invalid Credentials");
        } else {
          Fluttertoast.showToast(msg: e.response.toString());
        }
      }
    }
  }
}
