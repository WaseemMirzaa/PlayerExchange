import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/models/auth/user_model.dart';
import 'package:player_exchange/models/rosters/roster_model.dart';
import 'package:player_exchange/networking/api_requests.dart';
import 'package:player_exchange/ui/screens/exchange_player/cash_offer_screen.dart';
import 'package:player_exchange/ui/screens/home_tabs/tabs_screen.dart';
import 'package:player_exchange/ui/screens/roster_screen.dart';
import 'package:player_exchange/ui/widgets/chart.dart';
import 'package:player_exchange/ui/widgets/circle_avatar_named_widget.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/number_utils.dart';
import 'package:player_exchange/utils/style_manager.dart';

import '../home_tabs/exchange_screen.dart';

class ExchangePlayerScreen extends StatefulWidget {
  final RosterModel rosterModel;

  const ExchangePlayerScreen({Key? key, required this.rosterModel}) : super(key: key);

  @override
  ExchangePlayerScreenState createState() => ExchangePlayerScreenState();
}

class ExchangePlayerScreenState extends State<ExchangePlayerScreen> {
  int activeIndex = 0;

  var shareController = TextEditingController();
  var offerAmountController = TextEditingController();
  int asking = 0;
  int shares = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Padding(
        padding: ButtonTheme.of(context).padding,
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.rosterModel.cpoAthletes?.playerName ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: StyleManager().largeFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  CircleAvatarNamedWidget(url: widget.rosterModel.cpoAthletes?.profilePicture ?? "", name: widget.rosterModel.cpoAthletes?.playerName ?? "", radius: 30,)

                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '\$ ' +
                                    (widget.rosterModel.cpoAthletes?.currentPricePerShare ?? 0)
                                        .toString(),
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  // Text(
                                  //   '\$' + (widget.rosterModel.cpoAthletes?.currentPricePerShare ?? 0).toString(),
                                  //   style: TextStyle(
                                  //       fontSize: StyleManager().smallFontSize,
                                  //       fontWeight: FontWeight.w600,
                                  //       color: Colors.black),
                                  // ),
                                  // Icon(
                                  //   Icons.arrow_forward_ios_rounded,
                                  //   color: Colors.white,
                                  //   size: 12,
                                  // )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'available_shares'.tr),
                            TextSpan(
                              style: TextStyle(color: ColorManager.greenColor),
                              text: " " + (widget.rosterModel.sharesBought ?? 0).toString(),
                            )
                          ]))
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'open'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.greenColor), text: '\$ --- '),
                          ])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'high'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.greenColor), text: '\$ --- '),
                          ])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                text: 'low'.tr + " : "),
                            TextSpan(
                                style: TextStyle(color: ColorManager.lowPriceColor),
                                text: '\$ --- '),
                          ])),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150.h,
                padding: EdgeInsets.all(15),
                color: ColorManager.chartBackgroundColor,
                child: Chart(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'live'.tr,
                          style: TextStyle(
                              color: ColorManager.greenColor, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(width: 50, child: OfferHeading(title: '1Q', isEnable: false))
                      ],
                    ),
                    Text(
                      '2 Q'.tr,
                      style: TextStyle(
                          color: ColorManager.buttonBorderGreyColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 10, left: 10, right: 10),
                child: CustomDivider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                        children: [
                          Text(
                            'Asking',
                            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                          ),
                          Container(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.green),
                            controller: shareController,
                            textAlign: TextAlign.center,
                            // autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                            maxLength: 8,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],

                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              hintText: "\$0",
                              fillColor: Colors.black,
                              focusColor: Colors.black,
                              hoverColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: ColorManager.lightGreyDivider,
                                    width: 2,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: ColorManager.greenColor,
                                    width: 2,
                                  )),
                            ),
                            onChanged: (String? value) {
                              if (NumberUtils.isNumeric(value)) {
                                asking = int.parse(value!);
                              } else {
                                asking = 0;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                        children: [
                          Text(
                            'Shares',
                            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                          ),
                          Container(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.green),
                            controller: offerAmountController,
                            textAlign: TextAlign.center,
                            // autovalidateMode: AutovalidateMode.always,
                            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                            maxLength: 8,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],

                            decoration: const InputDecoration(
                              hintText: "0",
                              fillColor: Colors.black,
                              focusColor: Colors.black,
                              hoverColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: ColorManager.lightGreyDivider,
                                    width: 2,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: ColorManager.greenColor,
                                    width: 2,
                                  )),
                            ),
                            onChanged: (String? value) {
                              if (NumberUtils.isNumeric(value)) {
                                shares = int.parse(value!);
                              } else {
                                shares = 0;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
              ),
              FilledButton(
                onTap: () async {
                  if (shares <= 0) {
                    Fluttertoast.showToast(msg: "Shares must be greater than 0");
                  } else if (asking <= 0) {
                    Fluttertoast.showToast(msg: "Asking Price must be greater than 0");
                  }
                  if (shares > (widget.rosterModel.sharesBought ?? 0).toInt()) {
                    Fluttertoast.showToast(msg: "Not enough shares available");
                  } else if (shares > 0 &&
                      asking > 0 &&
                      shares <= (widget.rosterModel.sharesBought ?? 0).toInt()) {
                    User user = Get.find<AppDrawerController>().user.value;
                    // var bottomWidgetKey=TabsScreen(selectedIndex: 2).bottomNavBarKey;
                    // BottomNavigationBar navigationBar =  bottomWidgetKey.currentWidget as BottomNavigationBar;

                    await APIRequests.doApi_addExchangePlayer(
                            shares, asking, widget.rosterModel.id ?? "", user.id ?? "")
                        .then((value) => {
                              if (value)
                                {
                                  Navigator.popUntil(
                                    context,
                                    ModalRoute.withName('/'),
                                  ),
                                  TabsScreen.currentIndex = 2,
                                  // navigationBar.onTap!(2),

                  Get.offAll(() => TabsScreen(selectedIndex: TabsScreen.currentIndex,))
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           TabsScreen(
                                  //             selectedIndex: 2,
                                  //           )),
                                  // )
                                }
                            });
                  }

                  // Navigator.of(context).pushNamed('')
                },
                text: 'Send to exchange Market'.tr,
              ),
            ])),
          ],
        ),
      ),
    );
  }


}
