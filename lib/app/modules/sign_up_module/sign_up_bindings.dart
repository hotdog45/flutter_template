import 'package:duo_hao/app/modules/sign_up_module/sign_up_controller.dart';
import 'package:duo_hao/app/data/repository/sign_up_repository.dart';
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
