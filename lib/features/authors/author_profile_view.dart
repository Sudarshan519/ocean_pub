import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/features/details/details_view.dart';
import 'package:publication_app/features/publications/details_view.dart';
import 'package:publication_app/models/authors.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/functions.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthorProfileView extends StatelessWidget {
  final AuthorData authorData;

  AuthorProfileView(this.authorData);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: appBarWithSearch(
          context,
          title: "Utsav Ghimire",
        ),
        body: Container(
          padding: EdgeInsets.only(top: 1.0),
          child: SingleChildScrollView(
            child: Column(
              //
              children: [
                //
                imageStyleContainer(
                  context,
                ),
                Container(
                  color: whiteColor,
                  width: context.screenWidth * 0.85,
                  padding: EdgeInsets.only(bottom: 45.0),
                  child: Column(
                    children: [
                      Container(
                        height: context.screenHeight * 0.065,
                        width: context.screenWidth * 0.75,
                        color: colorPrimary,
                        child: Center(
                          child: text(
                            "Subjects",
                            fontSize: context.textTheme.headline6.fontSize,
                            textColor: whiteColor,
                          ),
                        ),
                      ),
                      if (authorData.books != null)
                        // if (authorData.books.length > 0)
                        ...List.generate(
                          authorData.books.length,
                          (index) => InkWell(
                            onTap: () {
                            //   push(
                            //       context,
                            //       DetailsView(
                            //           authorData.books[index], "books"));
                          },
                            child: Container(
                              height: context.screenHeight * 0.06,
                              width: context.screenWidth * 0.75,
                              color: index.isEven
                                  ? Colors.grey.shade300
                                  : greyColor,
                              child: Center(
                                child: text(
                                  "${authorData.books[index].title}",
                                  fontSize:
                                      context.textTheme.subtitle1.fontSize,
                                  textColor: blackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageStyleContainer(BuildContext context, {String imageUrl}) {
    return Container(
      height: context.screenHeight * 0.3,
      width: context.screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            //
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: context.screenHeight * 0.2,
                width: context.screenWidth * 0.85,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: context.screenHeight * 0.035,
                    ),
                    child: Container(
                      child: text(
                        authorData.name,
                        fontweight: FontWeight.w800,
                        fontSize: context.textTheme.headline6.fontSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(context.screenWidth * 0.02),
                  child: Container(
                    height: context.screenHeight * 0.2,
                    width: context.screenWidth * 0.35,
                    child: Container(
                      height: context.screenHeight * 0.2,
                      child: CachedNetworkImage(
                        imageUrl: authorData.image,
                        placeholder: (context, _) => Image.asset(profileIcon),
                        fit: BoxFit.cover,
                        // httpHeaders: {
                        //   "X-Authorization": "",
                        // },
                      ),
                      // child: imageUrl != null
                      //     ? Image.network(imageUrl)
                      //     : Image.asset(profileIcon),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
