import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/controllers/home_controller.dart';
import 'package:publication_app/features/dashboard/drawer.dart';
import 'package:publication_app/features/dashboard/homepage/categories_page.dart';
// import 'package:publication_app/features/dashboard/homepage/homepage_viewmodel.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/reusable_widgets/cards.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomepageView extends StatefulWidget {
  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  final HomeController controller = Get.put(HomeController());
  int _navBarIndex = 0;
  int selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> tabs = [
    HomePage(),
    CategoriesPage(),
    Container(),
    Container(),
    Container(),
  ];
  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Color(0xffDEDBDB),
        showUnselectedLabels: true,
        onTap: (index) async {
          // change page
          // if (index % 2 == 0)
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => VideoApp()));
          // } else {
          // push(context, LetsExploreView());
          // }
          setState(() {
            _navBarIndex = index;
          });
        },
        currentIndex: _navBarIndex,
        selectedItemColor: colorPrimary,
        unselectedItemColor: colorPrimary,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        items: [
          BottomNavigationBarItem(
              icon: icon(homeIcon, color: Color(0xff005AAA)), label: "Home"),
          BottomNavigationBarItem(
              icon: icon(categoriesIcon, color: Color(0xff005AAA)),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: icon(libraryIcon, color: Color(0xff005AAA)),
              label: "My library"),
          BottomNavigationBarItem(
              icon: icon(userIcon, color: Color(0xff005AAA)), label: "Profile"),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerView(),
      appBar: appBarWithSearch(context),
      body: tabs[_navBarIndex],
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.homepageData.value.banner == null
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
          onRefresh: ()async{
        _controller.getHomeData();},
          child: SingleChildScrollView(
              child: Column(children: [
                // Text(_controller.homepageData.value.toJson().toString())
                10.heightBox,
                BannersWidget(banners: _controller.homepageData.value.banner),
                18.heightBox,
                packageContainer(context, _controller.homepageData.value.books),
                ExploreAd(),
                packageContainer(
                    context, _controller.homepageData.value.packages),
                packageContainer(context, _controller.homepageData.value.video)
              ]),
            ),
        ));
  }
}

// class Home extends StatefulWidget {
//   const Home({Key key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return BaseWidget<HomepageViewmodel>(
//       viewModel: HomepageViewmodel(),
//       onModelReady: (vm) async {
//         // print(vm);
//         await vm.getHomepageData();
//       },
//       builder: (context, viewmodel, _) => SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             vertical: context.screenWidth * 0.03,
//           ),
//           child: viewmodel.isProcessing
//               ? SpinKitChasingDots(
//                   color: colorPrimary,
//                   // itemCount: 8,
//                 )
//               : Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BannersWidget(banners: viewmodel.homepageData.banner),
//                     16.heightBox,
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: FittedBox(
//                         fit: BoxFit.fitWidth,
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: choices
//                                 .map((e) => InkWell(
//                                     onTap: () {},
//                                     child: ChoiceButtons(
//                                         icons: e.icon, title: e.title)))
//                                 .toList()),
//                       ),
//                     ),
//                     20.heightBox,

//                     //books
//                     if (viewmodel.activeList.length > 0)
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 5.0),
//                         child: Container(
//                           child: packageContainer(
//                             context,
//                             "Books".toString(),
//                             books: viewmodel.homepageData.books.data,
//                           ),
//                         ),
//                       ),
//                     // if (viewmodel.activeList.length > 0)
//                     //   Padding(
//                     //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     //     child: Column(
//                     //       children: [
//                     //         Row(
//                     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //           children: [
//                     //             text(
//                     //               "Package",
//                     //               fontweight: FontWeight.w600,
//                     //               fontSize:
//                     //                   context.textTheme.subtitle1.fontSize + 2,
//                     //             ),
//                     //             Spacer(),
//                     //             text(
//                     //               "View All".toUpperCase(),
//                     //               fontweight: FontWeight.w600,
//                     //               fontSize:
//                     //                   context.textTheme.subtitle1.fontSize - 2,
//                     //             ),
//                     //           ],
//                     //         ),
//                     //         Container(
//                     //           height: context.screenHeight * 0.35,
//                     //           child: ListView.builder(
//                     //               scrollDirection: Axis.horizontal,
//                     //               itemCount:
//                     //                   viewmodel.homepageData.packages.length,
//                     //               padding: const EdgeInsets.only(left: 16),
//                     //               itemBuilder: (_, i) => Container(
//                     //                     margin:
//                     //                         const EdgeInsets.only(right: 10),
//                     //                     width: 120,
//                     //                     child: CachedNetworkImage(
//                     //                       imageUrl: viewmodel
//                     //                           .homepageData.packages[i].image,
//                     //                       errorWidget: (_, __, ___) =>
//                     //                           assetimage(errorImage),
//                     //                       placeholder: (context, title) =>
//                     //                           SpinKitChasingDots(
//                     //                               color: colorPrimary),
//                     //                     ),
//                     //                   )),
//                     //         )
//                     //       ],
//                     //     ),
//                     //   ),
//                     packageContainer(
//                       context,
//                       choices[2].title.toString(),
//                       package: viewmodel.homepageData.packages,
//                     ),
//                     // 16.heightBox,
//                     ExploreAd(),
//                     16.heightBox,
//                     if (viewmodel.activeList.length > 1)
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 5.0),
//                         child: Container(
//                           child: packageContainer(
//                             context,
//                             choices[1].title.toString(),
//                             books: viewmodel.homepageData.books.data,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }

class ExploreAd extends StatelessWidget {
  const ExploreAd({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 12, 2, 2),
      child: Container(
        height: context.screenHeight * 0.16,
        width: context.screenWidth * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(authBackgroundImage),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                bottom: 15.0,
              ),
              child: InkWell(
                onTap: () {
                  //
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: context.screenWidth * 0.35,
                  height: 35.0,
                  child: Center(
                    child: text(
                      'Explore Now',
                      textColor: colorPrimary,
                      fontFamily: 'Poppins',
                      // fontSize: context.textTheme.subtitle2.fontSize,
                      fontweight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BannersWidget extends StatelessWidget {
  final List<Banners> banners;
  const BannersWidget({Key key, this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(
            banners.length,
            (index) => Container(
                  child: Container(
                    // width: context.screenWidth * 1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(banners[index].image),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20.0,
                          bottom: 20.0,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: context.screenWidth * 0.32,
                              height: 40.0,
                              child: Center(
                                child: text(
                                  'Explore Now',
                                  decoration: TextDecoration.none,
                                  textColor: Colors.white,
                                  fontFamily: 'Poppins',
                                  // fontSize:
                                  //     context.textTheme.subtitle2.fontSize,
                                  fontweight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          // onPageChanged: () {},
          scrollDirection: Axis.horizontal,
        ));
  }
}
