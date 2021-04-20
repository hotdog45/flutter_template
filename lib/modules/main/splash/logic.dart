import 'package:duo_hao/routes/app_pages.dart';
import 'package:get/get.dart';


class SplashLogic extends GetxController {


  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(seconds: 1));
     // 如果未登录就登录
    // 如果已登录就去task页面
    if (false) {
      Get.offNamed(Routes.MAIN);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
