import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/getx/beach_controler.dart';
import 'package:tourism_app/getx/favorite_controller.dart';
import 'package:tourism_app/screens/SitePage/widget/custom_carousel_slider.dart';
import 'package:readmore/readmore.dart';

class SitePage extends StatefulWidget {
  SitePage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<SitePage> createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  final BeachController beachController = Get.put(BeachController());
  Map currentSite = {};

  fetchData() async {
    Map comingData = await beachController.getSiteById(widget.id);
    setState(() {
      currentSite = comingData;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => fetchData());
    // print(currentSite);
    return Scaffold(
      body: currentSite.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCarouselSlider(
                  site: currentSite,
                ),
                SiteInfos(site: currentSite)
              ],
            )
          : Text(''),
    );
  }
}

class SiteInfos extends StatelessWidget {
  // final String id;
  const SiteInfos({Key? key, required this.site
      // required this.id,
      })
      : super(key: key);

  final Map site;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(children: [
            Rating(
              rating: site["rating"],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                      // height: 120,
                      child: Container(
                        child: ReadMoreText(site["description"],
                            trimLines: 3,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Plus ',
                            trimExpandedText: 'Moins ',
                            moreStyle: TextStyle(
                                color: Colors.teal,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            lessStyle: TextStyle(
                                color: Colors.teal,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SourceSansPro',
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        child: Column(children: [
                      Text('Prix / personne',
                          style: TextStyle(color: Colors.grey[600])),
                      Text('\$ ${site["price"]}',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SourceSansPro',
                              fontSize: 30,
                              fontWeight: FontWeight.w700)),
                    ])),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ])),
    );
  }
}

class Rating extends StatelessWidget {
  final String rating;
  Rating({Key? key, required this.rating}) : super(key: key);

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
      Text('${rating}',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'SourceSansPro',
              fontSize: 25,
              fontWeight: FontWeight.w700)),
      Icon(IconlyLight.star, color: Colors.yellow[600], size: 30)
    ]);
  }
}
