import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isAlreadyExist(element, value) async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('users')) {
    String? users = prefs.getString('users');
    List usersList = jsonDecode(users!);
    Map? existingElement = usersList
        .firstWhere((user) => user[element] == value, orElse: () => {});
    print(existingElement);
    if (existingElement!.isNotEmpty) {
      return true;
    }
  }
  return false;
}

void showSnackBar(BuildContext context,
        {required String title,
        required String message,
        required String type}) =>
    Flushbar(
      title: title,
      message: message,
      backgroundColor: type == 'success'
          ? Colors.green
          : type == 'failed'
              ? Colors.red
              : Colors.white,
      barBlur: 5,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      margin: EdgeInsets.only(left: 15, right: 15),
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 5),
    )..show(context);
