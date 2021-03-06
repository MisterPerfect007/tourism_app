import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';

import 'form_field_error.dart';

class EmailInput extends StatefulWidget {
  final Function setEmail;
  const EmailInput({
    Key? key,
    required this.setEmail
  }) : super(key: key);

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
    GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();

    bool _isEmailValide = true;
    String _validationMessage = '';
    String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    void _validateEmail(value) {
      if (value!.isEmpty) {
        _validationMessage = 'Ce champs ne doit pas être vide !';
        setState(() {
          _isEmailValide = false;
        });
      }else if (!RegExp(emailRegex).hasMatch(value)){
      _validationMessage = 'Ce e-mail n\'est pas correct';
      setState(() {
        _isEmailValide = false;
      });
    }
       else {
        setState(() {
          _isEmailValide = true;
        });
      }
    }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


    return Column(
      children: [
        GlassContainer.clearGlass(
           
            borderWidth: _isEmailValide ? null : 3,
            borderColor: _isEmailValide ? null : Colors.red,
            shadowColor: _isEmailValide ? null : Colors.red,
            alignment: Alignment.center,
            height: 60,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: screenWidth,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: TextFormField(
              key: _emailKey,
              onSaved: (newValue) {
                setState(() {
                  widget.setEmail(newValue);
                });
              },
              onChanged: (value) {
                setState((){
                  _isEmailValide = true;
                });
                // _validateEmail(value);
              },
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              style: TextStyle(
                  color: Colors.white, fontSize: 23, fontFamily: 'SourceSansPro'),
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                  border: InputBorder.none,
                  suffixIcon:
                      Icon(IconlyLight.message, size: 30, color: Colors.white)),
              validator: (value) {
                 _validateEmail(value);
              },
            )),
            _isEmailValide ? Text('') : FieldError(message: _validationMessage,),
      ],
    );
  }
}
