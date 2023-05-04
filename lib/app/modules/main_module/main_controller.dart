import 'package:flutter_template/app/data/repository/main_repository.dart';
import 'package:flutter_template/app/modules/home_module/home_controller.dart';
import 'package:flutter_template/app/modules/profile_module/profile_controller.dart';
import 'package:flutter_template/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/home_repository.dart';
import '../home_module/home_page.dart';
import '../profile_module/profile_page.dart';

class MainController extends GetxController {
  final MainRepository? repository;

  MainController({ this.repository});

  RxInt selIndex = 0.obs;
  final HomeController home = Get.put(HomeController(repository:HomeRepository()));
  final ProfileController profile = Get.put(ProfileController());

  List<Widget> tabBodies = [];

  @override
  void onInit() async {
    super.onInit();
    tabBodies = [
      HomePage(),
      ProfilePage()
    ];
  }
  var tabIndex = 0.obs;

  selectedTabIndex(int i) {
    tabIndex.value = i;
    update();
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


  int last = 0;
  Future<bool> doubleClickBack() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last > 1000) {
      last = DateTime.now().millisecondsSinceEpoch;
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
