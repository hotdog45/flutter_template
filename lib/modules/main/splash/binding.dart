import 'package:get/get.dart';

import 'logic.dart';


class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashLogic>(() => SplashLogic());
  }
}
