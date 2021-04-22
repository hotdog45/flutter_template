import 'package:duo_hao/app/modules/home_module/home_controller.dart';
 import 'package:duo_hao/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(repository: HomeRepository( )));
  }
}