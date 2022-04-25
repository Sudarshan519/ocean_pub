import 'package:flutter/material.dart';
import 'package:publication_app/features/details/details_view.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/widgets.dart';

import 'package:publication_app/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

Widget bookCard(BuildContext context, dynamic index, var data) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: context.screenWidth * 0.32,
      // width: context.screenWidth * 0.3,
      decoration: BoxDecoration(
          // color: Colors.white,
          // borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
          ),
      margin: EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: context.screenHeight * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(context.screenWidth * 0.01),
              child: assetimage(
                'assets/images/book${index + 1}.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          2.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
    {bool showViewmore = true,
    Color bgColor,
    bool isElevated = true,
    var books,
    List<PackageData> package}) {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          text(
            "$title",
            fontweight: FontWeight.w600,
            fontSize: context.textTheme.subtitle1.fontSize + 2,
          ),
          Spacer(),
          text(
            "View All".toUpperCase(),
            fontweight: FontWeight.w600,
            fontSize: context.textTheme.subtitle1.fontSize - 2,
          ),
        ],
      ),
    ),
    8.heightBox,
    if (package != null)
      Container(
        height: context.screenHeight * 0.35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: package.length,
            padding: const EdgeInsets.only(left: 16),
            itemBuilder: (_, i) {
              var pkg = package[i];
              // print(pkg);
              // print(package[i].toString());
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DetailsView(pkg),
                  ));
                },
                child: Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 10),
                    // color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  context.screenWidth * 0.01),
                              child: networkImage(
                                pkg.image.toString().contains(
                                        'https://oceanpublication.com.np/')
                                    ? "${pkg.image}"
                                    : "https://oceanpublication.com.np/${pkg.image}",
                                fit: BoxFit.cover,
                              ), // Image.network(pkg.image),
                              // assetimage(
                              //   'assets/images/book${index + 1}.jpeg',
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                          ),
                        ),
                        2.heightBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 4.0),
                                child: text(
                                  // index.isEven
                                  // ?
                                  // "Bookname",
                                  pkg.title,

                                  maxLine: 2,
                                  fontSize:
                                      context.textTheme.subtitle1.fontSize,
                                  fontweight: FontWeight.w600,
                                ),
                              ),
                              2.heightBox,
                              Container(
                                alignment: Alignment.centerLeft,
                                child: text(
                                  pkg.packageType,
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
                                        pkg.offerPrice.toString().toCurrency,
                                        isCentered: true,
                                        textColor: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                        fontweight: FontWeight.w400,
                                        fontSize:
                                            context.textTheme.overline.fontSize,
                                      ),
                                    ),
                                    8.widthBox,
                                    Container(
                                      child: text(
                                        pkg.price.toString().toCurrency,
                                        textColor: Colors.green,
                                        isCentered: true,
                                        fontweight: FontWeight.w500,
                                        fontSize:
                                            context.textTheme.caption.fontSize,
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
                                            color: e <= 3
                                                ? Colors.orange
                                                : greyColor,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )

                    ///books

                    //  Column(
                    //   children: [
                    //     Expanded(child: Image.network(pkg.image)),
                    //     Text(pkg.title.toString()),
                    //     Text(pkg.shortDescription
                    //         .replaceAll("<p>", "")
                    //         .replaceAll("<br>", "")
                    //         .replaceAll("</p>", "")
                    //         .toString()),
                    //   ],
                    // ),
                    ),
              );
            }),
      ),
    if (books != null)
      Container(
        height: context.screenHeight * 0.35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            padding: const EdgeInsets.only(left: 16),
            itemBuilder: (_, i) {
              BooksDatum pkg = books[i];
              print(pkg);
              // print(package[i].toString());
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DetailsView(pkg),
                  ));
                },
                child: Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 10),
                    // color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  context.screenWidth * 0.01),
                              child: networkImage(pkg.image),
                              // assetimage(
                              //   'assets/images/book${index + 1}.jpeg',
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                          ),
                        ),
                        2.heightBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 4.0),
                                child: text(
                                  // index.isEven
                                  // ?
                                  // "Bookname",
                                  pkg.title,

                                  maxLine: 2,
                                  fontSize:
                                      context.textTheme.subtitle1.fontSize,
                                  fontweight: FontWeight.w600,
                                ),
                              ),
                              2.heightBox,
                              Container(
                                alignment: Alignment.centerLeft,
                                child: text(
                                  pkg.author,
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
                                        pkg.offerPrice.toString().toCurrency,
                                        isCentered: true,
                                        textColor: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                        fontweight: FontWeight.w400,
                                        fontSize:
                                            context.textTheme.overline.fontSize,
                                      ),
                                    ),
                                    8.widthBox,
                                    Container(
                                      child: text(
                                        pkg.price.toString().toCurrency,
                                        textColor: Colors.green,
                                        isCentered: true,
                                        fontweight: FontWeight.w500,
                                        fontSize:
                                            context.textTheme.caption.fontSize,
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
                                            color: e <= 3
                                                ? Colors.orange
                                                : greyColor,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )

                    ///books

                    //  Column(
                    //   children: [
                    //     Expanded(child: Image.network(pkg.image)),
                    //     Text(pkg.title.toString()),
                    //     Text(pkg.shortDescription
                    //         .replaceAll("<p>", "")
                    //         .replaceAll("<br>", "")
                    //         .replaceAll("</p>", "")
                    //         .toString()),
                    //   ],
                    // ),
                    ),
              );
            }),
      ),
    // Text(books.toString()),
    // if (package != null)
    //   SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       padding: const EdgeInsets.only(left: 20),
    //       child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: List.generate(package.length, (index) {
    //             var pkg = package[index];
    //             return bookCard(context, index, []);
    //           })))
  ]);
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
