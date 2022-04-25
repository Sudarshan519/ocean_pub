import 'package:flutter/material.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

List<Choice> choices = [
  Choice(id: 0, title: "Book", icon: bookIcon),
  Choice(id: 1, title: "Video", icon: videoIcon),
  Choice(id: 2, title: "Package", icon: packageIcon),
  // Choice(id: 2, title: "View All", icon: packageIcon),
];

class Choice {
  //
  final int id;
  final String title;
  final String icon;
  final Color textColor;
  final Color iconColor;

  Choice({this.id, this.title, this.icon, this.textColor, this.iconColor});
}

Widget optionButton(BuildContext context, String icons, String title,
    {bool isSelected}) {
  return Container(
    // width: context.screenWidth / 4,
    height: context.screenHeight * 0.05,
    margin: const EdgeInsets.only(right: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: isSelected == true ? colorPrimary : whiteColor,
        borderRadius: BorderRadius.circular(context.screenWidth * 0.01),
        border: Border.all(color: Colors.grey.shade300)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        icon(
          icons,
          height: context.textTheme.subtitle2.fontSize,
          color: isSelected == true ? whiteColor : colorPrimary,
        ),
        6.widthBox,
        text(
          title,
          fontweight: FontWeight.w500,
          textColor: isSelected == true ? whiteColor : Colors.grey,
          fontSize: context.textTheme.subtitle2.fontSize,
        ),
        SizedBox(width: 6),
      ],
    ),
  );
}
