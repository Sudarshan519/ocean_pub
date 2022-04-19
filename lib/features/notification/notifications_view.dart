import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithSearch(context, title: 'Dashboard'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Flex(
          direction: Axis.vertical,
          children: [
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                stackedView(context, count: 3, title: "Saved\nCourses"),
                stackedView(context, count: 5, title: "Purchased\nCourses"),
              ],
            ),
            (context.screenHeight * 0.05).heightBox,
            Flexible(
              child: ClipRRect(
                borderRadius: borderRadius(),
                child: Container(
                  width: context.screenWidth * 0.85,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      detailsDisplayWidget(
                        context,
                        FittedBox(
                          child: text(
                            "Notifications",
                            textColor: whiteColor,
                            fontSize: context.textTheme.headline6.fontSize,
                            fontweight: FontWeight.w600,
                            isCentered: true,
                          ),
                        ),
                        color: colorPrimary,
                        height: context.screenHeight * 0.085,
                        width: context.screenWidth * 0.85,
                      ),
                      Flexible(
                        flex: 1,
                        child: Scrollbar(
                          thickness: 4.0,
                          radius: Radius.circular(2.0),
                          child: ListView.builder(
                            itemBuilder: (context, index) => detailsIconAndText(
                              context,
                              title: "Nepali Natak",
                              subtitle: "Utsav Ghimire",
                              timeago: "3 hours ago",
                              isNew: index.isEven,
                            ),
                            itemCount: 4,
                            shrinkWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget detailsIconAndText(BuildContext context,
      {String title, String subtitle, String timeago, bool isNew = false}) {
    return detailsDisplayWidget(
      context,
      Container(
        // color: Colors.red,
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            // color: Colors.red,

            padding: EdgeInsets.fromLTRB(15.0, 3.0, 5.0, 3.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FlutterIcons.bell_mco,
                      color: colorPrimary,
                      size: 25.0,
                    ),
                    15.widthBox,
                    Container(
                      // width: context.screenWidth * 0.4,
                      height: constraints.maxHeight * 0.9,
                      // color: Colors.red,
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              "$title",
                              maxLine: 2,
                              textColor: Colors.black,
                              fontweight: FontWeight.w600,
                              fontSize: context.textTheme.subtitle2.fontSize,
                            ),
                            text(
                              "$subtitle",
                              maxLine: 1,
                              fontweight: FontWeight.w400,
                              textColor: Colors.black,
                              fontSize: context.textTheme.caption.fontSize,
                            ),
                            text(
                              "$timeago",
                              maxLine: 1,
                              fontweight: FontWeight.w300,
                              textColor: Colors.black,
                              fontSize: context.textTheme.caption.fontSize - 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (isNew) ...[
                  Positioned(
                    right: 5.0,
                    top: 15.0,
                    child: Container(
                      // height: 10.0,
                      // width: 10.0,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: text(
                        "New",
                        textColor: Colors.red,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
      height: context.screenHeight * 0.085,
      width: context.screenWidth * 0.85,
    );
  }

  Widget stackedView(BuildContext context, {int count, String title}) {
    return Container(
      height: context.screenHeight * 0.15,
      width: context.screenWidth * 0.3,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                height: constraints.maxHeight - 15,
                width: constraints.maxWidth - 10,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: borderRadius(),
                ),
              ),
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Container(
                height: constraints.maxHeight - 15,
                width: constraints.maxWidth - 10,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: borderRadius(),
                  border: Border.all(color: colorPrimary),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.25,
                      width: constraints.maxWidth * 0.85,
                      child: Center(
                        child: FittedBox(
                          child: text(
                            "$count",
                            fontSize: context.textTheme.headline4.fontSize,
                            fontweight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.35,
                      width: constraints.maxWidth * 0.85,
                      // color: Colors.red,
                      child: Center(
                        child: FittedBox(
                          child: text(
                            "$title",
                            fontSize: context.textTheme.subtitle1.fontSize,
                            fontweight: FontWeight.w700,
                            isCentered: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
