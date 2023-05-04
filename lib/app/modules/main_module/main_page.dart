
import 'package:dio_log/dio_log.dart';
import 'package:flutter_template/app/modules/home_module/home_page.dart';
import 'package:flutter_template/app/modules/profile_module/profile_page.dart';
import 'package:flutter_template/app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_template/app/modules/main_module/main_controller.dart';

import '../../../widget/my_image.dart';
import '../../theme/app_colors.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class MainPage extends GetWidget<MainController> {
  final List<Widget> tabBodies = [HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      global: true,
      builder: (logic) {
        ///放置在 initState 方法中，会导致 ApplicationController 重复创建
        Get.put(logic, tag: MainController().runtimeType.toString());
        return Scaffold(
          body: WillPopScope(
            onWillPop: logic.doubleClickBack,
            child: Center(
              child: IndexedStack(
                index: logic.tabIndex.value,
                children: logic.tabBodies,
              ),
            ),
          ),
          bottomNavigationBar: CupertinoTabBar(
            items: _getBottomList(),
            currentIndex: logic.tabIndex.value,
            activeColor: kAppPrimaryColor,
            inactiveColor: kAppColor("#999999"),
            backgroundColor: Colors.white,
            onTap: (i) {
              logic.selectedTabIndex(i);
            },
          ),
          floatingActionButton: _getDebugFloatButton(),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _getBottomList() {
    List<BottomNavigationBarItem> bottomTabs = [
      _getBottomNavigationBarItem(
          "首页", "app_main_unselect.png", "app_main_selected.png"),
      _getBottomNavigationBarItem(
          "我的", "app_mine_unselect.png", "app_mine_selected.png"),
    ];

    return bottomTabs;
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(title, icon, activeIcon) {
    return BottomNavigationBarItem(
        icon: MyImage(icon, width: 25, height: 25, isAssetImage: true),
        activeIcon:
            MyImage(activeIcon, width: 25, height: 25, isAssetImage: true),
        label: title);
  }

  Widget _getDebugFloatButton() {
    if (kProfileMode || kDebugMode) {
      return FloatingActionButton(
        child: Icon(Icons.settings_sharp),
        onPressed: () {
          // Get.to(TestPage());
        },
      );
    } else {
      return SizedBox();
    }
  }
}
