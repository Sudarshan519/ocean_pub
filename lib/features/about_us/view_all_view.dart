import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/features/about_us/view_all_viewmodel.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/reusable_widgets/elevated_stacked_image.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:publication_app/utils/extensions.dart';
import 'categories_drawer.dart';

class ViewAllView extends StatelessWidget {
  final Object type;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ViewAllView({Key key, @required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ViewAllViewmodel>(
      viewModel: ViewAllViewmodel(),
      onModelReady: (vm) {
        vm.getAllData(type);
      },
      builder: (context, viewmodel, _) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: CategoriesDrawer(
            results: viewmodel.results,
            onCategoryTapped: (int categoryId) {
              viewmodel.changeActiveActegory(categoryId);
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.grey.shade300,
          appBar: appBarWithSearch(context, title: 'Books'),
          body: viewmodel.isProcessing
              ? SpinKitWave(
                  itemCount: 8,
                  color: colorPrimary,
                )
              : Flex(
                  direction: Axis.vertical,
                  children: [
                    Container(
                      color: whiteColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                            viewmodel.datatype.capitalizeFirstofEach,
                            fontweight: FontWeight.w600,
                            fontSize: context.textTheme.subtitle1.fontSize,
                          ),
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState.openDrawer();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  FlutterIcons.filter_fou,
                                  color: colorPrimary,
                                ),
                                text(
                                  "Filter",
                                  fontweight: FontWeight.w600,
                                  fontSize:
                                      context.textTheme.subtitle1.fontSize,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    viewmodel.items.length > 0
                        ? Flexible(
                            child: AnimationLimiter(
                              child: ListView.builder(
                                  itemCount: viewmodel.items.length,
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: Duration(milliseconds: 700),
                                      child: SlideAnimation(
                                        horizontalOffset:
                                            context.screenWidth * 0.5,
                                        child: FadeInAnimation(
                                          child: StackedElevatedImage(
                                            detailsWidget:
                                                BookDetailsWidgetForElevatedDisplay(
                                              item: viewmodel.items[index],
                                            ),
                                            image: viewmodel.items[index].image,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(12.0),
                            child: text("Please select another category"),
                          ),
                  ],
                ),
        );
      },
    );
  }
}
