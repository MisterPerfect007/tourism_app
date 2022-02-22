import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/getx/beach_controler.dart';
import 'package:tourism_app/getx/favorite_controller.dart';

class AddToFavoriteBtn extends StatelessWidget {
  final String id;
  AddToFavoriteBtn({Key? key, required this.id}) : super(key: key);
  final FavoriteController favoriteController = Get.put(FavoriteController());
  
  @override
  Widget build(BuildContext context) {
    
    return Obx(() {
      bool isFavorite = favoriteController.favoriteList.contains(id);
      return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: GestureDetector(
          onTap: () {
            favoriteController.addItemToFavoriteList(id);
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: isFavorite
                ? Icon(IconlyBold.heart, size: 30, color: Colors.red)
                : Icon(IconlyLight.heart, size: 30, color: Colors.black),
          ),
        ),
      );
    });
  }
}
