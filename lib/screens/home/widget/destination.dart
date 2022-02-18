import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Destination extends StatelessWidget {
  final String name;
  final String city;
  final String image;
  final String country;
  final String continent;
  final String rating;
  const Destination({
    required this.name,
    required this.city,
    required this.image,
    required this.country,
    required this.continent,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // width: 200,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image
                )
              )
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 7, bottom: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name != ''? name : city,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'SourceSansPro'
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  '${country}, ${continent}',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro'
                  ),
                ),
                Expanded(child: Container()),
                Row(children: [
                  Icon(
                    IconlyBold.star,
                    size: 15,
                    color: Colors.amber,
                    ),
                    SizedBox(
                      width: 5
                    ),
                  Text(
                    '${rating}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      fontFamily: 'SourceSansPro'
                    ),
                  )
                ],)
              ]
            ),
          )
        ],
      ),
    );
  }
}