import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';



class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 15,
        left: 15,
        right: 15,
        bottom: 15
      ),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Row(
        children: [
          Text(
            'Discover',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              fontFamily: 'SourceSansPro'
            ),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              IconButton(
                onPressed: (){print('yes');}, icon: Icon(
                IconlyLight.search,
                color: Colors.grey[700],
                size: 30,
              ))
              ,
              SizedBox(width: 15),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/id_photo.jpg',

                      )
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}