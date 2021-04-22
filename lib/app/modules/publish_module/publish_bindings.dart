import 'package:duo_hao/app/modules/publish_module/publish_controller.dart';
import 'package:duo_hao/app/data/repository/publish_repository.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PublishBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublishController(repository: PublishRepository()));
  }
}
