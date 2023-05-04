import 'package:flutter_template/app/modules/not_found_module/not_found_controller.dart';

import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class NotFoundBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotFoundController( ));
  }
}