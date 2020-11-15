import 'package:flutter/material.dart';
import 'package:my_chat/page/login_screen/login_screen.dart';
import 'package:my_chat/utils/app_theme_data.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("./assets/images/logo_transparent.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: AppThemeData(context: context).my_textTheme.headline2,
              ),
            ],
          ),
          SizedBox(height: 70),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                height: 40.0,
                minWidth: MediaQuery.of(context).size.width * .75,
                color:
                    AppThemeData(context: context).my_customTheme.primaryColor,
                child: new Text(
                  "Login",
                  style: AppThemeData(context: context).my_textTheme.button,
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ),
                },
                shape: RoundedRectangleBorder(
                  borderRadius: AppThemeData(context: context).borderRadius,
                ),
              ),
              MaterialButton(
                height: 40.0,
                minWidth: MediaQuery.of(context).size.width * .75,
                color:
                    AppThemeData(context: context).my_customTheme.primaryColor,
                child: new Text(
                  "Register",
                  style: AppThemeData(context: context).my_textTheme.button,
                ),
                onPressed: () => {},
                shape: RoundedRectangleBorder(
                  borderRadius: AppThemeData(context: context).borderRadius,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
