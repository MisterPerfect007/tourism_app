import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/getx/beach_controler.dart';
import 'package:tourism_app/getx/categorie_controller.dart';

class Categorie extends StatelessWidget {
  final bool isSelected;
  final String name;
  Categorie({Key? key, 
  required this.name,
  required this.isSelected
  }) : super(key: key);

  final CategorieController categorieController =
      Get.put(CategorieController());

    
  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () {
        categorieController.setCurrentCategorie(name);
      },
      child: Container(
        // duration: Duration(seconds: 1),
        margin: EdgeInsets.only(right: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.normal,
                    fontFamily: 'SourceSansPro',
                    color: isSelected ? Colors.black87 : Colors.grey[700])),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: isSelected ? Colors.black87 : Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
