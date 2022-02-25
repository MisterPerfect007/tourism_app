import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/getx/beach_controler.dart';
import 'package:tourism_app/getx/favorite_controller.dart';
import 'package:tourism_app/screens/SitePage/site_page.dart';
import 'package:tourism_app/widget/bottomNavBar/bottom_nav_bar.dart';

import 'favorite_app_bar.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final BeachController beachController = Get.put(BeachController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  List allFavorite = [];

  @override
  void initState() {
    super.initState();
    favoriteController.retrieveFavoritesFromPref();
    setState(() {
      allFavorite = favoriteController.allFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 80),
          child: FavoriteAppBar(),
        ),
        // bottomNavigationBar: BottomNavBar(),
        body: allFavorite.isNotEmpty
              ? ListView.builder(
                  cacheExtent: 9999,
                  itemCount: allFavorite.length,
                  itemBuilder: (context, index) {
                    return FavoriteItem(
                      site: allFavorite[index],
                    );
                  })
              : Center(
                  child: Text(
                  'Vous avez 0 Favori',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'SourceSansPro',
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ))
        );
  }
}

class FavoriteItem extends StatelessWidget {
  final Map site;
  FavoriteItem({Key? key, required this.site}) : super(key: key);
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    String image = site["images"][0];
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => SitePage(id: site["id"]))));
      }),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
            ),
            Infos(
              site: site,
            ),
            Rating(
              rating: site["rating"],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                  onTap: () {
                    favoriteController.addItemToFavoriteList(site["id"]);
                  },
                  child: Container(
                      padding:
                          EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text('Rétirer',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)))),
            ),
          ],
        ),
      ),
    );
  }
}

class Infos extends StatelessWidget {
  final Map site;
  const Infos({Key? key, required this.site}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nameOrCity = site["name"] != null ? site["name"] : site["city"];
    String countryAndContinent = site["country"] + ', ' + site["continent"];
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
              nameOrCity,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SourceSansPro'),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              countryAndContinent,
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
  final String rating;
  const Rating({Key? key, required this.rating}) : super(key: key);

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
              rating,
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
