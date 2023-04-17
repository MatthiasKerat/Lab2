
import 'RegisterInputValidationType.dart';

class ValidateRegisterInputUseCase {

  RegisterInputValidationType call(
      String email,
      String password,
      String passwordRepeated
  ) {
    if(email.isEmpty || password.isEmpty || passwordRepeated.isEmpty) {
      return RegisterInputValidationType.emptyField;
    }
    if(password != passwordRepeated) {
      return RegisterInputValidationType.passwordsDoNotMatch;
    }
    if(password.length < 8) {
      return RegisterInputValidationType.passwordTooShort;
    }
    if (!email.contains("@")){
      return RegisterInputValidationType.noEmail;
    }
    return RegisterInputValidationType.validInput;
  }

}