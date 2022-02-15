import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tourism_app/screens/Register/name_input.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'email_input.dart';
import 'helpers.dart';
import 'password_confirm_input.dart';
import 'password_input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isProcessing = false;

  String firstInputPassword = '';
  String confirmPassword = '';

  void setFirstInputPassword(value) {
    setState(() {
      firstInputPassword = value;
    });
  }

  void setConfirmPassword(value) {
    setState(() {
      confirmPassword = value;
    });
  }

  Map formData = {"pseudo": '', "email": '', "password": ''};
  void setPseudo(value) {
    formData["pseudo"] = value;
  }

  void setEmail(value) {
    formData["email"] = value;
  }

  void setPassword(value) {
    formData["password"] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Pseudo
        NameInput(saveValue: setPseudo),
        SizedBox(
          height: 5,
        ),
        //email
        EmailInput(
          saveValue: setEmail,
        ),

        SizedBox(
          height: 15,
        ),
        PasswordInput(
          placeholder: 'Mot de passe ',
          setFirstInputPassword: setFirstInputPassword,
          saveValue: setPassword,
        ),
        SizedBox(
          height: 5,
        ),
        PasswordConfirmInput(
          placeholder: 'Confirmez le mot de passe ',
          firstInputPassword: firstInputPassword,
          setConfirmPassword: setConfirmPassword,
        ),
        SizedBox(
          height: 50,
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
                    onPressed: () {
                      if (!isProcessing) {
                        _formKey.currentState!.validate();
                        _formKey.currentState!.save();
                        saveUser();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 15,
                      primary: isProcessing
                          ? Colors.grey.withOpacity(0.8)
                          : Colors.white.withOpacity(0.8),
                    ),
                    child: isProcessing
                        ? SpinKitWave(
                            color: Colors.black,
                            size: 20.0,
                          )
                        : Text(
                            'Créer son compte',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        // Expanded(child: Container()),
      ]),
    );
  }

  //function for saving user into the sharedPrefecences
  //
  Future saveUser() async {
    if (formData["email"].isNotEmpty &&
        formData["password"].isNotEmpty &&
        formData["password"] == confirmPassword &&
        !(await isAlreadyExist('email', formData["email"])) &&
        !(await isAlreadyExist('pseudo', formData["pseudo"])) 
      ) {
      setState(() {
        isProcessing = true;
      });
      var uuid = Uuid();

      Map userData = {
        "id": uuid.v1().toString(),
        "pseudo": formData["pseudo"],
        "email": formData["email"],
        "password": formData["password"],
      };
      // print(userData);
      final prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey('users')) {
        String? users = prefs.getString('users');
        List usersList = jsonDecode(users!);

        // Map existingEmail = usersList.firstWhere((user) =>
        //     user["email"] == userData["email"] );
        // if(existingEmail["email"]){

        // }

        usersList.add(userData);
        prefs.setString('users', jsonEncode(usersList));
      } else {
        prefs.setString('users', jsonEncode([userData]));
      }
      // print(prefs.getString('users'));
      // prefs.remove('users');
    }
  }
}
void handleExistingEmail(email){
  
}