import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme_data.dart';

class AppTheme extends StatelessWidget {
  final Widget child;

  AppTheme({this.child});

  @override
  Widget build(BuildContext context) {
    final themeData = AppThemeData(context: context);
    return Provider.value(value: themeData, child: child);
  }
}
