import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../r.dart';
import 'logic.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashLogic>(
        builder: (_) {
          return Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text('WELCOME TO HERE',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold)),
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
