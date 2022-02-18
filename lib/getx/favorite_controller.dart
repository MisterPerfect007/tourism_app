import 'package:get/get.dart';


class FavoriteCategorie extends GetxController{
  var favoriteList = [].obs;

  addItemToFavoriteList(id) {
    if(favoriteList.contains(id)){
      favoriteList.remove(id);
    }else favoriteList.add(id);
  }
}