import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';


class OneCard extends StatelessWidget {
  const OneCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 280,
      margin: EdgeInsets.only(right: 30),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 320,
            width: MediaQuery.of(context).size.width,
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
            //
            //
                //Adding or Removing 
            //
            //
            Positioned(
              right: 20,
              top: 20,
              child: AddToFavorite()
            ),
            //
            //
                //Bottom banner
            //
            //
          Positioned(
            bottom: 15,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 100,
                    width: 240,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      alignment: Alignment.topLeft,
                      height: 80,
                      width: 240,
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
                              fontWeight: FontWeight.w800,
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

class AddToFavorite extends StatefulWidget {
  const AddToFavorite({
    Key? key,
  }) : super(key: key);

  @override
  State<AddToFavorite> createState() => _AddToFavoriteState();
}

class _AddToFavoriteState extends State<AddToFavorite> {
  bool isFavorite = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.7),
        borderRadius: BorderRadius.all(Radius.circular(40))
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.9),
            borderRadius: BorderRadius.all(Radius.circular(40))
          ),
          child: Icon(
            isFavorite ? IconlyBold.heart  : IconlyLight.heart,
            color: isFavorite ? Colors.red : Colors.black87,
            ),
        ),
      ),
    );
  }
}