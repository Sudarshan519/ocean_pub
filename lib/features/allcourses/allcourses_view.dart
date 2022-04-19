import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/features/bookdetail/book_detail_view.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/functions.dart';
import 'package:publication_app/utils/reusable_widgets/elevated_stacked_image.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:publication_app/utils/extensions.dart';

class AllCoursesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: appBarWithSearch(context, title: "All courses"),
      // body: Container(
      //   padding: EdgeInsets.all(5.0),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         //

      //         ...List.generate(
      //           5,
      //           (index) => StackedElevatedImage(
      //             detailsWidget: detailsWidget(context),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            color: whiteColor,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text(
                  "All Courses",
                  fontweight: FontWeight.w600,
                  fontSize: context.textTheme.subtitle1.fontSize,
                ),
                Row(
                  children: [
                    Icon(
                      FlutterIcons.filter_fou,
                      color: colorPrimary,
                    ),
                    text(
                      "Filter",
                      fontweight: FontWeight.w600,
                      fontSize: context.textTheme.subtitle1.fontSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: AnimationLimiter(
              child: ListView(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  //
                  children: List.generate(
                    50,
                    (index) => AnimationConfiguration.staggeredList(
                      position: index,
                      duration: Duration(milliseconds: 700),
                      child: SlideAnimation(
                        horizontalOffset: context.screenWidth * 0.5,
                        child: FadeInAnimation(
                          child: StackedElevatedImage(
                            detailsWidget: detailsWidget(context),
                          ),
                        ),
                      ),
                    ),
                  )
                  //

                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget detailsWidget(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        child: Container(
          width: constraints.maxWidth * 0.95,
          padding: EdgeInsets.all(constraints.maxWidth * 0.05),
          child: FittedBox(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                text(
                  "Package name",
                  fontweight: FontWeight.w600,
                  fontSize: context.textTheme.headline6.fontSize,
                ),
                3.heightBox,
                text(
                  "5".toCurrency,
                  textColor: greyColor,
                  fontweight: FontWeight.w300,
                  fontSize: context.textTheme.subtitle1.fontSize,
                ),
                3.heightBox,
                text(
                  "5 Reviews",
                  textColor: greyColor,
                  fontweight: FontWeight.w300,
                  fontSize: context.textTheme.subtitle2.fontSize,
                ),
                Row(
                  children: [1, 2, 3, 4, 5]
                      .map((e) => Icon(
                            Icons.star,
                            size: 15.0,
                            color: e <= 3 ? Colors.orange : greyColor,
                          ))
                      .toList(),
                ),
                5.heightBox,
                ActionButton(
                  title: "View",
                  color: Colors.orange,
                  onTapped: () {
                    push(context, BookDetailView());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
