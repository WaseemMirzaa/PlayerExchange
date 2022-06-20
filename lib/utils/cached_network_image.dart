import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:player_exchange/utils/assets_string.dart';


Widget cachedImage(String? url, {double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, bool usePlaceholderIfUrlEmpty = true, double? radius, Color? color}) {
  if (url == null || url.isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url!,
      height: height,
      width: width,
      fit: fit,
      color: color,
      memCacheHeight: 720,
      memCacheWidth: 720,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Image.asset(url!, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center, color: color),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    child: Image.asset(
      AssetsString().placeholderAvatar,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      alignment: alignment ?? Alignment.center,
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );

  //   Image.asset(
  //   AssetsString().placeHolderProfile,
  //   height: height,
  //   width: width,
  //   fit: fit ?? BoxFit.cover,
  //   alignment: alignment ?? Alignment.center,
  // ).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
