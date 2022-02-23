import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/screens/Register/helpers.dart';
import 'package:tourism_app/screens/home/home.dart';

import '../../widget/Navigation/navigation.dart';

Future<bool> isUserExisting({email, password}) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('users')) {
    String? users = prefs.getString('users');
    List usersList = jsonDecode(users!);

    Map existingUser = usersList.firstWhere(
        (user) => user["email"] == email && user["password"] == password,
        orElse: () => {});
    if (existingUser.isNotEmpty) {
      prefs.setString('connectedUser', jsonEncode(existingUser));
      return true;
    } else
      return false;
  } else
    return false;
}

handleUserConnection(context) async {
  await Future.delayed(Duration(seconds: 3), () {});
  showSnackBar(context,
      title: 'Ok', message: 'Vous êtes maintenant connecté', type: 'success');
  await Future.delayed(Duration(seconds: 2), () {});

  Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation()));
  // if (await isUserExisting(email: email, password: password)) {

  // }
  // else {

  // }
}
