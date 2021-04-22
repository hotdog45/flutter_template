import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class TrTerPage extends StatelessWidget {
  final TrTerLogic logic = Get.put(TrTerLogic());
  final TrTerState state = Get.find<TrTerLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
