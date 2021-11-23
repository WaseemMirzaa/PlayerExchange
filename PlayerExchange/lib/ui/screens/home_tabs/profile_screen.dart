import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/ui/screens/edit_profile.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/custom_divider.dart';
import 'package:player_exchange/ui/widgets/offer_heading.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:player_exchange/utils/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        isTransparent: false,
        trailing: [
          IconButton(
              onPressed: () {
                Get.to(EditProfile());
              },
              icon: SvgPicture.asset(AssetsString().EditIcon))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              headerWidget(),
              Container(
                height: 1,
                width: double.infinity,
                color: ColorManager.lightGreyDivider,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // OfferHeading(title:'Stock',isEnable: true,enableColor: ColorManager.buttonGreyColor,),
                      OfferHeading(
                        textColor: Colors.black,
                        title: 'NFL',
                        isEnable: true,
                        enableColor: ColorManager.buttonGreyColor,
                      ),
                      // OfferHeading(title:'NBA',isEnable: false,enableColor: ColorManager.buttonGreyColor,),
                      // OfferHeading(title:'MLB',isEnable: false,enableColor: ColorManager.buttonGreyColor,),
                      // OfferHeading(title:'NHL',isEnable: false,enableColor: ColorManager.buttonGreyColor,)
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: ColorManager.lightGreyDivider,
              ),
              SizedBox(
                height: 15,
              ),
              CustomDivider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: SizedBox(
                  height: 30.h,
                ),
              ),
              SvgPicture.asset(AssetsString().ProfileStatCircleImage),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetsString().SkyColorCircleImage),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'MLB-25\%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: StyleManager().mediumFontSize),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              AssetsString().PurpleColorCircleImage),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'NFL-25\%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: StyleManager().mediumFontSize),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              AssetsString().YellowColorCircleImage),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'NHL-25\%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: StyleManager().mediumFontSize),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              AssetsString().OrangeColorCircleImage),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'NBA-25\%',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: StyleManager().mediumFontSize),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      color: ColorManager.backgroundGreyColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            SvgPicture.asset(AssetsString().ProfileImage),
            SizedBox(
              height: 15,
            ),
            Text(
              'Isaac B',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: StyleManager().largeFontSize,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '\@IsaacB001',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Joined-September 2021',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            CustomDivider(),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
