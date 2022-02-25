import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/screens/login/login.dart';

handleLogOut(context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('connectedUserId');
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
}
