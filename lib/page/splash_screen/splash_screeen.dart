import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:my_chat/page/welcome_screen/welcome_screen.dart';
import 'package:my_chat/utils/app_theme_data.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenBloc splashScreenBloc;
  @override
  void initState() {
    splashScreenBloc = BlocProvider.of<SplashScreenBloc>(context);

    splashScreenBloc.add(CheckInternet());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("scaff_splashscreen"),
      body: Center(
        child: BlocListener<SplashScreenBloc, SplashScreenState>(
          listener: (context, state) async {
            if (state is SplashScreenLoading) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          "Checking your internet ...",
                          style: AppThemeData(context: context).myTextTheme.button,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is SplashScreenFinishFailed) {
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.warning),
                        Text(
                          "Please Check Your Internet Connection",
                          style: AppThemeData(context: context).myTextTheme.button,
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is SplashScreenFinishSuccess) {
              Navigator.of(context).pushReplacement(new WelcomeScreenRoute());
            }
          },
          child: Center(
            child: Image.asset(
              "./assets/images/logo_transparent.png",
              key: Key("splash_screen_image"),
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreenRoute extends MaterialPageRoute {
  WelcomeScreenRoute() : super(builder: (BuildContext context) => new WelcomeScreen());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return new RotationTransition(
      turns: animation,
      child: new ScaleTransition(
        scale: animation,
        child: new FadeTransition(
          opacity: animation,
          child: new WelcomeScreen(),
        ),
      ),
    );
  }
}
