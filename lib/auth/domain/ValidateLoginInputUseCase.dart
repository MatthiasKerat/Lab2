
import 'package:kerwel/auth/domain/LoginInputValidationType.dart';

class ValidateLoginInputUseCase {
  LoginInputValidationType call(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return LoginInputValidationType.fieldsEmpty;
    }
    if (!email.contains("@")){
      return LoginInputValidationType.noEmail;
    }
    return LoginInputValidationType.validInput;
  }
}