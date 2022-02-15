Map<String, dynamic> passwordValidation(value) {
  String message = '';
  bool isValid = true;
  if (value!.isEmpty) {
    message = 'Ce Champs ne doit être vide !';
    isValid = false;
  } else if (value!.length < 7) {
    message = 'Mot de passe trop court ( < 7 caractères)';
    isValid = false;
  }
  // pwd must contain at least a digit
  else if (!RegExp(r'\d').hasMatch(value)) {
    message = 'Le mot passe doit au moins un chiffre';
    isValid = false;
  }
  // pwd must contain at least a letter
  else if (!RegExp(r'.*[a-zA-Z].*').hasMatch(value)) {
    message = 'Le mot passe doit au moins une lettre';
    isValid = false;
  } else {
    isValid = true;
  }
  return {
    "message": message,
    "isValid": isValid
  };
}
