import 'package:flutter/material.dart';
import 'package:player_exchange/utils/cached_network_image.dart';
import 'package:player_exchange/utils/color_manager.dart';

class CircleAvatarNamedWidget extends StatelessWidget {
  const CircleAvatarNamedWidget({
    Key? key,
    this.name = "",
    required this.url,
    this.radius = 20,
    this.fontSize = 16,
    
  }) : super(key: key);

  final String name;
  final String url;
  final double radius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: ColorManager.placeholderBlueGreyButtonColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: name.isNotEmpty
            ? Text('${name[0].toUpperCase()}', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),textAlign: TextAlign.center)
            : cachedImage(url, fit: BoxFit.cover,),
      ),
    );
  }
}
