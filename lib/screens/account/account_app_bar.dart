import 'package:flutter/material.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(5, 2),
          //     blurRadius: 5,
          //     spreadRadius: 0,
          //     color: Colors.grey
          //   )
          // ]
        ),
        child: Row(
          children: [
            Text(
              'Mon Compte',
              style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontFamily: 'SourceSansPro'
            ),
            ),
          //   Expanded(child: Container()),
          //   Container(
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(50)),
          //     image: DecorationImage(
          //       image: AssetImage(
          //         'assets/images/id_photo.jpg',

          //         )
          //     )
          //   ),
          // )
          ],
        ),
      ),
    );
  }
}