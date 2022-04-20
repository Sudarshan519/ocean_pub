import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'colors.dart';

Widget icon(String path, {double width, double height, Color color}) =>
    Image.asset(
      path,
      width: width ?? 20,
      height: height ?? 20,
      color: color,
      fit: BoxFit.contain,
    );
Widget assetimage(String path,
        {double width, double height, Color color, BoxFit fit}) =>
    Image.asset(
      path,
      width: width ?? 150,
      height: height ?? 70,
      color: color,
      fit: fit,
    );
Widget networkImage(String url,
    {double width, double height, Color color, BoxFit fit}) {
  return CachedNetworkImage(
    imageUrl: url,
    errorWidget: (_, __, ___) => assetimage(errorImage),
    placeholder: (context, title) => SpinKitChasingDots(color: colorPrimary),
  );
}

final String iconPath = "assets/icons";
final String bookIcon = "$iconPath/book.png";
final String errorImage = "$iconPath/error.jpeg";
final String categoriesIcon = "$iconPath/categories.png";
final String downloadIcon = "$iconPath/download.png";
final String favouriteIcon = "$iconPath/favorite.png";
final String homeIcon = "$iconPath/home.png";
final String libraryIcon = "$iconPath/library.png";
final String logo = "$iconPath/logo.png";
final String logoutIcon = "$iconPath/logout.png";
final String packageIcon = "$iconPath/package.png";
final String profileIcon = "$iconPath/profile.png";
final String settingIcon = "$iconPath/setting.png";
final String userIcon = "$iconPath/user.png";
final String videoIcon = "$iconPath/video.png";
final String esewaIcon = "$iconPath/esewa.png";
final String authBackgroundImage = "assets/images/bg_image.png";
