import 'package:get/get.dart';

import 'logic.dart';


class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppBarLogic>(() => AppBarLogic());
  }
}
