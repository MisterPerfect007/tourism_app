import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';

import 'form_field_error.dart';
import 'package:tourism_app/utils/password_validation.dart';

class PasswordInput extends StatefulWidget {
  final String placeholder;
  final Function setFirstInputPassword;
  final Function saveValue;
  const PasswordInput({
    Key? key,
    required this.placeholder,
    required this.setFirstInputPassword,
    required this.saveValue,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isShowed = false;
  GlobalKey<FormFieldState> _pwdKey = GlobalKey<FormFieldState>();

  bool _isValide = true;
  String _validationMessage = '';
  void _validate(value){
    Map<String, dynamic> validationInfo = passwordValidation(value);
    setState(() {
      _validationMessage = validationInfo["message"];
      _isValide = validationInfo["isValid"];
    });
  }
  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GlassContainer.clearGlass(
            borderWidth: _isValide ? null : 3,
            borderColor: _isValide ? null : Colors.red,
            shadowColor: _isValide ? null : Colors.red,
            alignment: Alignment.center,
            height: 60,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: screenWidth,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: TextFormField(
              onSaved: (value){
                _isValide ? widget.saveValue(value) : null;
              },
              onChanged: (value) {
                setState(() {
                  _isValide = true;
                  widget.setFirstInputPassword(value);
                });
              },
              key: _pwdKey,
              obscureText: !_isShowed,
              cursorColor: Colors.white,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'SourceSansPro'),
              decoration: InputDecoration(
                
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontStyle: FontStyle.italic),
                border: InputBorder.none,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isShowed = !_isShowed;
                    });
                  },
                  child: Icon(!_isShowed ? IconlyLight.show : IconlyLight.hide,
                      size: 30, color: Colors.white),
                ),
              ),
              validator: (value) {
                _validate(value);
              },
            )),
        _isValide
            ? Text('')
            : FieldError(
                message: _validationMessage,
              )
      ],
    );
  }
  // void _validate(value) {
  //   if (value!.isEmpty) {
  //     _validationMessage = 'Ce Champs ne doit être vide !';
  //     setState(() {
  //       _isValide = false;
  //     });
  //   } else if (value!.length < 7) {
  //     _validationMessage = 'Mot de passe trop court ( < 7 caractères)';
  //     setState(() {
  //       _isValide = false;
  //     });
  //   } 
  //   // pwd must contain at least a digit
  //   else if (!RegExp(r'\d').hasMatch(value)){
  //     _validationMessage = 'Le mot passe doit au moins un chiffre';
  //     setState(() {
  //       _isValide = false;
  //     });
  //   }
  //   // pwd must contain at least a letter
  //   else if (!RegExp(r'.*[a-zA-Z].*').hasMatch(value)){
  //     _validationMessage = 'Le mot passe doit au moins une lettre';
  //     setState(() {
  //       _isValide = false;
  //     });
  //   }
  //    else {
  //     setState(() {
  //       _isValide = true;
  //     });
  //   }
  // }
}
