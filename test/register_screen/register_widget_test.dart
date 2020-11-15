import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_chat/page/register_screen/register_screen.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();
  group('Email input Validation Test', () {
    testWidgets('Make sure the input field exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      expect(find.byKey(Key("register_email_field")), findsOneWidget);
    });

    testWidgets(
        'validate if the error message (Email is required) showing in screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField = find
          .byKey(Key("register_email_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField.controller.text = "";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('Email is required'), findsOneWidget);
    });
    testWidgets(
        'validate if the error message (Invalid format) showing in screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField = find
          .byKey(Key("register_email_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField.controller.text = "boby";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('Invalid format'), findsOneWidget);
    });

    testWidgets('validate when user input valid email',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField = find
          .byKey(Key("register_email_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField.controller.text = "cerita@email.valid";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('Invalid format'), findsNothing);
      expect(find.text('Email is required'), findsNothing);
    });
  });
  group('Fullname input Validation Test', () {
    testWidgets('Make sure the input field exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      expect(find.byKey(Key("register_fullname_field")), findsOneWidget);
    });
    testWidgets(
        'validate if the error message (Fullname is required) showing in screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField = find
          .byKey(Key("register_fullname_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField.controller.text = "";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('Fullname is required'), findsOneWidget);
    });
    testWidgets('validate when user input valid fullname',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField = find
          .byKey(Key("register_fullname_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField.controller.text = "Boby";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('Fullname is required'), findsNothing);
    });
  });
  group('Password input Validation Test', () {
    testWidgets('Make sure the input field exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      expect(find.byKey(Key("register_password_field")), findsOneWidget);
    });
    testWidgets(
        'validate if the error message (Password is required) showing in screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField = find
          .byKey(Key("register_password_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField.controller.text = "";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('Password is required'), findsOneWidget);
    });
    testWidgets(
        'validate if the error message (Password Min 8 characters) showing in screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField = find
          .byKey(Key("register_password_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField.controller.text = "123456";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('Password Min 8 characters'), findsOneWidget);
    });
    testWidgets('test when user input valid password',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField = find
          .byKey(Key("register_fullname_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField.controller.text = "12345678";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('Password Min 8 characters'), findsNothing);
    });
  });

  group('Password Confirmation input Validation Test', () {
    testWidgets('Make sure the input field exists',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      expect(find.byKey(Key("register_password_confirmation_field")),
          findsOneWidget);
    });
    testWidgets(
        'validate if the error message (The password confirmation does not match) showing in screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField_confirmation = find
          .byKey(Key("register_password_confirmation_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      TextFormField textField_password = find
          .byKey(Key("register_password_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField_confirmation.controller.text = "12345678";
      textField_password.controller.text = "123456789";

      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(find.text('The password confirmation does not match'),
          findsOneWidget);
    });
    testWidgets('test when user input valid password confirmation',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: RegisterScreen(),
      ));
      TextFormField textField_confirmation = find
          .byKey(Key("register_password_confirmation_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      TextFormField textField_password = find
          .byKey(Key("register_password_field"))
          .evaluate()
          .first
          .widget as TextFormField;

      textField_confirmation.controller.text = "12345678";
      textField_password.controller.text = "12345678";
      await tester.tap(find.text('Register'));
      await tester.pump(const Duration(milliseconds: 100)); // add delay
      expect(
          find.text('The password confirmation does not match'), findsNothing);
    });
  });
}
