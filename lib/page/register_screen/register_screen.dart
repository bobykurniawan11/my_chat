import 'package:flutter/material.dart';
import '../../utils/app_theme_data.dart';
import '../../utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email_controller = TextEditingController();
  TextEditingController fullname_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController password_confirmation_controller =
      TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void validateRegister() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }

  Widget emailInput() {
    return TextFormField(
      controller: email_controller,
      key: Key("register_email_field"),
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
      validator: (value) {
        return Validator().validateEmail(value);
      },
    );
  }

  Widget fullnameInput() {
    return TextFormField(
      key: Key("register_fullname_field"),
      controller: fullname_controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Fullname",
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
      validator: (value) {
        return Validator().validateFullname(value);
      },
    );
  }

  Widget passInput() {
    return TextFormField(
      key: Key("register_password_field"),
      controller: password_controller,
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
      validator: (value) {
        return Validator().validatePassword(value);
      },
    );
  }

  Widget passConfirmationInput() {
    return TextFormField(
      key: Key("register_password_confirmation_field"),
      controller: password_confirmation_controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Password Confirmation",
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
      validator: (value) {
        return Validator()
            .validatePasswordConfirmation(password_controller.text, value);
      },
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
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Register Here, ",
                        style: AppThemeData(context: context)
                            .myTextTheme
                            .headline1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: <Widget>[
                      emailInput(),
                      SizedBox(
                        height: 16,
                      ),
                      fullnameInput(),
                      SizedBox(
                        height: 16,
                      ),
                      passInput(),
                      SizedBox(
                        height: 12,
                      ),
                      passConfirmationInput(),
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
                          onPressed: validateRegister,
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
                                "Register",
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
                        height: 50,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Back",
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
