import 'package:flutter_template/app/modules/login_module/login_controller.dart';
import 'package:flutter_template/app/data/repository/login_repository.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(repository: LoginRepository()));
  }
}
