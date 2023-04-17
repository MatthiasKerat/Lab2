
import 'package:flutter/cupertino.dart';
import 'package:kerwel/auth/domain/LoginInputValidationType.dart';
import 'package:kerwel/auth/domain/ValidateLoginInputUseCase.dart';

class LoginViewModel with ChangeNotifier {

  final _validateLoginInputUseCase = ValidateLoginInputUseCase();

  String _email = "";
  String _password = "";
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

  void _processUserInput(){
    final result = _validateLoginInputUseCase(
      _email,
      _password
    );
    _setErrorHint(result);
    _setButtonEnabled(result);
    notifyListeners();
  }

  void _setErrorHint(LoginInputValidationType validationType) {
    switch (validationType) {
      case LoginInputValidationType.noEmail:
        _errorHint = "Es handelt sich um keine Email";
        break;
      case LoginInputValidationType.fieldsEmpty:
        _errorHint = "Es müssen alle Felder ausgefüllt werden";
        break;
      default:
        _errorHint = "";
    }
  }

  void _setButtonEnabled(LoginInputValidationType validationType) {
    _isLoginEnabled = validationType == LoginInputValidationType.validInput;
  }
}