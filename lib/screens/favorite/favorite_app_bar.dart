import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/getx/user_controller.dart';

class FavoriteAppBar extends StatelessWidget {
  FavoriteAppBar({Key? key}) : super(key: key);
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Text(
              'Mes Favoris',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SourceSansPro'),
            ),
            Expanded(child: Container()),
            Obx(() => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: userController.userImage.isNotEmpty
                      ? Image.file(
                          File(userController.userImage.toString()),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/avatar.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                )),

            /* Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage(
                    'assets/images/id_photo.jpg',
                  ))),
            ) */
          ],
        ),
      ),
    );
  }
}
