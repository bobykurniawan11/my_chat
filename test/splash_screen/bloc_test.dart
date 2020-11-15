// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_chat/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:my_chat/utils/connection.dart';

class MockSplashScreenBloc extends MockBloc<SplashScreenState>
    implements SplashScreenBloc {}

class MockConnectivity extends Mock implements Connection {}

void main() {
  MockSplashScreenBloc splashScreenBloc;
  MockConnectivity mockConnection;

  setUp(() {
    splashScreenBloc = MockSplashScreenBloc();
    mockConnection = MockConnectivity();
  });
  tearDown(() {
    splashScreenBloc?.close();
  });

  group('Bloc Test', () {
    blocTest('No Event added',
        build: () => SplashScreenBloc(mockConnection), expect: []);
    blocTest(
      'Should emmit SplashScreenLoading,SplashScreenFinishSuccess',
      build: () {
        when(mockConnection.check()).thenAnswer((_) async => true);
        return SplashScreenBloc(mockConnection);
      },
      act: (bloc) => bloc.add(CheckInternet()),
      expect: [SplashScreenLoading(), SplashScreenFinishSuccess()],
    );

    blocTest(
      'Should emmit SplashScreenLoading,SplashScreenFinishFailed',
      build: () {
        when(mockConnection.check()).thenAnswer((_) async => false);
        return SplashScreenBloc(mockConnection);
      },
      act: (bloc) => bloc.add(CheckInternet()),
      expect: [SplashScreenLoading(), SplashScreenFinishFailed()],
    );
  });
}
