import 'package:flutter_template/app/modules/profile_module/profile_controller.dart';
import 'package:flutter_template/app/data/repository/profile_repository.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(repository: ProfileRepository()));
  }
}
