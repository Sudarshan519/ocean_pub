import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:publication_app/features/authors/author_profile_view.dart';
import 'package:publication_app/features/cart/cart_view.dart';
import 'package:publication_app/features/cart/cart_viewmodel.dart';
import 'package:publication_app/features/checkout/checkout_view.dart';
import 'package:publication_app/features/reusable_wiidgets.dart';
import 'package:publication_app/models/authors.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/models/view_all_response.dart';
import '../extensions.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/functions.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class StackedElevatedImage extends StatelessWidget {
  final Widget detailsWidget;
  final double height;
  final String image;

  StackedElevatedImage({Key key, this.detailsWidget, this.height, this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: stackedDetailsView(context),
    );
  }

  Widget stackedDetailsView(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: height ?? context.screenHeight * 0.25,
      child: Stack(
        children: [
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Container(
              width: context.screenWidth,
              height: context.screenHeight * 0.168,
              padding: EdgeInsets.only(left: context.screenWidth * 0.2),
              child: Container(
                height: context.screenHeight * 0.15,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(context.screenWidth * 0.015),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: context.screenWidth * 0.25),
                  child: detailsWidget,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 10.0,
            child: imageBuilder(context),
          ),
        ],
      ),
    );
  }

  Widget imageBuilder(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: context.screenWidth * 0.34,
        height: context.screenHeight * 0.18,
        color: Colors.white,
        child: CachedNetworkImage(
          imageUrl: image.contains('https://oceanpublication.com.np/')
              ? image
              : "https://oceanpublication.com.np/$image",
          placeholder: (context, _) => Image.asset("assets/icons/profile.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Positioned detailsContainer(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      right: 10.0,
      child: Container(
        //Inner container5
        width: context.screenWidth * 0.75,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(context.screenWidth * 0.025),
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            //just empty container to maintain alignment of row
            Container(
              width: context.screenWidth * 0.2,
              height: 20.0,
            ),
            detailsWidget,
          ],
        ),
        //inner Container
      ),
    );
  }
}

class BookDetailsWidgetForElevatedDisplay extends StatelessWidget {
  final dynamic item;

  const BookDetailsWidgetForElevatedDisplay({Key key, @required this.item})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.4,
      padding: EdgeInsets.all(4.0),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //
            text(
              item.title,
              fontweight: FontWeight.w600,
              fontSize: context.textTheme.subtitle1.fontSize,
            ),
            5.heightBox,
            text(
              item is PackageData ? "" : item.author,
              textColor: greyColor,
              fontweight: FontWeight.w300,
              fontSize: context.textTheme.caption.fontSize,
            ),
            8.heightBox,
            Row(
              children: [
                text(
                  "${item.price}".toCurrency,
                  textColor: greyColor,
                  fontweight: FontWeight.w300,
                  decoration: TextDecoration.lineThrough,
                  fontSize: context.textTheme.subtitle1.fontSize,
                ),
                8.widthBox,
                text(
                  "${item.offerPrice}".toCurrency,
                  textColor: blackColor,
                  fontweight: FontWeight.w500,
                  fontSize: context.textTheme.subtitle1.fontSize,
                ),
              ],
            ),
            8.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //
                ActionButton(
                  title: "Add to cart",
                  color: Colors.red,
                  width: context.screenWidth * 0.2,
                  onTapped: () async {
                    await CartViewModel().addToCart(item);
                    push(context, CartView());
                  },
                ),
                8.widthBox,
                ActionButton(
                  title: "Buy Now",
                  color: Colors.orange,
                  width: context.screenWidth * 0.2,
                  onTapped: () async {
                    push(context, CheckoutView(item: item));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavigateToAuthorProfileButton extends StatelessWidget {
  final AuthorData _authorData;

  NavigateToAuthorProfileButton(this._authorData);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenWidth * 0.07,
        bottom: context.screenWidth * 0.02,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: context.screenWidth * 0.4,
            child: text(
              "${_authorData.name}",
              isCentered: true,
              fontweight: FontWeight.w700,
              fontSize: context.textTheme.headline6.fontSize,
            ),
          ),
          10.heightBox,
          ActionButton(
            onTapped: () {
              push(
                context,
                AuthorProfileView(_authorData),
              );
            },
            title: "View Profile",
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onTapped;
  final double height;
  final double width;
  final bool showRadius;
  ActionButton(
      {Key key,
      this.color,
      this.title,
      this.onTapped,
      this.height,
      this.width,
      this.showRadius = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        width: width ?? context.screenWidth * 0.35,
        height: height ?? context.screenWidth * 0.1,
        decoration: BoxDecoration(
          color: color ?? colorPrimary,
          borderRadius: showRadius
              ? BorderRadius.circular(context.screenWidth * 0.01)
              : BorderRadius.zero,
        ),
        child: Center(
          child: text(
            "$title",
            fontweight: FontWeight.w600,
            isCentered: true,
            textColor: whiteColor,
          ),
        ),
      ),
    );
  }
}
