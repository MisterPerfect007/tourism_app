import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/getx/favorite_controller.dart';
import 'package:tourism_app/getx/user_controller.dart';
import 'package:tourism_app/screens/account/account.dart';
import 'package:tourism_app/screens/favorite/favorite.dart';
import 'package:tourism_app/screens/home/home.dart';

import 'package:tourism_app/widget/bottomNavBar/bottom_nav_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  final UserController userController = Get.put(UserController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  void setSelectedIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens = [
    Home(),
    Favorite(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    userController.retrieveUserInfos();
    favoriteController.retrieveFavoritesFromPref();
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        setSelectedIndex: setSelectedIndex,
      ),
      body: screens[selectedIndex],
    );
  }
}
