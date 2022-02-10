import 'package:flutter/material.dart';

import 'card.dart';


class Cards extends StatelessWidget {
  const Cards({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          OneCard(),
          OneCard(),
        ],),
      )
    );
  }
}