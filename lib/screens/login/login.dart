import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/screens/Register/helpers.dart';

import 'login_form.dart';

class Login extends StatefulWidget {
  final bool? fromRegister;
  const Login({Key? key, this.fromRegister}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isFromRegister = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isFromRegister = widget.fromRegister == true;
    });
  }

  void showSnackBarIfFromRegister() {
    if (isFromRegister) {
      showSnackBar(context,
          title: 'Vous pouvez vous connecter !',
          message: 'Inscription réussie .',
          type: 'success'
          );
    }
    isFromRegister = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showSnackBarIfFromRegister();
    });

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: screenWidth,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/road.jpg'),
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
                      Container(
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
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(child: FormContainer(screenWidth: screenWidth))
                    ]),
              ),
            )));
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
          Text('Connectez-vous !',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w700)),
          Text('Et explorez de beaux endroits ',
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
          Expanded(child: LoginForm(screenWidth: screenWidth)),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
