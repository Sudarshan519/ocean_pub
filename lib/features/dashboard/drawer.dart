import 'package:flutter/material.dart';
import 'package:publication_app/features/allcourses/allcourses_view.dart';
import 'package:publication_app/features/authentication/auth_presenter.dart';
import 'package:publication_app/features/authors/authors_view.dart';
import 'package:publication_app/features/bookdetail/book_detail_view.dart';
import 'package:publication_app/features/distributors/distributors_view.dart';
import 'package:publication_app/features/lets_explore/lets_explore_view.dart';
import 'package:publication_app/features/notification/notifications_view.dart';
import 'package:publication_app/features/profile/profile_view.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerView extends StatelessWidget {
  final List<String> _categories = [
    'Book',
    'Video',
    'Package',
    'Authors', // 'Saved Courses',
    'Distributors',
    // 'All Courses',
    // 'Library',
    // "Dashboard",
    // 'History',
    // 'Profile',
    'Logout',
  ];
  final List<Widget> navigate = [
    //
    LetsExploreView(type: "book"),
    LetsExploreView(type: "video"),
    LetsExploreView(type: "package"),
    AuthorsView(),
    // AllCoursesView(),
    DistributorView(),
    // NotificationView(),
    // UserProfileView(),
    // AllCoursesView(),
    AuthPresenter(),
  ];
  final List<String> icons = [
    //
    bookIcon,
    videoIcon,
    packageIcon,

    // favouriteIcon,
    // settingIcon,
    libraryIcon,
    logo,
    // profileIcon,
    // logoutIcon,
    logoutIcon,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.6,
      child: Drawer(
        // color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            // UserAccountsDrawerHeader(
            //     accountName: Text("Ocean Publication"),
            //     accountEmail: Text("www.oceanpublication.com.np")),
            Container(
              //
              height: context.screenHeight * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(authBackgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  assetimage(logo),
                  // 10.heightBox,
                  // text(
                  //   "Ocean ",
                  //   fontweight: FontWeight.w700,
                  //   fontSize: context.textTheme.headline6.fontSize,
                  // ),
                  // text(
                  //   "Publication Pvt. Ltd.",
                  //   textColor: Colors.white,
                  //   fontweight: FontWeight.w600,
                  //   fontSize: context.textTheme.subtitle1.fontSize,
                  // ),
                  5.heightBox,
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // separatorBuilder: (ctx, i) => Divider(),
              itemBuilder: (ctx, i) {
                return Container(
                  height: context.screenHeight * 0.075,
                  padding: EdgeInsets.only(left: context.screenWidth * 0.045),
                  child: InkWell(
                    child: Row(
                      children: [
                        icon(
                          icons[i] ?? settingIcon,
                          height: 80.0,
                        ),
                        20.widthBox,
                        text(
                          _categories[i],
                          fontSize: context.textTheme.subtitle1.fontSize,
                          fontweight: FontWeight.w600,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => navigate[i] ?? AllCoursesView(),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: _categories.length,
            ),
          ],
        ),
      ),
    );
  }
}
