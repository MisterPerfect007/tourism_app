import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism_app/screens/Register/helpers.dart';
import 'package:tourism_app/screens/Register/register.dart';
import 'package:tourism_app/screens/login/helpers.dart';

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

  String email = '';
  String password = '';
  bool isformInProcessing = false;

  @override
  Widget build(BuildContext context) {
    void setEmail(value) {
      setState(() {
        email = value;
      });
    }

    void setPassword(value) {
      setState(() {
        password = value;
      });
    }

    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        EmailInput(
          setEmail: setEmail,
        ),

        SizedBox(
          height: 15,
        ),
        PasswordInput(
          setPassword: setPassword,
        ),
        SizedBox(
          height: 100,
        ),
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
                    onPressed: () async {
                      _formKey.currentState!.validate();
                      if (_formKey.currentState!.validate()) {
                        // print('ooooooo');
                        _formKey.currentState!.save();
                        setState(() {
                          isformInProcessing = true;
                        });
                        if (await isUserExisting(
                            email: email, password: password)) {
                          await handleUserConnection(context, email, password);
                        } else {
                          showSnackBar(context,
                              title: 'Email ou mot de passe incorrect !',
                              message: 'Vérifier vos identifiants',
                              type: 'failed');
                        }
                        setState(() {
                          isformInProcessing = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white.withOpacity(0.8),
                    ),
                    child: !isformInProcessing
                        ? Row(
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
                          )
                        : SpinKitWave(
                            color: Colors.black,
                            size: 20.0,
                          ),
                  )),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text(
                  'Créer un compte',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
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
