import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/Networking/api.dart';
import 'package:player_exchange/models/auth/error_response.dart';
import 'package:player_exchange/models/auth/sign_up_request.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/stripe/response/create_customer/CreateCustomerReponse.dart';
import 'package:player_exchange/stripe/stripe_payment.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/default_style_config.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/loading_indicator_dialog.dart';
import 'package:player_exchange/utils/session_manager.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

import 'login_screen.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  bool checBox = false;

  @override
  void initState() {
    
  } // controller
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
                        "Sign Up",
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
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: ScreenUtil().setWidth(25)),
                    //   child: Theme(
                    //     data: DefaultStyleConfigs().textFieldTheme(),
                    //     child: TextFormField(
                    //       onChanged: (value) {
                    //         setState(() {});
                    //       },
                    //       keyboardType: TextInputType.emailAddress,
                    //       controller: loginController.nameEditingController,
                    //       style: TextStyle(
                    //           color: AppColors.greenColor,
                    //           fontSize: SizeConfigs().subHeadingTextSize()),
                    //       decoration: InputDecoration(
                    //         focusedBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: AppColors.greenColor),
                    //         ),
                    //         prefixIcon: Padding(
                    //           padding: EdgeInsets.only(
                    //               right: ScreenUtil().setWidth(10),
                    //               left: ScreenUtil().setWidth(10)),
                    //           child: SvgPicture.asset(
                    //             AppAssets.userName,
                    //             color: AppColors.greenColor,
                    //             height: ScreenUtil().setHeight(23),
                    //           ),
                    //         ),
                    //         prefixIconConstraints: BoxConstraints(
                    //             maxHeight: ScreenUtil().setHeight(23)),
                    //         labelText: 'First Name',
                    //         labelStyle: TextStyle(
                    //             color: AppColors.greenColor,
                    //             fontSize: SizeConfigs().subHeadingTextSize()),
                    //       ),
                    //       validator: (txt) {
                    //         if (EmailValidator.validate(
                    //             loginController.nameEditingController.text))
                    //           return null;
                    //         return 'Enter Valid Email';
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: ScreenUtil().setHeight(10)),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: ScreenUtil().setWidth(25)),
                    //   child: Theme(
                    //     data: DefaultStyleConfigs().textFieldTheme(),
                    //     child: TextFormField(
                    //       onChanged: (value) {
                    //         setState(() {});
                    //       },
                    //       keyboardType: TextInputType.emailAddress,
                    //       controller: loginController.nameEditingController,
                    //       style: TextStyle(
                    //           color: AppColors.greenColor,
                    //           fontSize: SizeConfigs().subHeadingTextSize()),
                    //       decoration: InputDecoration(
                    //         focusedBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: AppColors.greenColor),
                    //         ),
                    //         prefixIcon: Padding(
                    //           padding: EdgeInsets.only(
                    //               right: ScreenUtil().setWidth(10),
                    //               left: ScreenUtil().setWidth(10)),
                    //           child: SvgPicture.asset(
                    //             AppAssets.userName,
                    //             color: AppColors.greenColor,
                    //             height: ScreenUtil().setHeight(23),
                    //           ),
                    //         ),
                    //         prefixIconConstraints: BoxConstraints(
                    //             maxHeight: ScreenUtil().setHeight(23)),
                    //         labelText: 'Last Name',
                    //         labelStyle: TextStyle(
                    //             color: AppColors.greenColor,
                    //             fontSize: SizeConfigs().subHeadingTextSize()),
                    //       ),
                    //       validator: (txt) {
                    //         if (EmailValidator.validate(
                    //             loginController.nameEditingController.text))
                    //           return null;
                    //         return 'Enter Valid Email';
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: ScreenUtil().setHeight(10)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: Theme(
                        data: DefaultStyleConfigs().textFieldTheme(),
                        child: TextFormField(
                          //   FilteringTextInputFormatter.allow(RegExp("[0-9._a-zA-Z]")),
                          // ],
                          keyboardType: TextInputType.emailAddress,
                          // controller: signUpController.nameEditingController,
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
                              child: SvgPicture.asset(
                                AssetsString().UserNameIcon,
                                color: ColorManager.greenColor,
                                height: ScreenUtil().setHeight(23),
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                                maxHeight: ScreenUtil().setHeight(23)),
                            labelText: 'User Name',
                            labelStyle: TextStyle(
                                color: ColorManager.greenColor,
                                fontSize: StyleManager().mediumFontSize),
                          ),
                          controller: userNameController,
                          // validator: (txt) {
                          //   if (
                          //       userNameController.text.length >
                          //       2)
                          //     return null;
                          //   else
                          //     return 'Enter Valid username';
                          // },
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
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15)),
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
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(15)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: ColorManager.greenColor,
                              value: checBox,
                              onChanged: (value) {
                                checBox = value ?? true;
                                setState(() {});
                              }),
                          RichText(
                            text: TextSpan(
                              text: 'I agree with your ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.greenColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Term & Conditions',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.greenColor)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(20)),
                        child: TextButton(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: StyleManager().smallFontSize,
                                color: ColorManager.greenColor),
                          ),
                          onPressed: () {
                            Get.to(LoginScreen());
                            // Get.offAll(LoginScreen());
                            /*Get.to(ForgotPassword(),
                              transition: languageService.isLtrOrRtl == TextDirection.ltr ? Transition.rightToLeft : Transition.leftToRight);*/
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(25)),
                      child: FilledButton(
                        color: checBox == true ? ColorManager.greenColor : ColorManager.colorTextGray,
                          isFullWidth: true,
                          text: "Sign Up",
                          onTap: () {
                            callSignUpApi();
                          }),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(80)),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  bool validate() {

    if(userNameController.text.isEmpty) {

      Fluttertoast.showToast(msg: 'Username Required');

      return false;

    }

    if(emailController.text.isEmpty) {

      Fluttertoast.showToast(msg: 'Email Required');

      return false;

    }

    if(!emailController.text.isEmail) {

      Fluttertoast.showToast(msg: 'Invalid Email');

      return false;


    }

    if(passwordController.text.isEmpty) {

      Fluttertoast.showToast(msg: 'Password Required');

      return false;

    }

    if(passwordController.text.length < 6) {

      Fluttertoast.showToast(msg: 'Password must be at least 6 characters long');

      return false;

    }

    if(confirmPasswordController.text.isEmpty) {

      Fluttertoast.showToast(msg: 'Confirm Password Required');

      return false;

    }

    if(confirmPasswordController.text != passwordController.text) {

      Fluttertoast.showToast(msg: 'Passwords do not match');

      return false;
    }


    if(!checBox) {

      Fluttertoast.showToast(msg: 'Please agree to terms and condition first');

      return false;

    }

    return true;
  }

  void callSignUpApi() async {

    if(validate()) {
      Map<String, dynamic>? customerResponse = await StripePayment(context).getCustomerResponse(emailController.text);
      if(customerResponse == null) {

        Navigator.of(context).pop();
        Fluttertoast.showToast(msg: 'Unable to signup please try again!');
        return;

      }
      var user = CreateCustomerResponse.fromJson(customerResponse);
      print(user.customer.toString() + "<>" + user.status.toString());

      SignUpRequest signUpRequest = SignUpRequest();
      signUpRequest.email = emailController.text;
      signUpRequest.name = userNameController.text;
      signUpRequest.fcmToken = '';
      signUpRequest.password = passwordController.text;
      signUpRequest.stripeCustomerId = user.customer;

      LoadingIndicatorDialog().show(context, text: "Creating new user...");

      var dio = Dio();
      try {
        final response = await dio.post(
            Api.baseURL+'user/create-user',
            data: signUpRequest.toJson(),  options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));

        LoadingIndicatorDialog().dismiss();

        if(response.data != null) {

          UserModel userResponse = UserModel.fromJson(response.data);

          if(userResponse.user != null && userResponse.user?.id != null) {

            SessionManager.setUserData(userResponse.user!);

            TabsScreen.currentIndex = 0;

            Get.off(() => TabsScreen(selectedIndex: 0,));


          }

        }

      } on DioError catch (e) {

        LoadingIndicatorDialog().dismiss();
        //
        if(e.response != null) {

          print('has response');

          AuthErrorResponse resp = AuthErrorResponse.fromJson(e.response!.data);

          print('has error ${resp.toString()}');

          Fluttertoast.showToast(msg: resp.error?.message ?? "Invalid Credentials");

        } else {

          Fluttertoast.showToast(msg: e.response.toString());


        }

      }
    }
  }
}








