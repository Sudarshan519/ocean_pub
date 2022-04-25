import 'package:flutter/material.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/reusable_widgets/elevated_stacked_image.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class BookDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: appBarWithSearch(context),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(context.screenWidth * 0.05),
          width: context.screenWidth * 0.95,
          height: context.screenHeight,
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Flex(
              direction: Axis.vertical,
              children: [
                FittedBox(
                  child: StackedElevatedImage(
                    detailsWidget: detailWidget(context),
                  ),
                ),
                15.heightBox,
                headingAndDetail(context, title: "About the book"),
                15.heightBox,
                headingAndDetail(context, title: "How to read it?"),
                15.heightBox,
                headingAndDetail(context, title: "Feedback", isFeedBack: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container headingAndDetail(BuildContext context,
      {String title, bool isFeedBack = false}) {
    return Container(
      child: Column(
        children: [
          Container(
            height: context.screenWidth * 0.15,
            width: context.screenWidth,
            padding: EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius: borderRadius(),
            ),
            alignment: Alignment.centerLeft,
            child: text(
              "$title",
              textColor: whiteColor,
              fontweight: FontWeight.w600,
              fontSize: context.textTheme.headline6.fontSize,
            ),
          ),
          10.heightBox,
          if (!isFeedBack) ...[
            Container(
              width: context.screenWidth * 0.95,
              padding: EdgeInsets.all(5.0),
              child: text(
                "The quick brown fox jumps over little lazy dog is very poor jhgjhg" *
                    20,
                maxLine: 50,
                fontSize: context.textTheme.subtitle2.fontSize,
              ),
            ),
          ],
          if (isFeedBack) ...[
            Column(
              children: [
                textField(
                  hintText: "Share your views about this book",
                  maxLines: 6,
                ),
                5.heightBox,
                // ActionButton(
                //   title: "Submit",
                //   showRadius: true,
                // )
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget detailWidget(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.all(constraints.maxWidth * 0.05),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                "Book name",
                fontweight: FontWeight.w600,
                fontSize: context.textTheme.headline6.fontSize,
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
              // ActionButton(
              //   title: "Read now",
              // )
            ],
          ),
        ),
      );
    });
  }
}
