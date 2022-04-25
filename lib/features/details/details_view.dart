import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/features/cart/cart_view.dart';
import 'package:publication_app/features/cart/cart_viewmodel.dart';
import 'package:publication_app/features/checkout/checkout_view.dart';
import 'package:publication_app/models/book.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/functions.dart';
import 'package:publication_app/utils/requests.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:publication_app/utils/extensions.dart';

class DetailsView extends StatefulWidget {
  final dynamic object;
  // final String type;
  const DetailsView(
    this.object,
  );
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
  var book;
  bool isReadingMore = false;
  var loading = true;
  @override
  void initState() {
    super.initState();

    getData();
    object = widget.object;
  }

  getData() async {
    var type = (widget.object.type);
    var slug = widget.object.slug;
    print(type);
    // print(object.type);
    var bdata = await getRequest("/${type}" + "/$slug");
    // if (object.type == "book") {
    var bookApi = (jsonDecode(bdata.body));
    if (type == "book") {
      book = bookApiFromJson(bdata.body);
    } else {
      book = bookApi;
    }

    loading = false;
    // } else {
    //   // var bdata = await getRequest(
    //   //     "/${widget.type == "package" ? "package" : "books"}" + "/$slug");
    //   // BookApi bookApi = bookApiFromJson(bdata.body);

    //   // book = bookApi;
    //   // loading = false;
    //   // print(book);
    // }
    setState(() {});
    // print(bookApi.data.relatedProducts);
    // BookData data = widget.object;
    // print(data.toMap().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // appBar: appBarWithSearch(
      //   context,
      //   title: "Half-girlfriend",
      // ),
      body: SafeArea(
        child: loading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // direction: Axis.vertical,
                  children: [
                    // stackedCoverView(),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                object.image,
                                // fit: BoxFit.fitHeight,
                              )),
                        ),
                        bookDescription(),
                      ],
                    ),
                    // 20.heightBox,
                    description(),
                    10.heightBox,
                  ],
                ),
              ),
      ),
    );
  }

  description() {
    if (widget.object.type == "book") {
      BookApi bookApi = book;
      Book bookData = bookApi.data.book;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Expanded(child: networkImage(bookData.image)),
          //     Expanded(
          //         child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Column(
          //         children: [
          //           Text(
          //             bookApi.data.book.title.toString(),
          //           ),
          //           Text(
          //             bookData.author,
          //             textAlign: TextAlign.justify,
          //           ),
          //           Text("Rs." + bookData.price.toString()),
          //           if (bookData.offerPrice.toString() != "")
          //             Text("Rs." + bookData.offerPrice.toString()),
          //           // Text(bookData.)

          //           ElevatedButton(onPressed: () {}, child: Text("Buy Now")),

          //           ElevatedButton(onPressed: () {}, child: Text("Add to Cart"))
          //         ],
          //       ),
          //     ))
          //   ],
          // ),
          // Text(bookApi.data.childCategory.toJson().toString()),
          // Text(bookApi.data.feedbacks.toString()),
          // Text(bookApi.data.relatedProducts.toString()),
        ],
      );
    } else {
      return Text(book.toString());
    }
    // return DefaultTabController(
    //   initialIndex: 0,
    //   length: 3,
    //   child: Column(
    //     // direction: Axis.vertical,
    //     children: [
    //         TabBar(
    //           onTap: (int indx) {
    //             setState(() {
    //               activeIndex = indx;
    //             });
    //           },
    //           labelColor: colorPrimary,
    //           unselectedLabelColor: blackColor,
    //           tabs: _tabBarTitles.map(
    //             (String title) {
    //               int elementIndex = _tabBarTitles.indexOf(title);
    //               return Tab(
    //                 child: text(
    //                   "$title",
    //                   textColor: activeIndex == elementIndex
    //                       ? colorPrimary
    //                       : Colors.black,
    //                   isCentered: true,
    //                   maxLine: 2,
    //                   fontweight:
    //                       activeIndex == elementIndex ? FontWeight.w600 : null,
    //                   fontSize: activeIndex == elementIndex ? 16.0 : 12.0,
    //                 ),
    //               );
    //             },
    //           ).toList(),
    //         ),
    //         Container(
    //           // padding: const EdgeInsets.symmetric(horizontal: 10),
    //           width: context.screenWidth,
    //           height: isReadingMore
    //               ? context.screenHeight * 0.9
    //               : context.screenHeight * 0.62,
    //           child: TabBarView(
    //             physics: NeverScrollableScrollPhysics(),
    //             children: [
    //               SingleChildScrollView(
    //                 // physics: NeverScrollableScrollPhysics(),
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       // constraints: BoxConstraints(
    //                       //   minHeight: context.screenHeight * 0.25,
    //                       //   // maxHeight: null,
    //                       // ),
    //                       // height:
    //                       //     isReadingMore ? null : context.screenHeight * 0.35,
    //                       // padding: EdgeInsets.all(8.0),
    //                       child: RichText(
    //                         // maxLines: 2,
    //                         // overflow: TextOverflow.ellipsis,
    //                         text: TextSpan(
    //                           // TODO: replace here
    //                           // text: ((isReadingMore
    //                           //             ? object.description
    //                           //             : object.shortDescription)
    //                           //         .toString())
    //                           //     .ashtmlTags,
    //                           text: !isReadingMore
    //                               ? object.description == null
    //                                   ? ""
    //                                   // : object.description.length > 480
    //                                   //     ? object.description.substring(0, 480)
    //                                   //     :
    //                                   : object.description
    //                               : loremText,
    //                           style: TextStyle(color: Colors.grey.shade800),
    //                           //   children: object.shortDescription != null
    //                           //       ? [
    //                           //           TextSpan(
    //                           //             text: isReadingMore
    //                           //                 ? "See less"
    //                           //                 : "See More",
    //                           //             recognizer: TapGestureRecognizer()
    //                           //               ..onTap = () {
    //                           //                 setState(
    //                           //                   () {
    //                           //                     isReadingMore = !isReadingMore;
    //                           //                   },
    //                           //                 );
    //                           //               },
    //                           //             style: TextStyle(
    //                           //                 color: isReadingMore
    //                           //                     ? Colors.red
    //                           //                     : Colors.green,
    //                           //                 decoration: TextDecoration.underline),
    //                           //           )
    //                           //         ]
    //                           //       : [],
    //                         ),
    //                       ),
    //                     ),
    //                     20.heightBox,
    //                     Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.all(10.0),
    //                             child: Row(
    //                               children: [
    //                                 Text(
    //                                   "Recommended Books",
    //                                   style: TextStyle(
    //                                       fontSize: 18,
    //                                       fontWeight: FontWeight.bold,
    //                                       color: Colors.grey.shade800),
    //                                 ),
    //                                 Spacer()
    //                               ],
    //                             ),
    //                           ),
    //                           18.heightBox,
    //                           SingleChildScrollView(
    //                               scrollDirection: Axis.horizontal,
    //                               child: Row(
    //                                 children: List.generate(
    //                                     object.relatedProducts.length,
    //                                     (i) => GestureDetector(
    //                                           onTap: () => push(
    //                                               context,
    //                                               DetailsView(
    //                                                 object.relatedProducts[i],
    //                                               )),
    //                                           child: Container(
    //                                             width: 180,
    //                                             margin:
    //                                                 const EdgeInsets.symmetric(
    //                                                     horizontal: 18),
    //                                             child: Column(
    //                                               crossAxisAlignment:
    //                                                   CrossAxisAlignment.start,
    //                                               children: [
    //                                                 ClipRRect(
    //                                                   borderRadius:
    //                                                       BorderRadius.circular(
    //                                                           16),
    //                                                   child: Container(
    //                                                     decoration: BoxDecoration(
    //                                                       image: DecorationImage(
    //                                                           image: NetworkImage(
    //                                                               object
    //                                                                   .relatedProducts[
    //                                                                       i]
    //                                                                   .image),
    //                                                           fit: BoxFit.fill),
    //                                                       color: Colors.grey,
    //                                                       borderRadius:
    //                                                           BorderRadius
    //                                                               .circular(16),
    //                                                     ),
    //                                                     height: 220,
    //                                                     width: 180,
    //                                                   ),
    //                                                 ),
    //                                                 16.heightBox,
    //                                                 Padding(
    //                                                   padding: const EdgeInsets
    //                                                           .symmetric(
    //                                                       horizontal: 10),
    //                                                   child: Text(
    //                                                     object.relatedProducts[i]
    //                                                         .title,
    //                                                     // textAlign:
    //                                                     //     TextAlign.center,
    //                                                     style: TextStyle(
    //                                                         fontSize: 16,
    //                                                         fontWeight:
    //                                                             FontWeight.w600),
    //                                                   ),
    //                                                 ),
    //                                                 3.heightBox,
    //                                                 Padding(
    //                                                   padding: const EdgeInsets
    //                                                           .symmetric(
    //                                                       horizontal: 10),
    //                                                   child: Text(
    //                                                     object.relatedProducts[i]
    //                                                         .author,
    //                                                     // textAlign:
    //                                                     //     TextAlign.center,
    //                                                     style: TextStyle(
    //                                                         fontSize: 16,
    //                                                         color: Colors.grey,
    //                                                         fontWeight: FontWeight
    //                                                             .normal),
    //                                                   ),
    //                                                 ),
    //                                                 8.heightBox,
    //                                                 Padding(
    //                                                   padding: const EdgeInsets
    //                                                           .symmetric(
    //                                                       horizontal: 10),
    //                                                   child: Row(
    //                                                     mainAxisAlignment:
    //                                                         MainAxisAlignment
    //                                                             .start,
    //                                                     children: [
    //                                                       Text(
    //                                                         "Rs. " +
    //                                                             object
    //                                                                 .relatedProducts[
    //                                                                     i]
    //                                                                 .price
    //                                                                 .toString(),
    //                                                         textAlign:
    //                                                             TextAlign.start,
    //                                                         style: TextStyle(
    //                                                             decoration: object
    //                                                                         .relatedProducts[
    //                                                                             i]
    //                                                                         .offerPrice !=
    //                                                                     'null'
    //                                                                 ? null
    //                                                                 : TextDecoration
    //                                                                     .lineThrough,
    //                                                             fontWeight:
    //                                                                 FontWeight
    //                                                                     .normal),
    //                                                       ),
    //                                                       SizedBox(
    //                                                         width: 10,
    //                                                       ),
    //                                                       if (object
    //                                                               .relatedProducts[
    //                                                                   i]
    //                                                               .offerPrice !=
    //                                                           null)
    //                                                         Text(
    //                                                           "Rs. " +
    //                                                               object
    //                                                                   .relatedProducts[
    //                                                                       i]
    //                                                                   .offerPrice
    //                                                                   .toString(),
    //                                                           textAlign:
    //                                                               TextAlign.start,
    //                                                           style: TextStyle(
    //                                                               fontWeight:
    //                                                                   FontWeight
    //                                                                       .normal),
    //                                                         ),
    //                                                     ],
    //                                                   ),
    //                                                 ),
    //                                                 10.heightBox,
    //                                                 // Text(
    //                                                 //   "SOLD OUT " +
    //                                                 //       book
    //                                                 //           .data
    //                                                 //           .relatedProducts[i]
    //                                                 //           .type
    //                                                 //           .toString(),
    //                                                 //   textAlign: TextAlign.start,
    //                                                 //   style: TextStyle(
    //                                                 //       fontWeight:
    //                                                 //           FontWeight.normal),
    //                                                 // ),
    //                                                 Padding(
    //                                                   padding: const EdgeInsets
    //                                                           .symmetric(
    //                                                       horizontal: 10),
    //                                                   child: Row(
    //                                                     mainAxisAlignment:
    //                                                         MainAxisAlignment
    //                                                             .start,
    //                                                     children: [1, 2, 3, 4, 5]
    //                                                         .map(
    //                                                           (e) => Icon(
    //                                                             Icons.star,
    //                                                             size: 15.0,
    //                                                             color: e <= 3
    //                                                                 ? Colors
    //                                                                     .orange
    //                                                                 : greyColor,
    //                                                           ),
    //                                                         )
    //                                                         .toList(),
    //                                                   ),
    //                                                 ),
    //                                                 SizedBox(
    //                                                   height: 20,
    //                                                 )
    //                                               ],
    //                                             ),
    //                                           ),
    //                                         )),
    //                               ))
    //                         ]),
    //                     SizedBox(
    //                       height: 20,
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 constraints: BoxConstraints(
    //                   minHeight: context.screenHeight * 0.2,
    //                   // maxHeight: null,
    //                 ),
    //                 width: context.screenWidth,
    //                 // padding: EdgeInsets.all(20.0),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     object is Packages
    //                         ? text("")
    //                         : text(object.tableOfContent),
    //                     200.heightBox,
    //                     text(object.description),
    //                     70.heightBox,
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 height: context.screenHeight * 0.3 - 100,
    //                 width: context.screenWidth,
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }

    // Widget stackedCoverView() {
    //   return Padding(
    //     padding: EdgeInsets.only(top: 8.0),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         ClipRRect(
    //           borderRadius: BorderRadius.circular(10.0),
    //           child: Container(
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10.0),
    //                 image: DecorationImage(
    //                     image: CachedNetworkImageProvider(object.image),
    //                     fit: BoxFit.fill)),
    //             height: 200,
    //             width: 130,
    //             // color: Colors.grey.shade200,
    //             child: networkImage(object.image, fit: BoxFit.fill),
    //           ),
    //         ),
    //         bookDescription(),
    //       ],
    //     ),
    // );
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
                  object is PackagesDatum ? "" : object.author ?? "",
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
          Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                // border: Border.all(
                //   color: greyColor,
                // ),
                // borderRadius: borderRadius(),
                ),
            padding: EdgeInsets.all(8.0),
            child: text("Specifications"),
          ),
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
