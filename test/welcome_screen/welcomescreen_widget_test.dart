import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_chat/page/login_screen/login_screen.dart';
import 'package:my_chat/page/register_screen/register_screen.dart';
import 'package:my_chat/page/welcome_screen/welcome_screen.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  final mockObserver = MockNavigatorObserver();
  testWidgets('Intial test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WelcomeScreen(),
      navigatorObservers: [mockObserver],
    ));
    await tester.pumpAndSettle();
    expect(find.byType(WelcomeScreen), findsOneWidget);
  });
}
