import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:share_plus/share_plus.dart';

import '../../../controllers/app_drawer_controller.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  _RewardScreenState createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  AppDrawerController appDrawerController = Get.find<AppDrawerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, leadingIcon: AssetsString().BackArrowIcon),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "Rewards",
                    style:
                        TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Image.asset(AssetsString().Images),
            // SvgPicture.asset(AssetsString().Images,),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Invite friends & Get a Free Stock",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Invite friends to Player Xchange.\n Once they sign up and link their bank account you both will get a free stock.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45, fontSize: 14),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ref=${appDrawerController.user.value.referCode_My}",
                      style: TextStyle(color: Colors.black87),
                    ),
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(
                            ClipboardData(text: appDrawerController.user.value.referCode_My));
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Copied to clipboard'),
                        ));
                      },
                      child: Icon(
                        Icons.copy,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 30, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Expanded(
                  //   child: FilledButton(
                  //     onTap: () {
                  //       Fluttertoast.showToast(msg: "Will be available soon");
                  //     },
                  //     text: "Invite Contacts",
                  //     reverseColor: true,
                  //     isFullWidth: false,
                  //     color: ColorManager.buttonGreyColor,
                  //     padding: 15,
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Expanded(
                    child: FilledButton(
                      onTap: () async {
                        // Share.share('Check out this awesome app \n'
                        //     '<IOS app url>\n'
                        //     '<Android app Url>\n'
                        //     'Use my refer code and start earning\n'
                        //     '${appDrawerController.user.value.referCode_My}');

                        final box = context.findRenderObject() as RenderBox?;

                        await Share.share(
                          'Check out this awesome app \n'
                              '<IOS app url>\n'
                              '<Android app Url>\n'
                              'Use my refer code and start earning\n'
                              '${appDrawerController.user.value.referCode_My}',
                          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                        );
                        },
                      text: "Invite a friend",
                      reverseColor: true,
                      isFullWidth: false,
                      color: ColorManager.buttonGreyColor,
                      padding: 15,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
