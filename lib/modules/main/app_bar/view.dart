import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:duo_hao/common/style/style.dart';
import 'package:duo_hao/modules/home/home/logic.dart';
import 'package:duo_hao/modules/home/home/view.dart';
import 'package:duo_hao/modules/profile/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
class AppBarPage extends GetView<AppBarLogic> {
  final List<Widget> tabBodies = [HomePage(), ProfilePage()];
    @override
    Widget build(BuildContext context) {
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
