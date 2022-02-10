import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<BottomNavBar> {

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 80,
      color: Colors.grey.shade100,
      child: SafeArea(
        child: Row(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: 60,
            child: Container(
              height: 30,
              width: 20,
              color: Colors.red.shade100,
              child: Icon(Icons.home),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: 80,
            child: Container(
              height: 80,
              width: 50,
              color: Colors.teal.shade100,
              child: Icon(Icons.home),
            ),
          ),
        ],),
      )
    );
  }
}