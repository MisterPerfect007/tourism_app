import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';

class BeachController extends GetxController {
  var beaches = [].obs;
  var cardsData = [].obs;
  var bestSites = [].obs;
  

  setBeaches() async {
    beaches.value = await getCardsDataFromJson('assets/json/beach/beach.json');
    // print(beaches);
  }
  setCardsData(String currentCategorie) async {
    switch ((currentCategorie.toLowerCase())) {
      case 'plages' :
        // print("plages");
        cardsData.value = await getCardsDataFromJson('assets/json/beach/beach.json');
        break;
      case 'montagnes' :
        // print("mont");
        cardsData.value = await getCardsDataFromJson('assets/json/mountain/mountain.json');
        break;
      case 'forêts' :
        cardsData.value = await getCardsDataFromJson('assets/json/forest/forest.json');
        break;
      case 'sites historiques' :
        cardsData.value = await getCardsDataFromJson('assets/json/history/history.json');
        break;
      default:
        cardsData.value = await getCardsDataFromJson('assets/json/beach/beach.json');
    }
  }
  getBestSites() async {
    List<String> jsonUrlList = [
      'assets/json/beach/beach.json',
      'assets/json/mountain/mountain.json',
      'assets/json/forest/forest.json',
      'assets/json/history/history.json'
    ];
    List bestList = [];
    for(int i = 0 ; i < jsonUrlList.length ; i++){
      List singleUrlResult = await getCardsDataFromJson(jsonUrlList[i]);
      // print(singleUrlResult);
      // break;
      for(int y = 0 ; y < singleUrlResult.length; y++){
        if(double.parse(singleUrlResult[y]["rating"]) > 4.7){
          bestList.add(singleUrlResult[y]);
        }
      }
    }
    bestSites.value = bestList;
  }
}

Future<List> getCardsDataFromJson(url) async {
  final jsonData =
      await rootBundle.rootBundle.loadString(url);
  return jsonDecode(jsonData) as List;
}
