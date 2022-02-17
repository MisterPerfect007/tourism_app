import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../getx/categorie_controller.dart';
import 'categorie.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  final CategorieController categorieController =
      Get.put(CategorieController());

  final List<String> categoriesList = [
    'Plages',
    'Montagnes',
    'Forêts',
    'Sites Historiques',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      // color: Colors.red,
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return Obx(() => Categorie(
                isSelected: categorieController.currentCategorie
                        .toString()
                        .toLowerCase() ==
                    categoriesList[index].toLowerCase(),
                name: categoriesList[index]));
          }),
    );
  }
}
