import 'package:flutter/material.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/widgets.dart';

import 'package:publication_app/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

Widget bookCard(BuildContext context, dynamic index) {
  return InkWell(
    onTap: () {
      // push(context, DetailsView());
    },
    child: Container(
      width: context.screenWidth * 0.3,
      padding: EdgeInsets.only(right: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.screenWidth * 0.32,
            height: context.screenHeight * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(context.screenWidth * 0.01),
              child: assetimage(
                'assets/images/book${index + 1}.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          2.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.only(right: 4.0),
                child: text(
                  // index.isEven
                  // ?
                  // "Bookname",
                  "Such a fun age ",

                  maxLine: 2,
                  fontSize: context.textTheme.subtitle1.fontSize,
                  fontweight: FontWeight.w700,
                ),
              ),
              2.heightBox,
              Container(
                alignment: Alignment.centerLeft,
                child: text(
                  "Michael park",
                  maxLine: 1,
                  textColor: Colors.grey,
                  fontweight: FontWeight.w600,
                  fontSize: context.textTheme.caption.fontSize,
                ),
              ),
              2.heightBox,
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: text(
                        "450".toCurrency,
                        isCentered: true,
                        textColor: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        fontweight: FontWeight.w400,
                        fontSize: context.textTheme.overline.fontSize,
                      ),
                    ),
                    8.widthBox,
                    Container(
                      child: text(
                        "250".toCurrency,
                        textColor: Colors.green,
                        isCentered: true,
                        fontweight: FontWeight.w500,
                        fontSize: context.textTheme.caption.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              8.heightBox,
              Container(
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [1, 2, 3, 4, 5]
                        .map(
                          (e) => Icon(
                            Icons.star,
                            size: 15.0,
                            color: e <= 3 ? Colors.orange : greyColor,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget packageContainer(BuildContext context, String title,
    {bool showViewmore = true, Color bgColor, bool isElevated = true}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.0),
    child: Card(
      elevation: isElevated ? 5.0 : 0.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          color: whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(
                      "$title",
                      fontweight: FontWeight.w600,
                      fontSize: context.textTheme.subtitle1.fontSize + 2,
                    ),
                    // if (showViewmore) viewmoreAction(context, ),
                  ],
                ),
              ),
              8.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => bookCard(context, index),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget divider() {
  return Divider(
    thickness: 1.5,
    indent: 0.0,
    endIndent: 0.0,
  );
}

Widget detailsIconAndText(BuildContext context,
    {String title, IconData icon, bool isPhone = false}) {
  return Container(
    // color: Colors.red,

    padding: EdgeInsets.symmetric(vertical: 3.0),
    child: InkWell(
      onTap: isPhone
          ? () {
              launch("tel://$title}");
            }
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: colorPrimary,
              size: 25.0,
            ),
            5.widthBox,
          ],
          Container(
            width: context.screenWidth * 0.4,
            child: text(
              "$title",
              maxLine: 2,
              fontweight: FontWeight.w300,
              fontSize: context.textTheme.subtitle2.fontSize,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget iconsGrid(int i, BuildContext context, {String title}) {
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: Stack(
      children: <Widget>[
        Container(
          // color: Colors.red,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/book${(i % 5) + 1}.jpeg',
              fit: BoxFit.fitHeight,
              height: context.screenWidth / 4,
              width: context.screenWidth / 3,
            ),
          ),
        ),
        Container(
          //yo container ko kaam bhaneko contain garne ho
          // height: 120.0,
          // width: 120.0,
          decoration: BoxDecoration(
            // color: Colors.grey.shade200,

            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 0, 0, 0.65),
                Color.fromRGBO(196, 196, 196, 0.1),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Positioned(
          bottom: 5.0,
          left: 3.0,
          right: 3.0,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              title ?? "Slug title",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.textTheme.subtitle1.fontSize - 2,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget videocards(BuildContext context, int i) {
  print(context.screenHeight * 0.15);
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Container(
      width: context.screenWidth / 1.9,
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              height: context.screenHeight * 0.15,
              color: Colors.grey.shade300,
              alignment: Alignment.topCenter,
              child: Center(
                  child: Image.asset('assets/images/play.png',
                      height: context.screenHeight * 0.1)),
            ),
          ),
          Text(
            "Video title",
            style: TextStyle(
                fontSize: context.textTheme.subtitle2.fontSize,
                fontWeight: FontWeight.w500),
          ),
          // Text(
          //   "Author",
          //   style: TextStyle(
          //       fontSize: context.textTheme.subtitle2.fontSize - 2,
          //       fontWeight: FontWeight.w500),
          // )
        ],
      ),
    ),
  );
}

Widget cards(BuildContext context, int i) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Container(
      height: context.screenWidth / 4,
      width: context.screenWidth / 3,
      // color: Colors.blueGrey,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                'assets/images/book${i + 1}.jpeg',
                fit: BoxFit.cover,
                height: context.screenWidth / 4,
                width: context.screenWidth / 3,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.grey.shade200,

              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.65),
                  Color.fromRGBO(196, 196, 196, 0.1),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 5.0,
            child: Column(
              children: [
                Text(
                  "Bookname",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: context.textTheme.subtitle2.fontSize,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Author",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: context.textTheme.subtitle2.fontSize - 2,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
