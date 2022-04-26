// import 'package:flutter/material.dart';
// import 'package:publication_app/models/view_all_response.dart';
// import 'package:publication_app/utils/assets.dart';
// import 'package:publication_app/utils/colors.dart';
// import 'package:publication_app/utils/widgets.dart';
// import 'package:velocity_x/velocity_x.dart';

// class CategoriesDrawer extends StatefulWidget {
//   final Function(int categoryId) onCategoryTapped;
//   final Data results;

//   CategoriesDrawer({this.onCategoryTapped, this.results});

//   @override
//   _CategoriesDrawerState createState() => _CategoriesDrawerState();
// }

// class _CategoriesDrawerState extends State<CategoriesDrawer> {
//   int expandedTile;
//   int childExpandedTile;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Drawer(
//         child: Flex(
//           direction: Axis.vertical,
//           children: [
//             Container(
//               height: context.screenHeight * 0.2,
//               width: double.infinity,
//               color: colorPrimary,
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 12.0),
//                     child: assetimage(logo, height: 110),
//                   ),
//                   Container(
//                     alignment: Alignment.bottomLeft,
//                     padding: EdgeInsets.only(left: 12.0, bottom: 12.0),
//                     child: text(
//                       "Categories",
//                       textColor: Colors.white,
//                       fontSize: context.textTheme.headline6.fontSize,
//                       fontweight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 key: Key('builder ${expandedTile.toString()}'),
//                 physics: BouncingScrollPhysics(),
//                 itemCount: widget.results.categories?.length,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return buildExpansionTile(
//                     widget.results?.categories[index],
//                     index == expandedTile,
//                     index,
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: context.screenHeight * 0.1),
//               child: ActionChip(
//                 onPressed: () {
//                   widget.onCategoryTapped(null);
//                 },
//                 backgroundColor: colorPrimary,
//                 label: text(
//                   "Clear all",
//                   textColor: whiteColor,
//                   fontweight: FontWeight.w600,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildExpansionTile(
//       Category category, bool initiallyExpanded, int index) {
//     return category != null
//         ? ExpansionTile(
//             initiallyExpanded: initiallyExpanded,
//             backgroundColor:
//                 initiallyExpanded ? Colors.grey.shade200 : Colors.white,
//             onExpansionChanged: (bool value) {
// //
//               setState(() {
//                 if (value) {
//                   if (index != null) {
//                     expandedTile = index;
//                   }
//                 } else {
//                   expandedTile = null;
//                 }
//               });
//             },
//             key: Key("$expandedTile"),
//             title: Container(
//               color: index != null && initiallyExpanded ? colorPrimary : null,
//               constraints: BoxConstraints.expand(
//                 height: 35.0,
//                 width: double.infinity,
//               ),
//               child: Center(
//                 child: text(
//                   "${category.title}",
//                   textColor: !initiallyExpanded ? colorPrimary : Colors.white,
//                   fontweight: FontWeight.bold,
//                   fontSize: context.textTheme.subtitle1.fontSize,
//                 ),
//               ),
//             ),
//             children: category.childs.map(
//               (parentCategory) {
//                 if (parentCategory.childs.length > 0) {
// //
//                   return Padding(
//                     padding: EdgeInsets.only(left: 12.0),
//                     child: buildExpansionTile(parentCategory, false, null),
//                   );
//                 } else {
//                   return InkWell(
//                     onTap: () {
//                       widget.onCategoryTapped(parentCategory.id);
//                     },
//                     child: Container(
//                       padding: EdgeInsets.only(left: 24.0),
//                       alignment: Alignment.centerLeft,
//                       child: Padding(
//                         padding: EdgeInsets.all(12.0),
//                         //second level title
//                         child: text(
//                           "${parentCategory.title}",
//                           fontSize: context.textTheme.subtitle1.fontSize,
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ).toList(),
//           )
//         : Container();
//   }
// }
