import 'package:duo_hao/modules/home/home/view.dart';
import 'package:duo_hao/modules/profile/profile/view.dart';
import 'package:duo_hao/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarLogic extends GetxController {
  RxInt selIndex = 0.obs;

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
