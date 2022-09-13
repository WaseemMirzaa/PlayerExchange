import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/profile_screen_controller.dart';
import 'package:player_exchange/ui/screens/edit_profile_screen.dart';
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
  ProfileScreenController profileScreenController =
      Get.put(ProfileScreenController());
  AppDrawerController appDrawerController =
      Get.find<AppDrawerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        isTransparent: false,
        trailing: [
          IconButton(
              onPressed: () {
                Get.to(EditProfileScreen());
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
                            'MLB-0\%',
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
                            'NFL-100\%',
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
                            'NHL-0\%',
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
                            'NBA-0\%',
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
    return Obx(() {
      return Container(
        color: ColorManager.backgroundGreyColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  image: DecorationImage(
                    image: NetworkImage(appDrawerController
                            .user.value.profilePicture ?? ""),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // FadeInImage.assetNetwork(
              //   placeholder: AssetsString().placeHolderProfile,
              //   // placeholder: 'assets/placeHolderProfile.jpg',
              //   image: appDrawerController.user.value.profilePicture ?? "https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png",
              // ),
              // SvgPicture.asset(AssetsString().ProfileImage),
              SizedBox(
                height: 15,
              ),
              Text(
                appDrawerController.user.value.name ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: StyleManager().largeFontSize,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                appDrawerController.user.value.email ?? "",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Joined: ' + (appDrawerController.user.value.createdAt ?? ""),
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
    });
  }
}
