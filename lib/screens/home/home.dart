import 'package:flutter/material.dart';
import 'package:tourism_app/screens/home/widget/cards/cards.dart';
import 'package:tourism_app/screens/home/widget/categories.dart';
import 'package:tourism_app/screens/home/widget/home_app_bar.dart';
import 'package:tourism_app/widget/bottomNavBar/bottom_nav_bar.dart';

import 'widget/top_destinations.dart';


class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: HomeAppBar()
      ),
      // bottomNavigationBar: BottomNavBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 15, right: 15),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 15,),
            Categories(),
            SizedBox(height: 30,),
            Cards(),
            TopDestinations()
          ],
        ),
      ),
    );
  }
}
