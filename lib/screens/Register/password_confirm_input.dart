import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';


import 'form_field_error.dart';

class PasswordConfirmInput extends StatefulWidget {
  final String firstInputPassword;
  final String placeholder;
  final Function setConfirmPassword;
  const PasswordConfirmInput({
    Key? key,
    required this.placeholder,
    required this.firstInputPassword,
    required this.setConfirmPassword
  }) : super(key: key);

  @override
  State<PasswordConfirmInput> createState() => _PasswordConfirmInputState();
}

class _PasswordConfirmInputState extends State<PasswordConfirmInput> {
  GlobalKey<FormFieldState> _pwdKey = GlobalKey<FormFieldState>();

  bool _isValide = true;
  String _validationMessage = '';

  
  void _validate(value) {
    if (value!.isEmpty) {
      _validationMessage = 'Veillez confimez le mot de passe !';
      setState(() {
        _isValide = false;
      });
    } else if (widget.firstInputPassword != value) {
      _validationMessage = 'Mot de passe différent !';
      setState(() {
        _isValide = false;
      });
    } else {
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
              onSaved: (newValue) {
                widget.setConfirmPassword(newValue);
              },
              onChanged: (value) {
                setState(() {
                  _isValide = true;
                });
              },
              key: _pwdKey,
              obscureText: true,
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
}
