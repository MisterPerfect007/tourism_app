import 'package:flutter/material.dart';


class FieldError extends StatelessWidget {
  final String message;
  const FieldError({
    Key? key,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 2),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Text('*${message}',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
      ),
    );
  }
}

