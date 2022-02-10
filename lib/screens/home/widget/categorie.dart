import 'package:flutter/material.dart';



class Categorie extends StatelessWidget {
  final bool isSelected;
  const Categorie({
    Key? key,
    required this.isSelected
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red.shade100,
      margin: EdgeInsets.only(right: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Plages',
            style: TextStyle(
              fontSize: 20,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
              fontFamily: 'SourceSansPro',
              color: isSelected ? Colors.black87 : Colors.grey[700]
            )
          ),
          SizedBox(height: 5,),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: isSelected ? Colors.black87 : Colors.white
            ),
          )
        ] ,
      ),
    );
  }
}