import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';

import 'register_form.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
  // var list = [1, 2, 3, 4, {"name": 1}];
  // String json = jsonEncode(list);
  // print('string' + json);

  // List list2 = jsonDecode(json);
  // print(list2);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: screenWidth,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/forest-min.jpg'),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: screenWidth,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Icon(IconlyLight.arrow_left,
                                size: 30, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(child: FormContainer(screenWidth: screenWidth))
                    ]
                  ),
              ),
            )
          )
        );
  }
}

class FormContainer extends StatelessWidget {
  const FormContainer({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: MediaQuery.of(context).size.height * .7,
      // color: Colors.red.shade100, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Inscrivez-vous !',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w700)),
          Text('Et commencez à explorer de beaux lieux',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'SourceSansPro',
                // fontWeight: FontWeight.w500
              )),
          SizedBox(
            height: 30,
          ),
          Expanded(child: RegisterForm(screenWidth: screenWidth)),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
