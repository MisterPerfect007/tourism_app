import 'package:get/get.dart';

class CategorieController extends GetxController{
  var currentCategorie = 'plages'.obs;

  setCurrentCategorie(newValue) {
    currentCategorie.value = newValue;
  }
}