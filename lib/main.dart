import 'package:flutter/material.dart';
import 'package:tourism_app/screens/Register/register.dart';
import 'package:tourism_app/screens/SitePage/site_page.dart';
import 'package:tourism_app/screens/favorite/favorite.dart';
import 'package:tourism_app/screens/home/home.dart';
import 'package:tourism_app/screens/login/login.dart';
import 'package:tourism_app/screens/welcome/welcome.dart';
import 'package:tourism_app/widget/Navigation/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Navigation(),
      // home: Login(),
    );
  }
}
