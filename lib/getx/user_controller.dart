import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var userImage = ''.obs;
  var userPseudo = ''.obs;
  var userEmail = ''.obs;

  setUserImage(path) async {
    /* state new value */
    userImage.value = path;
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('connectedUserId');

    String? users = prefs.getString('users');
    List usersList = jsonDecode(users!);

    Map currentUser =
        usersList.firstWhere((user) => user["id"] == userId, orElse: () => {});

    currentUser["avatar"] = path;
    usersList.removeWhere((user) => user["id"] == userId);
    usersList.add(currentUser);

    /* Save the modified users list in SharedPreferences */
    prefs.setString('users', jsonEncode(usersList));
  }

  retrieveUserInfos() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('connectedUserId');

    String? users = prefs.getString('users');
    List usersList = jsonDecode(users!);

    Map currentUser =
        usersList.firstWhere((user) => user["id"] == userId, orElse: () => {});
    
    userImage.value = currentUser["avatar"];
    userPseudo.value = currentUser["pseudo"];
    userEmail.value = currentUser["email"];
  }
}
