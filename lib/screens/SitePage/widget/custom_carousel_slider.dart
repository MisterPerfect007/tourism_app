import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'CustomCarousel/add_to_favorite_btn.dart';
import 'CustomCarousel/back_custom_btn.dart';
import 'CustomCarousel/image_list.dart';

class CustomCarouselSlider extends StatefulWidget {
  final Map site;
  const CustomCarouselSlider({
    Key? key,
    required this.site,
  }) : super(key: key);

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int currentPage = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List images = widget.site["images"];
    String id = widget.site["id"];
    String NameOrCity =
        widget.site["name"] != null ? widget.site["name"] : widget.site["city"];
    String countryAndContinent = widget.site["country"] + ', '+ widget.site["continent"];
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 30),
          child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 15),
                    // margin: EdgeInsets.only(top: 30),
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[index]),
                        )));
              },
              // carouselController: ,
              options: CarouselOptions(
                onPageChanged: ((index, reason) {
                  // print(index);
                  setState(() {
                    currentPage = index;
                  });
                }),
                height: 450,
                viewportFraction: 1,
              ),
              carouselController: _controller),
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
                  AddToFavoriteBtn(
                    id: id,
                  ),
                ],
              ),
            ))),
        Positioned(
          right: 30,
          bottom: 0,
          child: ImageList(
            _controller,
            data: images,
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
                  Text(NameOrCity,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 0),
                              color: Colors.grey,
                              blurRadius: 5
                            )
                          ]
                          )),
                  Row(children: [
                    Icon(
                      IconlyLight.location,
                      color: Colors.white,
                    ),
                    Text(countryAndContinent,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'SourceSansPro',
                            shadows: [
                            Shadow(
                              offset: Offset(0, 0),
                              color: Colors.grey,
                              blurRadius: 5
                            )
                          ]
                            ))
                  ])
                ])))
      ],
    );
  }
}
