import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size(screenWidth, 100),
      //   child: SafeArea(
      //     child: Container(
      //       color: Colors.transparent,
      //     )),
      // ),
      body: Stack(
        children: [
          
          Container(
            width: screenWidth,
            height: MediaQuery.of(context).size.height,
            
            child: Image.asset(
              'assets/images/road.jpg',
              fit: BoxFit.cover,
              ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Icon(
                        IconlyBold.arrow_left,
                        size: 30,
                        color: Colors.black
                        ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    'Connectez-vous !',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w600
                    )
                    ),
                  Text(
                    'Et explorez de beaux endroits ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      // fontWeight: FontWeight.w500
                    )
                    ),
                  SizedBox(height: 100,),
                  GlassContainer.clearGlass(
                    height: 60, 
                    width: screenWidth,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  SizedBox(height: 15,),
                  GlassContainer.clearGlass(
                    height: 60, 
                    width: screenWidth,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('J\'ai pas de compte'),
                        SizedBox(height: 10),
                        Container(
                          width: screenWidth,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              
                            ),
                            child: Text(
                              'Se Connecter',
                              style: TextStyle(
                                color: Colors.black
                              ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}