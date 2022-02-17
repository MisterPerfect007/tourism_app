import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../getx/beach_controler.dart';
import '../../../../getx/categorie_controller.dart';
import 'card.dart';

class Cards extends StatelessWidget {
  Cards({Key? key}) : super(key: key);

  final BeachController beachController = Get.put(BeachController());
  final CategorieController categorieController =
      Get.put(CategorieController());

  @override
  Widget build(BuildContext context) {
    categorieController.currentCategorie.listen((value) {
      beachController
          .setCardsData(value.toString());
    });
  beachController
          .setCardsData(categorieController.currentCategorie.toString());
    List beachesList = beachController.cardsData;
    return Obx(
      () => Expanded(
          child: Container(
        child: ListView.builder(
            cacheExtent: 9999,
            scrollDirection: Axis.horizontal,
            itemCount: beachesList.length,
            addAutomaticKeepAlives: false,
            itemBuilder: ((context, index) {
              return OneCard(
                  image: beachesList[index]["images"][0],
                  rating: beachesList[index]["rating"],
                  city: beachesList[index]["city"],
                  country: beachesList[index]["country"],
                  continent: beachesList[index]["continent"]);
            })),
      )),
    );
  }
}
      // child: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(children: [
      //     OneCard(),
      //     OneCard(),
      //   ],),
      // )