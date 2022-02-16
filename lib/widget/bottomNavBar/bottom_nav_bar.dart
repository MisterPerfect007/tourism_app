import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'bottom_nav_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<BottomNavBar> {

  int selectedIndex = 0;
  void setSelectedIndex (index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
    child: Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(left: 30, right: 30),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0,0),
            color: Colors.grey.shade300,
            blurRadius: 20,
            spreadRadius: 0
          )
        ]
      ),
      child: Row(
        children: [
          BottomNavBarItem(
            iconBold: IconlyBold.home,
            iconLight: IconlyLight.home,
            index: 0,
            selectedIndex: selectedIndex,
            setSelectedIndex: setSelectedIndex,
          ),
          Expanded(child: Container()),
          BottomNavBarItem(
            iconBold: IconlyBold.heart,
            iconLight: IconlyLight.heart,
            index: 1,
            selectedIndex: selectedIndex,
            setSelectedIndex: setSelectedIndex,
          ),
          Expanded(child: Container()),
          BottomNavBarItem(
            iconBold: IconlyBold.profile,
            iconLight: IconlyLight.profile,
            setSelectedIndex: setSelectedIndex,
            index: 2,
            selectedIndex: selectedIndex,
          ),
          // Expanded(child: Container()),
          // BottomNavBarItem(
          //   iconBold: IconlyBold.setting,
          //   iconLight: IconlyLight.setting,
          //   index: 3,
          //   selectedIndex: selectedIndex,
          //   setSelectedIndex: setSelectedIndex,
          // ),
        ],)
    )
      );
  }
}
