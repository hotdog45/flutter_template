import 'package:flutter_template/app/modules/sign_up_module/sign_up_controller.dart';
import 'package:flutter_template/app/data/repository/sign_up_repository.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(repository: SignUpRepository()));
  }
}
