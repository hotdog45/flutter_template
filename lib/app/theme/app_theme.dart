import 'package:flutter/material.dart';

import 'app_colors.dart';



 ThemeData get appThemeData => ThemeData(
  primaryColor: kAppPrimaryColor,
  // primaryColorLight: kPrimaryLightColor,
  scaffoldBackgroundColor: kAppBcgColor,
  accentColor: kAppPrimaryLightColor,
  appBarTheme: appBarTheme,
);

AppBarTheme get appBarTheme => AppBarTheme();