import 'package:flutter/material.dart';

import 'categorie.dart';


class Categories extends StatelessWidget {
  const Categories({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      // color: Colors.red.shade100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Categorie(isSelected: true,),
          Categorie(isSelected: false,),
          Categorie(isSelected: false,),
          Categorie(isSelected: false,),
          Categorie(isSelected: false,),
          Categorie(isSelected: false,),
          // Categorie(),
          // Categorie(),
          // Categorie(),
          // Categorie(),
          // Categorie(),
          // Categorie()
        ],)
      ),
    );
  }
}
