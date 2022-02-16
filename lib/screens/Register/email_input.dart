import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';

import 'form_field_error.dart';
import 'package:tourism_app/screens/Register/helpers.dart';

class EmailInput extends StatefulWidget {
  final Function saveValue;
  const EmailInput({
    Key? key,
    required this.saveValue
  }) : super(key: key);

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
    

    bool _isEmailValide = true;
    String _validationMessage = '';
    String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    void _validateEmail(value) async {
      if (value!.isEmpty) {
        _validationMessage = 'Ce champs ne doit pas être vide !';
        setState(() {
          _isEmailValide = false;
        });
      }else if (!RegExp(emailRegex).hasMatch(value)){
      _validationMessage = 'Cet e-mail n\'est pas correct';
      setState(() {
        _isEmailValide = false;
      });
    }else if(await isAlreadyExist('email', value)){
      _validationMessage = 'cet email existe déja !';
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
    GlobalKey _emailKey = GlobalKey();
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
              onSaved: (value){
                _isEmailValide? widget.saveValue(value) : null;
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
