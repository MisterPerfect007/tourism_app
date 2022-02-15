import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isAlreadyExist(element, value) async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('users')) {
    String? users = prefs.getString('users');
    List usersList = jsonDecode(users!);
    Map? existingElement =
        usersList.firstWhere((user) => user[element] == value, orElse: () => {});
    print(existingElement);
    if(existingElement!.isNotEmpty){
      return true;
    }
  }
  return false;
}
