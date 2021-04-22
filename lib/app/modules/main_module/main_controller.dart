import 'package:duo_hao/app/data/repository/main_repository.dart';
import 'package:duo_hao/app/modules/home_module/home_controller.dart';
import 'package:duo_hao/app/modules/profile_module/profile_controller.dart';
import 'package:duo_hao/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final MainRepository repository;

  MainController({this.repository});

  RxInt selIndex = 0.obs;
  final HomeController home = Get.put(HomeController());
  final ProfileController profile = Get.put(ProfileController());

  @override
  void onInit() async {
    super.onInit();
  }

  switchTab(index) {
    if (index == 0) {
      selIndex.value = 0;
    } else if (index == 1) {
      Get.toNamed(Routes.PUBLISH);
    } else if (index == 2) {
      selIndex.value = 1;
    }
  }
}
