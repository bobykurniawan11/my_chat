import 'package:flutter/material.dart';
import 'package:my_chat/page/register_screen/register_screen.dart';
import 'package:my_chat/utils/app_theme_data.dart';
import 'package:my_chat/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void validateLogin() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }

  Widget emailInput() {
    return TextFormField(
      key: Key("login_email_field"),
      controller: email_controller,
      validator: (value) {
        return Validator().validateEmail(value);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: AppThemeData(context: context).myTextTheme.caption,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppThemeData(context: context).borderRadius,
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppThemeData(context: context).colorSecondary,
            )),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget passInput() {
    return TextFormField(
      key: Key("login_password_field"),
      controller: password_controller,
      validator: (value) {
        return Validator().validatePassword(value);
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: AppThemeData(context: context).myTextTheme.caption,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: AppThemeData(context: context).borderRadius,
            borderSide: BorderSide(
              color: AppThemeData(context: context).colorSecondary,
            )),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: AppThemeData(context: context).colorPrimary,
          ),
          onPressed: _toggle,
        ),
      ),
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Welcome,",
                        style: AppThemeData(context: context)
                            .myTextTheme
                            .headline1,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Sign in to continue!",
                        style: AppThemeData(context: context)
                            .myTextTheme
                            .headline2,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      emailInput(),
                      SizedBox(
                        height: 16,
                      ),
                      passInput(),
                      SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password ?",
                          style: AppThemeData(context: context)
                              .myTextTheme
                              .bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: validateLogin,
                          padding: EdgeInsets.all(0),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius:
                                  AppThemeData(context: context).borderRadius,
                              color:
                                  AppThemeData(context: context).colorPrimary,
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(
                                  maxWidth: double.infinity, minHeight: 50),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                AppThemeData(context: context).borderRadius,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegisterScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
