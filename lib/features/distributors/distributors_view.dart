// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:publication_app/base/base_view.dart';
// import 'package:publication_app/constant_widgets/appbarView.dart';
// import 'package:publication_app/features/distributors/distributer_viewmodel.dart';
// import 'package:publication_app/models/distributor_response.dart';
// import 'package:publication_app/utils/colors.dart';
// import 'package:publication_app/utils/reusable_widgets/elevated_stacked_image.dart';
// import 'package:publication_app/utils/widgets.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../reusable_wiidgets.dart';

// class DistributorView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BaseWidget<DistributerViewmodel>(
//       viewModel: DistributerViewmodel(),
//       onModelReady: (vm) {
//         //
//         vm.getDistributorData();
//       },
//       builder: (context, viewmodel, _) {
//         return Scaffold(
//           backgroundColor: Colors.grey.shade300,
//           appBar: appBarWithSearch(context),
//           body: viewmodel.isProcessing
//               ? SpinKitWave(
//                   itemCount: 8,
//                   color: colorPrimary,
//                 )
//               : AnimationLimiter(
//                   child: ListView.builder(
//                     // shrinkWrap: true,
//                     itemCount: viewmodel.distributorData.length,
//                     //
//                     itemBuilder: (context, index) {
//                       return AnimationConfiguration.staggeredList(
//                         position: index,
//                         duration: const Duration(milliseconds: 700),
//                         child: SlideAnimation(
//                           horizontalOffset: context.screenWidth * 0.5,
//                           child: FadeInAnimation(
//                             child: StackedElevatedImage(
//                               detailsWidget: distributorDetailsWidget(
//                                   context, viewmodel.distributorData[index]),
//                               image: viewmodel.distributorData[index].image,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//         );
//       },
//     );
//   }

//   Widget distributorDetailsWidget(
//       BuildContext context, DistributorData distributorData) {
//     return FittedBox(
//       fit: BoxFit.contain,
//       child: Container(
//         // color: Colors.red,
//         padding: EdgeInsets.symmetric(vertical: 3.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           //
//           children: [
//             //
//             Container(
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.only(left: 5.0),
//               width: context.screenWidth * 0.4,
//               child: text(
//                 "${distributorData.name}",
//                 isCentered: false,
//                 fontweight: FontWeight.w600,
//                 fontSize: context.textTheme.subtitle1.fontSize,
//               ),
//             ),

//             detailsIconAndText(
//               context,
//               title: "${distributorData.contactPerson}",
//               icon: FlutterIcons.person_outline_mdi,
//             ),
//             detailsIconAndText(
//               context,
//               title: "${distributorData.address}",
//               icon: FlutterIcons.location_oct,
//             ),
//             detailsIconAndText(
//               context,
//               title: "${distributorData.phoneNumber}",
//               icon: FlutterIcons.telephone_fou,
//               isPhone: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
