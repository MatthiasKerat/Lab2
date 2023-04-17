
import 'package:flutter_test/flutter_test.dart';
import 'package:kerwel/auth/domain/LoginInputValidationType.dart';
import 'package:kerwel/auth/domain/ValidateLoginInputUseCase.dart';

void main() {
  group("ValidateLoginInputUseCase", () {
    test("Test password empty returns empty fields login validation type",() {
      expect(ValidateLoginInputUseCase().call(
          "MatthiasKerat@web.de", ""
      ), LoginInputValidationType.fieldsEmpty);
    });
    test("Test email empty returns empty fields login validation type",() {
      expect(ValidateLoginInputUseCase().call(
          "", "password"
      ), LoginInputValidationType.fieldsEmpty);
    });
    test("Test no valid email returns noEmail login validation type",() {
      expect(ValidateLoginInputUseCase().call(
          "MatthiasKerat", "password"
      ), LoginInputValidationType.noEmail);
    });
    test("Test everything fine returns valid input",() {
      expect(ValidateLoginInputUseCase().call(
          "MatthiasKerat@web.de", "password"
      ), LoginInputValidationType.validInput);
    });
  });
}