import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';

import 'form_field_error.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isShowed = false;
  GlobalKey<FormFieldState> _pwdKey = GlobalKey<FormFieldState>();

  bool _isValide = true;
  String _validationMessage = '';

  void _validate(value) {
    if (value!.isEmpty) {
      _validationMessage = 'Ce Champs ne doit être vide !';
      setState(() {
        _isValide = false;
      });
    } 
    else {
      setState(() {
        _isValide = true;
      });
    }
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
              onChanged: (value) {
                _validate(value);
              },
              key: _pwdKey,
              obscureText: _isShowed,
              cursorColor: Colors.white,
              style: TextStyle(
                  color: Colors.white, fontSize: 23, fontFamily: 'SourceSansPro'),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic),
                border: InputBorder.none,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isShowed = !_isShowed;
                    });
                  },
                  child: Icon(_isShowed ? IconlyLight.show : IconlyLight.hide,
                      size: 30, color: Colors.white),
                ),
              ),
              validator: (value) {
                _validate(value);
              },
            )),
            _isValide ? Text('') : FieldError(message: _validationMessage,)
      ],
    );
  }
}
