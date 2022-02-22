import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/getx/favorite_controller.dart';
import 'package:tourism_app/screens/SitePage/site_page.dart';

class OneCard extends StatelessWidget {
  final String image;
  final String id;
  final String rating;
  final String name;
  final String city;
  final String country;
  final String continent;
  OneCard({
    Key? key,
    required this.image,
    required this.id,
    required this.rating,
    required this.name,
    required this.city,
    required this.country,
    required this.continent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SitePage(id: id)));
      },
      child: Container(
          width: 280,
          margin: EdgeInsets.only(right: 30),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 340,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(image))),
              ),
              //
              //
              //Adding or Removing
              //
              //
              Positioned(
                  right: 20,
                  top: 20,
                  child: AddToFavorite(
                    id: id,
                  )),
              //
              //
              //Bottom banner
              //
              //
              Positioned(
                bottom: 15,
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 100,
                        width: 240,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          alignment: Alignment.topLeft,
                          height: 80,
                          width: 240,
                          padding: EdgeInsets.only(top: 15, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name.isNotEmpty ? name : city,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontFamily: 'SourceSansPro'),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${country}, ${continent}  ',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                  fontFamily: 'SourceSansPro',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Pour la note

                      Positioned(
                        top: 5,
                        right: 30,
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                rating,
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontWeight: FontWeight.w800,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class AddToFavorite extends StatefulWidget {
  final String id;
  const AddToFavorite({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<AddToFavorite> createState() => _AddToFavoriteState();
}

class _AddToFavoriteState extends State<AddToFavorite> {
  bool isFavorite = false;
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isFavorite = favoriteController.favoriteList.contains(widget.id);
      return Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.7),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: GestureDetector(
            onTap: () {
              favoriteController.addItemToFavoriteList(widget.id);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.9),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              child: Icon(
                isFavorite ? IconlyBold.heart : IconlyLight.heart,
                color: isFavorite ? Colors.red : Colors.black87,
              ),
            ),
          ));
    });
  }
}
