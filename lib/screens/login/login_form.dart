import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/screens/Register/register.dart';

import 'email_input.dart';
import 'password_input.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
        EmailInput(),
        
        SizedBox(
          height: 15,
        ),
        PasswordInput(),
        SizedBox(height: 100,),
        Container(
          width: widget.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              
              SizedBox(height: 10),
              Container(
                width: widget.screenWidth,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white.withOpacity(0.8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Se Connecter',
                          style: TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(IconlyLight.login,
                            color: Colors.black, size: 30)
                      ],
                    )),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => Register()));
                },
                child: Text(
                  'Créer un compte',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        ),
      // Expanded(child: Container()),
      ]),
    );
  }
}

