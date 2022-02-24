import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/getx/user_controller.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    Key? key,
  }) : super(key: key);
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 15,
          left: 15,
          right: 15,
          bottom: 15),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          Text(
            'Discover',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontFamily: 'SourceSansPro'),
          ),
          Expanded(child: Container()),
          SizedBox(width: 15),
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

                  )
              )
            ),
          ) */
        ],
      ),
    );
  }
}
