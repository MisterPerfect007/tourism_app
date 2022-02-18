import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/getx/beach_controler.dart';

import 'destination.dart';

class TopDestinations extends StatelessWidget {
  TopDestinations({Key? key}) : super(key: key);

  final BeachController beachController = Get.put(BeachController());

  @override
  Widget build(BuildContext context) {
    beachController.getBestSites();
    List bestList = beachController.bestSites;
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 30),
        height: 140,
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meilleurs destinations',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800),
            ),
            SizedBox(
              height: 10,
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       Destination(),
            //       Destination(),
            //     ],
            //   ),
            // ),
            Obx(() => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bestList.length,
                cacheExtent: 9999,
                itemBuilder: ((context, index) {
                  // print(bestList[index]);
                    return Destination(
                        name: bestList[index]["name"] != null? bestList[index]["name"] : '',
                        city: bestList[index]["city"],
                        image: bestList[index]["images"][0],
                        country: bestList[index]["country"],
                        continent: bestList[index]["continent"],
                        rating: bestList[index]["rating"]
                      );
                  })),
            )),
          ],
        ));
  }
}
