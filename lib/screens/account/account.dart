import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/getx/favorite_controller.dart';
import 'package:tourism_app/getx/user_controller.dart';
import 'package:tourism_app/screens/imagePicker/image_picker.dart';

import 'account_app_bar.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);

  final FavoriteController favoriteController = Get.put(FavoriteController());
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: AccountAppBar(),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ImagePicking()));
                  },
                  child: Stack(children: [
                    // Container(
                    //   alignment: Alignment.bottomRight,
                    //   width: 200,
                    //   height: 200,
                    //   decoration: BoxDecoration(
                    //       // color: Colors.red,
                    //       borderRadius: BorderRadius.all(Radius.circular(200)),
                    //       image: DecorationImage(
                    //           image: AssetImage('assets/images/id_photo.jpg'))),
                    // ),
                    Obx( () => ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      child: userController.userImage.isNotEmpty? Image.file(
                        File(userController.userImage.toString()),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ) : Image.asset(
                        'assets/images/avatar.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Icon(Icons.add_a_photo_outlined),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Salut, ... ',
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //     fontFamily: 'SourceSansPro',
                  //     color: Colors.grey[700]
                  //   ),
                  //   ),
                  Text(
                    userController.userPseudo.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'SourceSansPro',
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                userController.userEmail.toString(),
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SourceSansPro',
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic
                    // fontWeight: FontWeight.w600
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${favoriteController.favoriteList.length} favoris ajoutés',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
