import 'package:flutter/material.dart';

class FavoriteAppBar extends StatelessWidget {
  const FavoriteAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Text(
              'Mes Favoris',
              style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: 'SourceSansPro'
            ),
            ),
            Expanded(child: Container()),
            Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/id_photo.jpg',

                  )
              )
            ),
          )
          ],
        ),
      ),
    );
  }
}