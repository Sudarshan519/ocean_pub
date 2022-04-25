import 'package:flutter/material.dart';
import 'package:publication_app/features/cart/cart_view.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/functions.dart';
import 'package:publication_app/utils/widgets.dart';

Widget appBarWithSearch(BuildContext context,
        {TextTheme theme, String title}) =>
    AppBar(
      backgroundColor: Colors.blue.shade700,
      centerTitle: true,
      // title: Text(
      //   "$title",
      //   style: TextStyle(
      //     fontSize: theme.headline6.fontSize,
      //     fontWeight: FontWeight.w500,
      //   ),
      // ),
      title: Container(
        height: 40.0,
        padding: EdgeInsets.only(
          bottom: 5.0,
        ),
        alignment: Alignment.topCenter,
        child: TextField(
          style: TextStyle(color: colorPrimary, fontSize: 12.0),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 16,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: colorPrimary,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
            hintText: "Search",
            enabledBorder: outlineInputBorder(radius: 8.0),
            border: outlineInputBorder(radius: 8.0),
            focusedBorder: outlineInputBorder(radius: 8.0),
          ),
        ),
      ),
      actions: [
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 10.0),
        //   child: InkWell(
        //       splashColor: Colors.transparent,
        //       onTap: () {
        //         //apply search
        //         print("search");
        //       },
        //       child: Icon(CupertinoIcons.person_alt_circle)),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                //open bag

                push(
                  context,
                  CartView(),
                );
              },
              child: Icon(Icons.shopping_cart)),
        ),
      ],
    );
