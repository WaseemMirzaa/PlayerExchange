// ignore_for_file: must_be_immutable, unused_local_variable, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:player_exchange/utils/assets_string.dart';

class UploadImageContainer extends StatefulWidget {
  UploadImageContainer({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  String image;

  @override
  State<UploadImageContainer> createState() => _UploadImageContainerState();
}

class _UploadImageContainerState extends State<UploadImageContainer> {
  File? image;
  String? url;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickImage(ImageSource.gallery);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: SizedBox(
          height: 120,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(image!, fit: BoxFit.cover),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
