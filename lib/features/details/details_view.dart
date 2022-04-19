import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/features/cart/cart_view.dart';
import 'package:publication_app/features/cart/cart_viewmodel.dart';
import 'package:publication_app/features/checkout/checkout_view.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/functions.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:publication_app/utils/extensions.dart';

import '../reusable_wiidgets.dart';

class DetailsView extends StatefulWidget {
  final dynamic object;

  const DetailsView(this.object);
  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int activeIndex = 0;
  final List<String> _tabBarTitles = [
    "Description",
    "Details",
    "Reviews",
    // "Course Description"
  ];
  var object;
  bool isReadingMore = false;
  @override
  void initState() {
    super.initState();
    object = widget.object;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //
        appBar: appBarWithSearch(
          context,
          title: "Half-girlfriend",
        ),
        body: SingleChildScrollView(
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            direction: Axis.vertical,
            children: [
              stackedCoverView(),
              description(),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }

  description() {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Column(
        // direction: Axis.vertical,
        children: [
          TabBar(
            onTap: (int indx) {
              setState(() {
                activeIndex = indx;
              });
            },
            labelColor: colorPrimary,
            unselectedLabelColor: blackColor,
            tabs: _tabBarTitles.map(
              (String title) {
                int elementIndex = _tabBarTitles.indexOf(title);
                return Tab(
                  child: text(
                    "$title",
                    textColor: activeIndex == elementIndex
                        ? colorPrimary
                        : Colors.black,
                    isCentered: true,
                    maxLine: 2,
                    fontweight:
                        activeIndex == elementIndex ? FontWeight.w600 : null,
                    fontSize: activeIndex == elementIndex ? 16.0 : 12.0,
                  ),
                );
              },
            ).toList(),
          ),
          Container(
            width: context.screenWidth,
            height: isReadingMore
                ? context.screenHeight * 0.9
                : context.screenHeight * 0.62,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          minHeight: context.screenHeight * 0.25,
                          // maxHeight: null,
                        ),
                        // height:
                        //     isReadingMore ? null : context.screenHeight * 0.35,
                        padding: EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            // TODO: replace here
                            // text: ((isReadingMore
                            //             ? object.description
                            //             : object.shortDescription)
                            //         .toString())
                            //     .ashtmlTags,
                            text: !isReadingMore
                                ? loremText.substring(0, 480)
                                : loremText,
                            style: TextStyle(color: colorPrimary),
                            children: object.shortDescription != null
                                ? [
                                    TextSpan(
                                      text: isReadingMore
                                          ? "See less"
                                          : "See More",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          setState(
                                            () {
                                              isReadingMore = !isReadingMore;
                                            },
                                          );
                                        },
                                      style: TextStyle(
                                          color: isReadingMore
                                              ? Colors.red
                                              : Colors.green,
                                          decoration: TextDecoration.underline),
                                    )
                                  ]
                                : [],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: packageContainer(context, "Recommended books"),
                      ),
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: context.screenHeight * 0.2,
                    // maxHeight: null,
                  ),
                  width: context.screenWidth,
                  // padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      object is PackageData
                          ? text("")
                          : text(object.tableOfContent),
                      200.heightBox,
                      text(object.description),
                      70.heightBox,
                    ],
                  ),
                ),
                Container(
                  height: context.screenHeight * 0.3 - 100,
                  width: context.screenWidth,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget stackedCoverView() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: context.screenHeight * 0.25,
              width: context.screenWidth * 0.4,
              color: Colors.grey.shade200,
              child: networkImage(object.image, fit: BoxFit.cover),
            ),
          ),
          bookDescription(),
        ],
      ),
    );
  }

  Widget bookDescription() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      width: context.screenWidth * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: text(
                  object.title,
                  isCentered: false,
                  maxLine: 2,
                  fontweight: FontWeight.w700,
                  fontSize: context.textTheme.headline6.fontSize,
                ),
              ),
              5.heightBox,
              Container(
                child: text(
                  object is PackageData ? "" : object.author ?? "",
                  isCentered: false,
                  maxLine: 2,
                  textColor: greyColor,
                  fontweight: FontWeight.w400,
                  fontSize: context.textTheme.subtitle2.fontSize,
                ),
              ),
            ],
          ),
          8.heightBox,
          Container(
            child: text(
              "${object.price}".toCurrency,
              isCentered: true,
              textColor: blackColor,
              maxLine: 2,
              // decoration: TextDecoration.lineThrough,
              fontweight: FontWeight.w600,
              fontSize: context.textTheme.subtitle2.fontSize,
            ),
          ),
          10.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                "Offer Price:",
                textColor: Colors.red.shade500,
                isCentered: true,
                maxLine: 2,
                fontweight: FontWeight.w700,
                fontSize: context.textTheme.subtitle1.fontSize,
              ),
              5.heightBox,
              text(
                "${object.offerPrice}".toCurrency,
                textColor: blackColor,
                isCentered: true,
                maxLine: 2,
                fontweight: FontWeight.w600,
                fontSize: context.textTheme.subtitle2.fontSize,
              ),
            ],
          ),
          10.heightBox,
          text(
            "Stock Available",
            textColor: colorPrimary,
            isCentered: true,
            maxLine: 2,
            fontweight: FontWeight.w800,
            decoration: TextDecoration.underline,
            fontSize: context.textTheme.subtitle1.fontSize,
          ),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //
              customButton(
                "Buy Now",
                Colors.red,
                () => push(
                  context,
                  CheckoutView(item: object),
                ),
              ),

              customButton(
                "Add to Cart",
                Colors.orange,
                () async {
                  await CartViewModel().addToCart(object);
                  push(
                    context,
                    CartView(),
                  );
                },
              ),
            ],
          ),
          5.heightBox,
          // Container(
          //   alignment: Alignment.centerRight,
          //   decoration: BoxDecoration(
          //       // border: Border.all(
          //       //   color: greyColor,
          //       // ),
          //       // borderRadius: borderRadius(),
          //       ),
          //   padding: EdgeInsets.all(8.0),
          //   child: text("Specifications"),
          // ),
        ],
      ),
    );
  }

  Widget customButton(String title, Color color, Function onPressedAction) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: InkWell(
        onTap: onPressedAction,
        child: Container(
          height: 35.0,
          width: context.screenWidth / 4.5,
          padding: EdgeInsets.all(2.0),
          color: color,
          child: Center(
            child: text(
              " $title",
              textColor: whiteColor,
              isCentered: true,
              // maxLine: 1,
              height: 1.0,
              fontweight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

final String loremText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed risus eget tellus tincidunt malesuada ut at risus. Duis vehicula arcu ac facilisis consectetur. Curabitur congue, justo id tristique iaculis, metus sem cursus nisi, aliquet rutrum nunc ex at risus. Sed tristique, ex nec ultrices dignissim, orci enim pulvinar nisi, ac varius purus ante non sapien. Aenean ac elementum risus. Sed arcu ipsum, malesuada non venenatis vel, malesuada vitae odio. Mauris egestas augue enim, ut hendrerit ipsum sagittis eget. Proin volutpat eget erat at molestie. Ut suscipit, eros eget vehicula tristique, nisi lorem mollis justo, ut blandit eros risus at quam.Donec arcu ipsum, pharetra et convallis vitae, volutpat ac est. Integer aliquet est lectus. Nulla id nibh quis tellus malesuada posuere. Morbi porttitor at neque eu accumsan. Vestibulum accumsan fringilla quam at convallis. Vivamus sed metus quis est aliquam volutpat. Sed ut sem lacinia, lacinia enim vulputate, tempus arcu. Sed cursus ipsum eu purus commodo elementum. Ut elit mi, auctor quis sagittis feugiat, efficitur in ipsum. Proin tellus orci, porttitor at laoreet ut, dictum ut lorem.Sed et sollicitudin ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas porttitor ac metus id iaculis. Donec at odio molestie, maximus risus in, efficitur nisi. Integer eget magna eleifend, varius turpis vel, tempor felis. Morbi at nisl auctor, sodales velit et, ultrices nibh. Aliquam ut lorem ultrices, sollicitudin leo in, egestas tortor. Phasellus ut orci non nibh pretium congue ut vitae augue. Ut convallis, ante id vehicula rhoncus, libero nibh dapibus diam, a dignissim libero purus eget diam. Aliquam quis neque eget turpis fermentum rhoncus. Vestibulum lacinia metus erat, ut maximus enim dapibus vel. Vestibulum feugiat, magna id venenatis accumsan, velit quam ullamcorper dui, eu maximus risus mi a magna. Donec elit eros, laoreet eu nisl et, bibendum viverra lectus.";
