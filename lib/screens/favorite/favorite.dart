import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/widget/bottomNavBar/bottom_nav_bar.dart';

import 'favorite_app_bar.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: FavoriteAppBar(),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            FavoriteItem(),
            FavoriteItem(),
            FavoriteItem(),
          ]),
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/beach-img.jpg'))),
          ),
          Infos(),
          Rating(),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Text(
                  'Rétirer', 
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600
                    ))),
          )
        ],
      ),
    );
  }
}

class Infos extends StatelessWidget {
  const Infos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Container(
        height: 70,
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name or city',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SourceSansPro'),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Country, continent',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SourceSansPro',
                  color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 100,
      child: Container(
        padding: EdgeInsets.all(5),
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              '4.9',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SourceSansPro'),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(IconlyBold.star, color: Colors.amber, size: 18)
          ],
        ),
      ),
    );
  }
}
