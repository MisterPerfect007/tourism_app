import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'CustomCarousel/add_to_favorite_btn.dart';
import 'CustomCarousel/back_custom_btn.dart';
import 'CustomCarousel/image_list.dart';


class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {

  int currentPage = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List data = [
      "assets/images/beach/bali/img1.jpg",
      "assets/images/beach/bali/img2.jpg",
      "assets/images/beach/bali/img3.jpg",
      "assets/images/beach/bali/img4.jpg",
      "assets/images/beach/bali/img5.jpg"
    ];
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 30),
          child: CarouselSlider.builder(
              itemCount: data.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 15),
                    // margin: EdgeInsets.only(top: 30),
                    height: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(data[index]),
                        )));
              },
              // carouselController: ,
              options: CarouselOptions(
                onPageChanged: ((index, reason) {
                  // print(index);
                  setState((){
                    currentPage = index;
                  });}
                ),
                height: 450, 
                viewportFraction: 1,
              ),
              carouselController: _controller
            ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: SafeArea(
                child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15, right: 15),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  BackCustomBtn(),
                  Expanded(child: Container()),
                  AddToFavoriteBtn(),
                ],
              ),
            ))),
        Positioned(
          right: 30,
          bottom: 0,
          child: ImageList(
            _controller,
            data: data,
            currentPage: currentPage,
            ),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name or City',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                    fontSize: 30
                  )
                ),
                Row(
                  children: [
                    Icon(
                      IconlyLight.location,
                      color: Colors.white,

                      ),
                    Text(
                      'Coutry',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'SourceSansPro'
                      )
                      )
                  ]
                )
              ]
            )
        ))
      ],
    );
  }
}
