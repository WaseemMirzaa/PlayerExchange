import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/widgets/default_style_config.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

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
                            TabsScreen.currentIndex = 0;
                            Get.offAll(() => TabsScreen(
                                  selectedIndex: 0,
                                ));
                          }),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
