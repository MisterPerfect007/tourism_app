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
        ),
        child: Row(
          children: [
            Text(
              'Mon Compte',
              style: TextStyle(
              fontSize: 31,
              fontWeight: FontWeight.w600,
              fontFamily: 'SourceSansPro'
            ),
            ),
          ],
        ),
      ),
    );
  }
}