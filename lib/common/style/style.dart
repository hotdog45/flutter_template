import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

// 主题色
Color kAppPrimaryColor = Color(0xFFC1342D);
// 副主题色
Color kAppPrimaryLightColor = Color(0x88C1342D);
// 透明
Color kAppClearColor = Color(0x00ffffff);
// 背景色
Color kAppBcgColor = Color(0xFFF8F8F8);

// 主标题
Color kAppTextColor = Color(0xFF0D0E15);
// 副标题
Color kAppSubTextColor = Color(0xFF969696);

//阴影
Color kShadowColor = Color(0xeef8f8f8);

Color kAppColor(String hex) {
// 如果传入的十六进制颜色值不符合要求，返回默认值
  if (hex == null ||
      hex.length != 7 ||
      int.tryParse(hex.substring(1, 7), radix: 16) == null) {
    hex = '#ffffff';
  }
  return Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);
}


Color randomColor() {
  var random = Random();
  int r = random.nextInt(255);
  int g = random.nextInt(255);
  int b = random.nextInt(255);
  return Color.fromARGB(255, r, g, b);
}

ThemeData get appThemeData => ThemeData(
    primaryColor: kAppPrimaryColor,
    // primaryColorLight: kPrimaryLightColor,
    scaffoldBackgroundColor: kAppBcgColor,
    accentColor: kAppPrimaryLightColor,
    appBarTheme: appBarTheme,
);

AppBarTheme get appBarTheme => AppBarTheme();