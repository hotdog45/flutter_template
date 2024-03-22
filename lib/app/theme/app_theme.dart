import 'package:flutter/material.dart';

import 'app_colors.dart';



ThemeData get appThemeData => ThemeData(
 primaryColor: kAppPrimaryColor,
 scaffoldBackgroundColor: kAppBcgColor,
 appBarTheme: appBarTheme, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAppPrimaryLightColor),
);

AppBarTheme get appBarTheme => AppBarTheme();