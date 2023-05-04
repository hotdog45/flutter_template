import 'package:flutter_template/app/routes/app_pages.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(seconds: 1));
    // 如果未登录就登录
    // 如果已登录就去task页面
    if (true) {
      Get.offNamed(Routes.MAIN);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
