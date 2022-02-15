import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:iconly/iconly.dart';

import 'form_field_error.dart';
import 'helpers.dart';

class NameInput extends StatefulWidget {
  final Function saveValue;
  const NameInput({Key? key, required this.saveValue}) : super(key: key);

  @override
  State<NameInput> createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  bool _isValid = true;
  String _validationMessage = '';
  void validate(value) async {
    if (value.isEmpty) {
      _validationMessage = 'Entrez votre Pseudo !';
      setState(() {
        _isValid = false;
      });
    } else if (value.length < 2) {
      _validationMessage = 'Pseudo trop court (< 2 caractères)';
      setState(() {
        _isValid = false;
      });
    }
    else if(await isAlreadyExist('pseudo', value)){
      _validationMessage = 'Pseudo déjà pris !';
        setState(() {
          _isValid = false;
        });
    }
     else {
      setState(() {
        _isValid = true;
      });
    }
  }

  GlobalKey _pseudoKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GlassContainer.clearGlass(
            borderWidth: _isValid ? null : 3,
            borderColor: _isValid ? null : Colors.red,
            shadowColor: _isValid ? null : Colors.red,
            alignment: Alignment.center,
            height: 60,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: screenWidth,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: TextFormField(
              key: _pseudoKey,
              onSaved: (value) {
                _isValid ? widget.saveValue(value) : null;
              },
              onChanged: (value) {
                setState(() {
                  _isValid = true;
                });
                // _validateEmail(value);
              },
              cursorColor: Colors.white,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'SourceSansPro'),
              decoration: InputDecoration(
                  hintText: 'Pseudo',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                  border: InputBorder.none,
                  suffixIcon:
                      Icon(IconlyLight.profile, size: 30, color: Colors.white)),
              validator: (value) {
                validate(value);
              },
            )),
        _isValid
            ? Text('')
            : FieldError(
                message: _validationMessage,
              ),
      ],
    );
  }
}
