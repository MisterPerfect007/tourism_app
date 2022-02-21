import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';


class ImageList extends StatelessWidget {
  const ImageList(
    this.controller,
    {
    Key? key,
    required this.data,
    required this.currentPage,
  }) : super(key: key);

  final List data;
  final CarouselController controller;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,0),
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 5,
            spreadRadius: 5
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              data.length,
              (index) => GestureDetector(
                onTap: (() {
                  controller.animateToPage(index);
                }),
                child: Container(
                      padding: EdgeInsets.only(right: 10, left: 10, bottom: 0),
                      child: Container(
                        width:  50,
                        height:  50,
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              colorFilter: index == currentPage? null : ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken),
                                fit: BoxFit.cover,
                                image: AssetImage(data[index]))),
                      ),
                    ),
              ))),
    );
  }
}