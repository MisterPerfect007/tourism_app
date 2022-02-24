import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/getx/beach_controler.dart';

class FavoriteController extends GetxController {
  final BeachController beachController = Get.put(BeachController());
  var favoriteList = [].obs;
  var allFavorite = [].obs;

  addItemToFavoriteList(id) {
    // print(id);
    if (favoriteList.contains(id)) {
      favoriteList.remove(id);
    } else
      favoriteList.add(id);
    setAllFavorite();
    saveFavoritesInPref(favoriteList.toList());
  }

  setAllFavorite() {
    List allElement = [];
    favoriteList.forEach((id) async {
      allElement.add(await beachController.getSiteById(id));
    });
    allFavorite.value = allElement;
  }

  saveFavoritesInPref(List list) async {
    print(list);
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('connectedUserId');

    String? users = prefs.getString('users');
    List usersList = jsonDecode(users!);

    Map currentUser =
        usersList.firstWhere((user) => user["id"] == userId, orElse: () => {});
    // print('current user : ');
    // print(currentUser["favorites"]);
    currentUser["favorites"] = list;

    usersList.removeWhere((element) => element["id"] == userId);
    usersList.add(currentUser);
    prefs.setString('users', jsonEncode(usersList));
    // print(usersList);
  }

  retrieveFavoritesFromPref() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('connectedUserId');

    String? users = prefs.getString('users');
    List usersList = jsonDecode(users!);

    Map currentUser =
        usersList.firstWhere((user) => user["id"] == userId, orElse: () => {});
    favoriteList.value = currentUser["favorites"];
    setAllFavorite();
  }
}
