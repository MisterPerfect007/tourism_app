import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/screens/SitePage/widget/custom_carousel_slider.dart';
import 'package:readmore/readmore.dart';

class SitePage extends StatelessWidget {
  const SitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text =
        'La plage de la Concha (Kontxa hondartza en basque, playa de la Concha en espagnol) est une plage située sur la côte basque1 dans la baie de la Concha, dans la ville de Saint-Sébastien (Espagne). kjkh dhkhdjh dkjhdkhd dhgdkkd kfjkh uoi';
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCarouselSlider(),
          Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(children: [
                Rating(),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SourceSansPro',
                            fontSize: 30,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      child: SingleChildScrollView(
                          child: Container(
                        child: ReadMoreText(text,
                            trimLines: 3,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Plus ',
                            trimExpandedText: 'Moins ',
                            moreStyle: TextStyle(
                                color: Colors.teal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SourceSansPro',
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      )),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Prix / personne',
                            style: TextStyle(
                              color: Colors.black
                            )
                            ),
                          Text(
                            '\$ 100',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SourceSansPro',
                              fontSize: 30,
                              fontWeight: FontWeight.w600
                            )
                            ),
                        ]
                      )
                    )
                  ],
                )
              ]))
        ],
      ),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('Note : ',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'SourceSansPro',
              fontSize: 20,
              fontWeight: FontWeight.w600)),
      SizedBox(
        width: 15,
      ),
      Text('4.8',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'SourceSansPro',
              fontSize: 25,
              fontWeight: FontWeight.w700)),
      Icon(IconlyLight.star, color: Colors.yellow[600], size: 30)
    ]);
  }
}
