import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TopDestinations extends StatelessWidget {
  const TopDestinations({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meilleurs destinations',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade800
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Destination(),
                Destination(),
              ],
            ),
          )
        ],
      )
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({
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
                  'assets/images/beach-img.jpg'
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
                  'Kanifushi',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'SourceSansPro'
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  'Maldives, Asie du Sud',
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
                    '4.9',
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