import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var shareController = TextEditingController();
  var offerAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          leadingIcon: AssetsString().BackArrowIcon,
          trailing: [
            FlatButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: ColorManager.greenColor),
                ))
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetsString().EditProfileImage),
                ],
              ),
              Text(
                'Name',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                'You’ll see this at the top of your profile',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                controller: shareController,
                decoration: InputDecoration(
                  hintText: "IsacB",
                  label: Text('Name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: ColorManager.lightGreyDivider,
                        width: 0.1,
                      )),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              // Text(
              //   'Username',
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18),
              // ),
              // SizedBox(
              //   height: 7.h,
              // ),
              // Text(
              //   'You can use your username to login',
              //   style: TextStyle(color: Colors.black),
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // TextFormField(
              //   controller: offerAmountController,
              //   decoration: InputDecoration(
              //     hintText: "@IsacB",
              //     label: Text('User Name'),
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(10)),
              //         borderSide: BorderSide(
              //           color: ColorManager.lightGreyDivider,
              //           width: 0.1,
              //         )),
              //   ),
              // ),
              // SizedBox(
              //   height: 30.h,
              // ),
              FilledButton(
                onTap: () {},
                text: 'Earn Reward',
                color: ColorManager.greenColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
