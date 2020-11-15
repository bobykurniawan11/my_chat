import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_chat/utils/connection.dart';
import 'package:my_chat/utils/validator.dart';

class MockValidator extends Mock implements Validator {}

void main() {
  MockValidator mockValidator;

  setUp(() {
    mockValidator = MockValidator();
  });
  group('validation test', () {
    test('Email Field validation test ', () {
      expect(Validator().validateEmail("cerita@email.valid"), null);
      expect(Validator().validateEmail(""), "Email is required");
      expect(Validator().validateEmail("123"), "Invalid format");
    });
    test('Fullname Field validation test ', () {
      expect(Validator().validateFullname(""), "Fullname is required");
      expect(Validator().validateFullname("Boby Kurniawan Nugraha"), null);
    });
    test('Password Field validation test ', () {
      expect(Validator().validatePassword(""), "Password is required");
      expect(
          Validator().validatePassword("1234567"), "Password Min 8 characters");
      expect(Validator().validatePassword("12345678"), null);
    });
    test('Password Confirmation Field validation test ', () {
      expect(Validator().validatePasswordConfirmation("123456783", "12345678"),
          "The password confirmation does not match");
      expect(Validator().validatePasswordConfirmation("12345678", "12345678"),
          null);
    });
  });
}
