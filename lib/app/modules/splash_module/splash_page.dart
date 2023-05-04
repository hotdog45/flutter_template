import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/modules/splash_module/splash_controller.dart';

import '../../../r.dart';

class SplashPage extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (_) {
          return Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text('WELCOME TO HERE',
                  style: Theme.of(context).textTheme.headline5),
              SizedBox(
                height: 120,
              ),
              Image.asset(
                R.assetsImagesSplash,
                fit: BoxFit.fitWidth,
              ),
            ],
          );
        },
      ),
    );
  }
}
