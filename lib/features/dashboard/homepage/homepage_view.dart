import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/features/dashboard/choice.dart';
import 'package:publication_app/features/dashboard/drawer.dart';
import 'package:publication_app/features/dashboard/homepage/homepage_viewmodel.dart';
import 'package:publication_app/features/reusable_wiidgets.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:publication_app/constant_widgets/appbarView.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomepageView extends StatefulWidget {
  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  int _navBarIndex = 0;
  int selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> tabs = [
    Home(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    // HomepageViewmodel().getHomepageData();
    return
        // print(viewmodel.homepageData.banner.toString());
        Scaffold(
      key: _scaffoldKey,
      drawer: DrawerView(),
      appBar: appBarWithSearch(context),
      bottomNavigationBar: buildBottomNavigationBar(context),
      // backgroundColor: Color(0xffDEDBDB),
      body: tabs[_navBarIndex],
    );
  }

  Widget optionChoiceButtons(
      BuildContext context, HomepageViewmodel viewmodel) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight * 0.05,
      // color: Colors.grey,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 5),
          ...choices.map(
            (e) {
              return InkWell(
                onTap: selectedIndex == choices.indexOf(e)
                    ? null
                    : () {
                        setState(() {
                          selectedIndex = choices.indexOf(e);
                        });
                        viewmodel.changeActiveList(selectedIndex);
                      },
                child: optionButton(context, e.icon, e.title.toUpperCase(),
                    isSelected: false // selectedIndex == choices.indexOf(e),
                    ),
              );
            },
          ).toList(),
          SizedBox(
            width: 6,
          ),
          // Icon(Icons.auto_awesome_mosaic_outlined,
          //     color: Theme.of(context).primaryColor),
          // text(
          //   "View All".toUpperCase(),
          //   fontweight: FontWeight.w500,
          //   // textColor: Colors.grey,
          //   fontSize: context.textTheme.subtitle2.fontSize,
          // ),
          // (
          //       "View All",
          //       style: TextStyle(
          //           color: Colors.grey,
          //           fontSize: context.textTheme.subtitle2.fontSize),
          //     ),
          // Icon(Icons.auto_awesome_mosaic_outlined,
          //     color: Theme.of(context).primaryColor),
          // Text(
          //   "View All",
          //   style: TextStyle(color: Theme.of(context).primaryColor),
          // )
          // optionButton(
          //   context,
          //   categoryIcon,
          //   e.title.toUpperCase(),
          //   isSelected: selectedIndex == choices.indexOf(e),
          // ),
        ],
      ),
    );
  }

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

  Widget sliderImage(Banners banners) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.035,
      ),
      child: Container(
        height: context.screenHeight * 0.20,
        width: context.screenWidth * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(banners.image),
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
              child: Column(
                children: [
                  Container(
                    width: context.screenWidth / 3,
                    padding: EdgeInsets.all(8.0),
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: [
                    //       Colors.grey.shade700,
                    //       Colors.grey.shade400,
                    //       Colors.grey.shade200,
                    //     ],
                    //     begin: Alignment.bottomCenter,
                    //     end: Alignment.topCenter,
                    //   ),
                    // ),
                    // child: text(
                    //   banners.name,
                    //   fontweight: FontWeight.w700,
                    //   isCentered: true,
                    //   maxLine: 5,
                    //   textColor: Colors.white,
                    //   fontSize: context.textTheme.headline6.fontSize,
                    // ),
                  ),
                  InkWell(
                    onTap: () {
                      //
                    },
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
                          fontSize: context.textTheme.subtitle2.fontSize,
                          fontweight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InnerView {
  final String name;
  final ScrollController controller = ScrollController();
  InnerView({this.name});
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget sliderImage(Banners banners) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.035,
      ),
      child: Container(
        height: context.screenHeight * 0.20,
        width: context.screenWidth * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(banners.image),
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
              child: Column(
                children: [
                  Container(
                    width: context.screenWidth / 3,
                    padding: EdgeInsets.all(8.0),
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: [
                    //       Colors.grey.shade700,
                    //       Colors.grey.shade400,
                    //       Colors.grey.shade200,
                    //     ],
                    //     begin: Alignment.bottomCenter,
                    //     end: Alignment.topCenter,
                    //   ),
                    // ),
                    // child: text(
                    //   banners.name,
                    //   fontweight: FontWeight.w700,
                    //   isCentered: true,
                    //   maxLine: 5,
                    //   textColor: Colors.white,
                    //   fontSize: context.textTheme.headline6.fontSize,
                    // ),
                  ),
                  InkWell(
                    onTap: () {
                      //
                    },
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
                          fontSize: context.textTheme.subtitle2.fontSize,
                          fontweight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget optionChoiceButtons(
      BuildContext context, HomepageViewmodel viewmodel) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight * 0.05,
      // color: Colors.grey,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 5),
            ...choices.map(
              (e) {
                return InkWell(
                  onTap: () {},
                  child: optionButton(context, e.icon, e.title.toUpperCase(),
                      isSelected: false // selectedIndex == choices.indexOf(e),
                      ),
                );
              },
            ).toList(),
            SizedBox(
              width: 6,
            ),
            // Icon(Icons.auto_awesome_mosaic_outlined,
            //     color: Theme.of(context).primaryColor),
            // text(
            //   "View All".toUpperCase(),
            //   fontweight: FontWeight.w500,
            //   // textColor: Colors.grey,
            //   fontSize: context.textTheme.subtitle2.fontSize,
            // ),
            // (
            //       "View All",
            //       style: TextStyle(
            //           color: Colors.grey,
            //           fontSize: context.textTheme.subtitle2.fontSize),
            //     ),
            // Icon(Icons.auto_awesome_mosaic_outlined,
            //     color: Theme.of(context).primaryColor),
            // Text(
            //   "View All",
            //   style: TextStyle(color: Theme.of(context).primaryColor),
            // )
            // optionButton(
            //   context,
            //   categoryIcon,
            //   e.title.toUpperCase(),
            //   isSelected: selectedIndex == choices.indexOf(e),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomepageViewmodel>(
      viewModel: HomepageViewmodel(),
      onModelReady: (vm) async {
        await vm.getHomepageData();
      },
      builder: (context, viewmodel, _) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.screenWidth * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: viewmodel.isProcessing
                ? [
                    SpinKitWave(
                      color: colorPrimary,
                      itemCount: 8,
                    )
                  ]
                : [
                    CarouselSlider(
                        items: List.generate(
                            viewmodel.homepageData.banner.length,
                            (index) => Container(
                                  // color: Colors.grey,
                                  child: sliderImage(
                                    viewmodel.homepageData.banner[index],
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
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: () {},
                          scrollDirection: Axis.horizontal,
                        )),
                    // Text(viewmodel.homepageData.packages.toString()),
                    // VxSwiper.builder(
                    //   autoPlay: false,
                    //   viewportFraction: 1.0,
                    //   itemCount: viewmodel.homepageData.banner.length,
                    //   itemBuilder: (context, index) => // Container()

                    // ),
                    16.heightBox,
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            optionChoiceButtons(context, viewmodel),
                            // viewmoreAction(context),
                          ],
                        ),
                      ),
                    ),
                    16.heightBox,
                    if (viewmodel.activeList.length > 0)
                      packageContainer(
                        context,
                        choices[2].title.toString(),
                        package: viewmodel.homepageData.packages,
                      ),
                    16.heightBox,
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          2, viewmodel.activeList.length == 0 ? 12 : 2, 2, 2),
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
                                      fontSize:
                                          context.textTheme.subtitle2.fontSize,
                                      fontweight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    16.heightBox,
                    if (viewmodel.activeList.length > 1)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          child: packageContainer(
                            context,
                            choices[1].title.toString(),
                            books: viewmodel.homepageData.books.data,
                          ),
                        ),
                      ),
                  ],
          ),
        ),
      ),
    );
  }
}
