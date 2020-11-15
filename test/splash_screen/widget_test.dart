import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_chat/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:my_chat/main.dart';
import 'package:my_chat/page/splash_screen/splash_screeen.dart';
import 'package:my_chat/page/welcome_screen/welcome_screen.dart';
import 'package:my_chat/utils/app_theme.dart';
import 'package:my_chat/utils/connection.dart';

class MockSplashScreenBloc extends MockBloc<SplashScreenState>
    implements SplashScreenBloc {
  Connection connection;
  MockSplashScreenBloc({this.connection});
}

class MockConnectivity extends Mock implements Connection {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  MockSplashScreenBloc splashScreenBloc;
  MockConnectivity mockConnection;
  MockNavigatorObserver mockObserver;
  setUp(() {
    mockConnection = MockConnectivity();
    mockObserver = MockNavigatorObserver();
    splashScreenBloc = MockSplashScreenBloc(connection: mockConnection);
  });
  tearDown(() {
    splashScreenBloc?.close();
  });

  testWidgets('test when there is no connection', (WidgetTester tester) async {
    when(mockConnection.check()).thenAnswer((_) async => false);

    await tester.pumpWidget(AppTheme(
      child: MaterialApp(
        home: BlocProvider(
          create: (context) {
            return SplashScreenBloc(mockConnection);
          },
          child: SplashScreen(),
        ),
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.text("Please Check Your Internet Connection"), findsOneWidget);
  });

  testWidgets('test when connection available', (WidgetTester tester) async {
    when(mockConnection.check()).thenAnswer((_) async => true);

    await tester.pumpWidget(AppTheme(
      child: MaterialApp(
        navigatorObservers: [mockObserver],
        home: BlocProvider(
          create: (context) {
            return SplashScreenBloc(mockConnection);
          },
          child: SplashScreen(),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.byType(WelcomeScreen), findsOneWidget);
  });
}
