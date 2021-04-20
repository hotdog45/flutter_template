import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class TestHomePage extends StatelessWidget {
  final TestHomeLogic logic = Get.put(TestHomeLogic());
  final TestHomeState state = Get.find<TestHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
