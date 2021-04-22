import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dio_log/dio_log.dart';
import 'package:duo_hao/app/modules/home_module/home_page.dart';
import 'package:duo_hao/app/modules/profile_module/profile_page.dart';
import 'package:duo_hao/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_hao/app/modules/main_module/main_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MainPage extends GetWidget<MainController> {
  final List<Widget> tabBodies = [HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    showDebugBtn(context);
    return Scaffold(
      body: Obx(()=> tabBodies[controller.selIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixed,
        color: kAppPrimaryLightColor,
        activeColor: kAppPrimaryColor,
        backgroundColor: Colors.white,
        items: [
          TabItem(icon: Icons.home,title: "home",),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.people,title: "mine"),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => controller.switchTab(i),
      ),
    );
  }
}
