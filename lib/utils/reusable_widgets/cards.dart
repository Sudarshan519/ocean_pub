import 'package:flutter/material.dart';
import 'package:publication_app/features/about_us/view_all_view.dart';
import 'package:publication_app/features/details/details_view.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/functions.dart';
// import 'package:velocity_x/velocity_x.dart';
import 'package:publication_app/utils/extensions.dart';
import '../colors.dart';
import '../widgets.dart';

Widget packageContainer(BuildContext context, dynamic object,
    {bool showViewmore = true, Color bgColor, bool isElevated = true}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.0),
    child: Card(
      elevation: isElevated ? 10.0 : 0.0,
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
                      "${object.heading}".capitalizeFirstofEach,
                      fontweight: FontWeight.w600,
                      fontSize: context.textTheme.subtitle1.fontSize + 2,
                    ),
                    if (showViewmore)
                      viewmoreAction(
                        context,
                        onTapped: () {
                          push(context, ViewAllView(type: object.data.first));
                        },
                      ),
                  ],
                ),
              ),
              8.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    object.data.length,
                    (index) => bookCard(
                      context,
                      object.data[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget bookCard(BuildContext context, dynamic object) {
  return InkWell(
    onTap: () {
      push(
        context,
        DetailsView(object, "book"),
      );
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
              child: networkImage(
                object.image
                        .toString()
                        .contains('https://oceanpublication.com.np/')
                    ? "${object.image}"
                    : "https://oceanpublication.com.np/${object.image}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          2.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.only(right: 4.0),
                child: text(
                  // index.isEven
                  // ?
                  // "Bookname",
                  object.title ?? "",

                  maxLine: 2,
                  isCentered: true,
                  fontSize: context.textTheme.subtitle1.fontSize,
                  fontweight: FontWeight.w700,
                ),
              ),
              2.heightBox,
              text(
                object is PackageData ? "" : object.author ?? "",
                maxLine: 1,
                textColor: Colors.grey,
                fontweight: FontWeight.w600,
                isCentered: true,
                fontSize: context.textTheme.caption.fontSize,
              ),
              2.heightBox,
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: text(
                        "${object.price}".toCurrency,
                        // // TODO: change price

                        // "Rs 500", isCentered: true,
                        textColor: Colors.red,
                        decoration: TextDecoration.lineThrough,
                        fontweight: FontWeight.w400,
                        fontSize: context.textTheme.overline.fontSize,
                      ),
                    ),
                    8.widthBox,
                    Container(
                      child: text(
                        // "Rs 500",
                        // TODO: change offerprice
                        "${object.offerPrice}".toCurrency,
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

Widget viewmoreAction(BuildContext context, {Function onTapped}) {
  return InkWell(
    onTap: onTapped,
    child: Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          icon(categoriesIcon, height: 20.0),
          text(
            "View all",
            fontSize: context.textTheme.caption.fontSize,
          ),
        ],
      ),
    ),
  );
}
