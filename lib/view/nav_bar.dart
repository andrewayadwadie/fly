import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/home/home_screen.dart';
import 'package:fly/view/preparation_screen/preparation_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  PersistentTabController? _controller;
  bool? _hideNavBar;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const PreparationScreen(),
      const PreparationScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            'assets/icons/home.png',
           
            color: primaryColor,
          ),
        ),
        title: 'الرئيسية',
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        //  fontSize: 9,
         
          color: primaryColor,
        ),
        inactiveIcon: Image.asset(
          'assets/icons/home.png',
           color: primaryColor,
        ),
        activeColorSecondary: primaryColor,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: primaryColor,
      ),
      PersistentBottomNavBarItem(
     //   iconSize: 30,
        icon: Image.asset(
          'assets/icons/map.png',
          fit: BoxFit.fill,
          color: primaryColor,
        ),
        inactiveIcon: Image.asset(
          'assets/icons/map.png',
          fit: BoxFit.fill,
          color: primaryColor,
        ),
        title: "الخرائط",
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        //  fontSize: 9,
          color: primaryColor,
        ),
        activeColorSecondary: primaryColor,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: primaryColor,
      ),
      PersistentBottomNavBarItem(
   //     iconSize: 30,
        icon: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            'assets/icons/settings.png',
            fit: BoxFit.fill,
            color: primaryColor,
          ),
        ),
        inactiveIcon: Image.asset(
          'assets/icons/settings.png',
          fit: BoxFit.fill,
          color: primaryColor,
        ),
        title: "الإعدادات",
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
    //      fontSize: 9,
          color: primaryColor,
        ),
        activeColorSecondary: primaryColor,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: primaryColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      hideNavigationBar: _hideNavBar,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 300),
        curve: Curves.elasticInOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.easeInOutCirc,
        duration: Duration(milliseconds: 400),
      ),

   
      navBarStyle:
          NavBarStyle.style1,
               onWillPop: (context) async {

         await  showModalBottomSheet(
            context: context!,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height / 6,
        color: lightPrimaryColor,
              child: TextButton(
               
                child:const   Text(
                  "Close",
                  style:  TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else {
                    exit(0);
                  }
                },
              ),
            ),
          );
          return false;
        }, // Choose the nav bar style with this property.
    );
  }
}
