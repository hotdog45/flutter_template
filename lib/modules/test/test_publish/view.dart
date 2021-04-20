import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class TestPublishPage extends StatelessWidget {
  final TestPublishLogic logic = Get.put(TestPublishLogic());
  final TestPublishState state = Get.find<TestPublishLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
