import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../widgets/custom_buttom_nav_bar.dart';
import '../utils/app_constant.dart';
import '../widgets/drawer.dart';

class TapScreen extends StatefulWidget {
  static const routeName = '/tap_screen';

  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  final GlobalKey<ScaffoldState> _tapScaffoldKey =
      new GlobalKey<ScaffoldState>();
  List<Widget> _pages;
  final _pageController = PageController();
  List<String> _appBarTitle = [
    "home",
    "myCart",
    "favorits",
    "profile",
  ];

  @override
  void initState() {
    super.initState();
    _pages = [
      // HomeView(),
      // CartView(),
      // FavoritesView(),
      // ProfileView(),
    ];
  }

  int currentIndex = 0;

  void _selectPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final langugeProvider =
    //     Provider.of<LanguageProvider>(context, listen: false);
    // final language = langugeProvider.appLocal.languageCode;

    return Scaffold(
      key: _tapScaffoldKey,
      appBar:
          // currentIndex == 0
          //     ? null
          //     :
          AppBar(
        toolbarHeight: 60,
        // textTheme: Theme.of(context).textTheme,
        actionsIconTheme: Theme.of(context).accentIconTheme,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0.0,
        leading: Builder(
          builder: (context) => Transform.translate(
            offset: Offset(6, 0),
            child: IconButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => _tapScaffoldKey.currentState.openDrawer(),
              icon: Container(
                // color: Colors.teal,
                height: 30,
                width: 50,
                child: Image.asset(
                  "assets/icons/Menu icon.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        actions: [
          // if (currentIndex != 1)
          //   Padding(
          //     padding: language == "ar"
          //         ? EdgeInsets.only(left: 10)
          //         : EdgeInsets.only(right: 10),
          //     child: IconButton(
          //       icon: Badge(
          //         child: Icon(CupertinoIcons.shopping_cart),
          //         color: Colors.white,
          //       ),
          //       onPressed: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => CartScreen(isTap: false),
          //         ));
          //       },
          //     ),
          //   ),
        ],
        title: Text(
          "AppBar Title",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      // floatingActionButton: currentIndex == 0
      //     ? Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Transform.translate(
      //             offset: language == "ar" ? Offset(0, 2) : Offset(6, 2),
      //             child: FloatingActionButton(
      //               key: Key("FloatingAction1"),
      //               heroTag: "FloatingAction1",
      //               backgroundColor: AppColors.primaryColor,
      //               onPressed: () => _tapScaffoldKey.currentState.openDrawer(),
      //               child: language == "ar"
      //                   ? Image.asset(
      //                       "assets/icons/Menu icon2.png",
      //                       fit: BoxFit.contain,
      //                       scale: 16,
      //                     )
      //                   : Image.asset(
      //                       "assets/icons/Menu icon.png",
      //                       fit: BoxFit.contain,
      //                       scale: 16,
      //                     ),
      //             ),
      //           ),
      //           Transform.translate(
      //             offset: language == "ar" ? Offset(0, 2) : Offset(0, 2),
      //             child: FloatingActionButton(
      //               key: Key("FloatingAction2"),
      //               heroTag: "FloatingAction2",
      //               backgroundColor: AppColors.primaryColor,
      //               onPressed: () => _tapScaffoldKey.currentState.openDrawer(),
      //               child: Padding(
      //                 padding: language == "ar"
      //                     ? EdgeInsets.only(left: 10)
      //                     : EdgeInsets.only(right: 10),
      //                 child: IconButton(
      //                   icon: Badge(
      //                     child: Icon(CupertinoIcons.shopping_cart),
      //                     color: Colors.white,
      //                   ),
      //                   onPressed: () {
      //                     Navigator.of(context).push(MaterialPageRoute(
      //                       builder: (context) => CartScreen(isTap: false),
      //                     ));
      //                   },
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       )
      //     : null,
      drawer: AppDrawer(),
      body: PageView(
        controller: _pageController,
        children: _pages,
        // physics: NeverScrollableScrollPhysics(),
        onPageChanged: _selectPage,
      ),
      bottomNavigationBar: BottomIndicatorBar(
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: [
          BottomIndicatorNavigationBarItem(
            icon: CupertinoIcons.home,
            title: translate("home", context),
          ),
          BottomIndicatorNavigationBarItem(
            icon: CupertinoIcons.shopping_cart,
            title: translate("myCart", context),
          ),
          BottomIndicatorNavigationBarItem(
            icon: CupertinoIcons.heart,
            title: translate("favorits", context),
          ),
          BottomIndicatorNavigationBarItem(
            icon: CupertinoIcons.person,
            title: translate("profile", context),
          ),
        ],
        currentIndex: currentIndex,
        inactiveColor: Colors.grey,
        activeColor: AppColors.secondaryColors,
        indicatorColor: AppColors.secondaryColors,
      ),

      // ShapeBorder bottomBarShape = const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(0)),
      // );

      // SnakeShape snakeShape = SnakeShape.indicator;

      // bool showSelectedLabels = true;
      // bool showUnselectedLabels = true;

      // Color selectedColor = Colors.orange;

      // Color unselectedColor = Colors.grey;

      // SnakeNavigationBar.color(
      //   height: 60,
      //   behaviour: SnakeBarBehaviour.floating,
      //   snakeShape: snakeShape,
      //   shape: bottomBarShape,
      //   elevation: 5,

      //   ///configuration for SnakeNavigationBar.color
      //   snakeViewColor: selectedColor,
      //   selectedItemColor:
      //       snakeShape == SnakeShape.indicator ? selectedColor : null,
      //   unselectedItemColor: Colors.grey,
      //   backgroundColor: AppColors.primaryColor,

      //   // configuration for SnakeNavigationBar.gradient
      //   // snakeViewGradient: selectedGradient,
      //   // selectedItemGradient:
      //   //     snakeShape == SnakeShape.indicator ? selectedGradient : null,
      //   // unselectedItemGradient: unselectedGradient,

      //   showUnselectedLabels: showUnselectedLabels,
      //   showSelectedLabels: showSelectedLabels,

      //   currentIndex: currentIndex,
      //   selectedLabelStyle: const TextStyle(fontSize: 14),
      //   unselectedLabelStyle: const TextStyle(fontSize: 12),
      //   onTap: (index) {
      // _pageController.jumpToPage(index);
      // setState(() => currentIndex = index);
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.home),
      //       label: translate("home", context),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.shopping_cart),
      //       label: translate("myCart", context),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.heart),
      //       label: translate("favorits", context),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.person),
      //       label: translate("profile", context),
      //     ),
      //   ],
      // ),
    );
  }
}
