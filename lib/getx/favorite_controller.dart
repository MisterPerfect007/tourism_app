import 'package:get/get.dart';
import 'package:tourism_app/getx/beach_controler.dart';


class FavoriteController extends GetxController{
  final BeachController beachController = Get.put(BeachController());
  var favoriteList = [].obs;
  var allFavorite = [].obs;

  addItemToFavoriteList(id) {
    // print(id);
    if(favoriteList.contains(id)){
      favoriteList.remove(id);
    }else favoriteList.add(id);
    setAllFavorite();
  }
  setAllFavorite(){
    List allElement = [];
    favoriteList.forEach((id) async {
      allElement.add(await beachController.getSiteById(id));
    });
    allFavorite.value = allElement;
  }
}