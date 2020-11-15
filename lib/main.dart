import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/utils/connection.dart';

import 'bloc/splash_screen/splash_screen_bloc.dart';
import 'page/splash_screen/splash_screeen.dart';
import 'utils/app_theme.dart';
import 'utils/app_theme_data.dart';
import 'utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Connection connection = new Connection();
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: MaterialApp(
        home: BlocProvider(
          create: (context) {
            return SplashScreenBloc(connection);
          },
          child: SplashScreen(),
        ),
      ),
    );
  }
}
