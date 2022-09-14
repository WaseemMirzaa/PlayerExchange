import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:player_exchange/controllers/app_drawer_controller.dart';
import 'package:player_exchange/controllers/edit_profile_screen_controller.dart';
import 'package:player_exchange/controllers/profile_screen_controller.dart';
import 'package:player_exchange/ui/widgets/custom_appbar.dart';
import 'package:player_exchange/ui/widgets/filled_button.dart';
import 'package:player_exchange/utils/assets_string.dart';
import 'package:player_exchange/utils/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:player_exchange/utils/image_compress.dart';
import 'package:player_exchange/utils/session_manager.dart';

import '../../Networking/api_requests.dart';
import '../../chat/firebase_cloud_messaging.dart';
import '../../main.dart';
import '../../models/auth/user_model.dart';
import '../../utils/constants.dart';
import 'authentication/auth_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileScreenController editProfileScreenController =
      Get.put(EditProfileScreenController());

  File? image;
  bool showDeleteButton = false;
  String? url;

  var offerAmountController = TextEditingController();
  var nameController = TextEditingController();

  String userId = '';

  @override
  void initState() {
    // TODO: implement initState

    fireStore
        .collection(FirestoreCollections.appSettings)
        .doc(FirestoreDocuments().settingsDocument)
        .get()
        .then((value) =>
            {showDeleteButton = value['showDeleteButton'] as bool, init()
            });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          leadingIcon: AssetsString().BackArrowIcon,
          trailing: [
            TextButton(
                onPressed: () {
                  editProfileScreenController
                      .saveProfile(image, nameController.value.text, context)
                      .then((isSuccess) => {
                            if (isSuccess)
                              {
                                Get.find<AppDrawerController>().user.value =
                                    editProfileScreenController.user.value,
                                SessionManager.setUserData(
                                    editProfileScreenController.user.value),
                                Get.back()
                              }
                          });
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: ColorManager.greenColor),
                ))
          ]),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                profileImageWidget(),
                // UploadImageContainer(size: size, image: "Image"),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SvgPicture.asset(AssetsString().EditProfileImage),
                //
                //   ],
                // ),
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
                  controller: nameController
                    ..text = editProfileScreenController.user.value.name!
                    ..selection = TextSelection.fromPosition(
                        TextPosition(offset: nameController.text.length)),
                  style: TextStyle(color: Colors.black),
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
                ),
                if (showDeleteButton)
                  FilledButton(
                    onTap: () async {
                      _showDeleteAccountDialog();
                    },
                    text: 'Delete Account',
                    color: ColorManager.greenColor,
                  )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        );
      }),
    );
  }

  Future<void> _showDeleteAccountDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert', style: TextStyle(color: Colors.black)),
          content: const Text(
            'Are you sure that you want to delete your account? Deleting your account will delete all the user data. Please clear your Wallet before deleting your account. Once deleted your account cannot be recovered again.',
            style: TextStyle(color: ColorManager.colorTextDarkGray),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',
                  style: TextStyle(color: ColorManager.greenColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
              onPressed: () {
                deleteUser();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> init() async {
    Future<User?> user = SessionManager.getUserData();
    await user.then((value) => {userId = value?.id ?? ""});
    debugPrint("user id : " + userId.toString());
    setState(() {

    });
  }

  Future<void> deleteUser() async {
    APIRequests.doApi_deleteUser(userId).then((value) => {
          Navigator.of(context).pop(),
          FirebaseCloudMessaging.stopNotificationService(userId: userId ?? ""),
          SessionManager.setUserData(new User()),
          Get.offAll(AuthScreen()),
        });
  }

  GestureDetector profileImageWidget() {
    return GestureDetector(
      onTap: () {
        pickImage(ImageSource.gallery);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
          child: SizedBox(
            height: 120.0,
            width: 120.0,
            child: image == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AssetsString().EditProfileImage),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120.0,
                        width: 120.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(image!, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 40);
      if (image == null) return;
      final imageTemprery = File(image.path);
      setState(() {
        this.image = imageTemprery;
      });
    } on PlatformException catch (e) {
      print('failed to pick image');
      Fluttertoast.showToast(msg: 'Please allow to access Image');
    }
    print('before');
    // Reference ref = FirebaseStorage.instance.ref().child('uploads');
    // await ref.putFile(File(image!.path));
    // String imgUrl = await ref.getDownloadURL();
    // print(imgUrl);
  }
}
