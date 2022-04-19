import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/features/lets_explore/lets_explore_viewmodel.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/reusable_widgets/cards.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class LetsExploreView extends StatelessWidget {
  final String type;

  LetsExploreView({Key key, this.type = "book"}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LetsExploreViewmodel>(
        viewModel: LetsExploreViewmodel(),
        onModelReady: (vm) async {
          await vm.getAllItems(type);
        },
        builder: (context, viewmodel, _) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: appBarWithSearch(context, title: "Ocean Publication"),
              body: Padding(
                padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                            viewmodel.user != null
                                ? "Hey ${viewmodel.user.firstName ?? ""}"
                                : "",
                            textColor: greyColor,
                            fontSize: context.textTheme.subtitle1.fontSize,
                            fontweight: FontWeight.w700,
                          ),
                          5.heightBox,
                          text(
                            "Let's Explore",
                            textColor: colorPrimary,
                            fontSize: context.textTheme.headline5.fontSize,
                            fontweight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),

                    10.heightBox,
                    viewmodel.isProcessing
                        ? SpinKitChasingDots(color: colorPrimary)
                        : Flexible(
                            child: ListView.builder(
                              itemCount: viewmodel.letsExploreData.items.length,
                              // shrinkWrap: true,
                              itemBuilder: (context, index) => packageContainer(
                                context,
                                viewmodel.letsExploreData.items[index],
                                isElevated: false,
                                showViewmore: false,
                              ),
                            ),
                          ),

                    // packageContainer(context, "Trending $type",
                    //     isElevated: false, showViewmore: false),
                    // packageContainer(context, "Exciting $type",
                    // isElevated: false, showViewmore: false),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
