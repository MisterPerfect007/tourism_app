import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BackCustomBtn extends StatelessWidget {
  const BackCustomBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Icon(IconlyLight.arrow_left_2, size: 30, color: Colors.black),
        ),
      ),
    );
  }
}
