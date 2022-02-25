import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_app/getx/user_controller.dart';

class ImagePicking extends StatefulWidget {
  ImagePicking({Key? key}) : super(key: key);

  @override
  State<ImagePicking> createState() => _ImagePickingState();
}

class _ImagePickingState extends State<ImagePicking> {
  String? currentImage;
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    Future pickImage(source) async {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: source);
      if (image == null) return;
      // File()
      setState(() {
        this.currentImage = image.path;
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    IconlyLight.arrow_left,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentImage != null
                ? Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      child: Image.file(
                        File(currentImage!),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ])
                : Text(''),
            currentImage != null
                ? Container(
                    width: 200,
                    // color: Colors.green,
                    child: ElevatedButton(
                        onPressed: () {
                          userController.setUserImage(currentImage);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        child: Text('Valider')),
                  )
                : Text(''),
            Container(
              width: 200,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => pickImage(ImageSource.gallery),
                      child: Row(
                        children: [
                          Icon(Icons.photo),
                          SizedBox(
                            width: 10,
                          ),
                          Text(currentImage != null
                              ? 'Choisir une autre'
                              : 'Choisir une photo')
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () => pickImage(ImageSource.camera),
                      child: Row(
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(
                            width: 10,
                          ),
                          Text(currentImage != null
                              ? 'Prendre une autre'
                              : 'Prendre une photo')
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
