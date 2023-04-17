
import 'package:flutter/cupertino.dart';
import 'package:kerwel/auth/domain/RegisterInputValidationType.dart';
import 'package:kerwel/auth/domain/ValidateRegisterInputUseCase.dart';

class RegisterViewModel with ChangeNotifier {

  final _validateRegisterInputUseCase = ValidateRegisterInputUseCase();

  String _email = "";
  String _password = "";
  String _passwordRepeated = "";
  String _errorHint = "";
  bool _isLoginEnabled = false;

  String get errorHint => _errorHint;
  bool get isLoginEnabled => _isLoginEnabled;

  void onEmailValueChange(String newValue) {
    _email = newValue;
    _processUserInput();
  }

  void onPasswordValueChange(String newValue) {
    _password = newValue;
    _processUserInput();
  }

  void onPasswordRepeatedValueChange(String newValue) {
    _passwordRepeated = newValue;
    _processUserInput();
  }

  void _processUserInput(){
    final result = _validateRegisterInputUseCase(
        _email,
        _password,
        _passwordRepeated
    );
    _setErrorHint(result);
    _setButtonEnabled(result);
    notifyListeners();
  }

  void _setErrorHint(RegisterInputValidationType validationType) {
    switch (validationType) {
      case RegisterInputValidationType.noEmail:
        _errorHint = "Es handelt sich um keine Email";
        break;
      case RegisterInputValidationType.emptyField:
        _errorHint = "Es müssen alle Felder ausgefüllt werden";
        break;
      case RegisterInputValidationType.passwordTooShort:
        _errorHint = "Passwort muss mindestens 8 Zeichen lang sein";
        break;
      case RegisterInputValidationType.passwordsDoNotMatch:
        _errorHint = "Passwörter stimmen nicht überein";
        break;
      default:
        _errorHint = "";
    }
  }

  void _setButtonEnabled(RegisterInputValidationType validationType) {
    _isLoginEnabled = validationType == RegisterInputValidationType.validInput;
  }
}
