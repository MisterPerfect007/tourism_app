import 'package:flutter/material.dart';


class OneCard extends StatelessWidget {
  const OneCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 250,
      margin: EdgeInsets.only(right: 30),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 300,
            width: 250,
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
          Positioned(
            bottom: 15,
            child: Container(
              // height: 100,
              // alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 100,
                    width: 220,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      alignment: Alignment.topLeft,
                      height: 80,
                      width: 220,
                      padding: EdgeInsets.only(top: 15, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kanifushi',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: 'SourceSansPro'
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'Maldives, Asie du Sud  ',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // Pour la note

                  Positioned(
                    top: 5,
                    right: 30,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '4.9',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w600
                            ),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
          
        ],
      )
    );
  }
}