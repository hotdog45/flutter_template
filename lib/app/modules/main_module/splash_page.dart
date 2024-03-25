import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_APP/app/modules/main_module/main_page.dart';
import 'package:flutter_APP/common/extension/get_extension.dart';
import '../../../../r.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    goHomePage();
  }

  void goHomePage() async {
    await Future.delayed(
        Duration(milliseconds: Platform.isAndroid ? 1500 : 800));
    Get.offAll(MainPage());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // 状态栏字体颜色（黑色）
        statusBarColor: Colors.transparent));

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Center(
              child: Image.asset(R.assetsImagesSplash, fit: BoxFit.fitHeight))
        ]));
  }
}
