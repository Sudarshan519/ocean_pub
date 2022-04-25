// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:publication_app/base/base_view.dart';
// import 'package:publication_app/constant_widgets/appbarView.dart';
// import 'package:publication_app/features/authors/author_profile_view.dart';
// import 'package:publication_app/features/profile/profile_viewmodel.dart';
// import 'package:publication_app/utils/colors.dart';
// import 'package:publication_app/utils/reusable_widgets/elevated_stacked_image.dart';
// import 'package:publication_app/utils/widgets.dart';

// import 'package:velocity_x/velocity_x.dart';

// import '../reusable_wiidgets.dart';

// class UserProfileView extends StatelessWidget {
//   static const id = "userProfile";
//   final List<Color> bgColors = [
//     Colors.red[300],
//     Colors.green[300],
//     Colors.yellow[300],
//     Colors.amber[300],
//     Colors.purple[300],
//     Colors.pink[300],
//   ];
//   final List<String> titles = [
//     "Your data",
//     "Wishlist",
//     "Videos",
//     "E- books",
//     "Privacy policies",
//     "Help and support",
//   ];
//   final List<String> subtitles = [
//     "Update or modify your data.",
//     "Books you want to read.",
//     "Videos you have bought.",
//     "Books you have bought.",
//     "Terms and conditions.",
//     "Do you need our help?",
//   ];
//   final List<IconData> icons = [
//     Icons.person,
//     FlutterIcons.heart_ant,
//     FlutterIcons.wallet_ent,
//     FlutterIcons.share_2_fea,
//     FlutterIcons.lock_smart_mco,
//     FlutterIcons.help_circle_fea,
//   ];

//   // final List<String> routesName = [
//   //   UpdateProfile.id,
//   //   WishlistView.id,
//   //   WalletView.id,
//   //   ReferFriendView.id,
//   //   PrivacyView.id,
//   //   SupportView.id,
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return BaseWidget<ProfileViewmodel>(
//       viewModel: ProfileViewmodel(),
//       onModelReady: (vm) async {
//         await vm.getUserDetails();
//       },
//       builder: (context, viewmodel, _) {
//         return SafeArea(
//           child: Scaffold(
//             backgroundColor: Colors.grey.shade400,
//             appBar: appBarWithSearch(context),
//             body: viewmodel.isProcessing
//                 ? Center(child: CircularProgressIndicator())
//                 : Padding(
//                     padding: EdgeInsets.symmetric(vertical: 15.0),
//                     child: Column(
//                       children: [
//                         AuthorProfileView(null).imageStyleContainer(
//                           context,
//                           imageUrl: viewmodel.item.image,
//                         ),
//                         Container(
//                           width: context.screenWidth * 0.85,
//                           color: whiteColor,
//                           padding: EdgeInsets.only(
//                               bottom: context.screenHeight * 0.1),
//                           child: Column(
//                             children: [
//                               ActionButton(
//                                 title: "Edit Profile",
//                               ),
//                               15.heightBox,
//                               detailsDisplayWidget(
//                                 context,
//                                 text(
//                                   "Contact Information",
//                                   textColor: whiteColor,
//                                   fontSize:
//                                       context.textTheme.subtitle1.fontSize,
//                                   fontweight: FontWeight.w600,
//                                 ),
//                                 color: colorPrimary,
//                               ),
//                               detailsDisplayWidget(
//                                 context,
//                                 detailsIconAndText(
//                                   context,
//                                   title: viewmodel.item.firstName ?? "",
//                                   icon: FlutterIcons.user_ant,
//                                 ),
//                               ),
//                               detailsDisplayWidget(
//                                 context,
//                                 detailsIconAndText(
//                                   context,
//                                   title: viewmodel.item.email ?? "",
//                                   icon: FlutterIcons.email_mco,
//                                 ),
//                               ),
//                               detailsDisplayWidget(
//                                 context,
//                                 detailsIconAndText(
//                                   context,
//                                   title: viewmodel.item.phone ?? "",
//                                   icon: Icons.phone,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }
