import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:publication_app/features/authors/authors_viewmodel.dart';
import 'package:publication_app/utils/reusable_widgets/elevated_stacked_image.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AuthorsViewmodel>(
      onModelReady: (vm) async {
        await vm.getAuthors();
      },
      viewModel: AuthorsViewmodel(),
      builder: (context, viewmodel, _) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: appBarWithSearch(context, title: 'Authors'),
          body: AnimationLimiter(
              child: viewmodel.authors == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: viewmodel.authors.data.length,
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 700),
                            child: SlideAnimation(
                              horizontalOffset: context.screenWidth * 0.5,
                              child: FadeInAnimation(
                                child: StackedElevatedImage(
                                  image: viewmodel.authors.data[index].image,
                                  detailsWidget: NavigateToAuthorProfileButton(
                                    viewmodel.authors.data[index],
                                  ),
                                ),
                              ),
                            ),
                          ))
              //

              ),
        );
      },
    );
  }
}
