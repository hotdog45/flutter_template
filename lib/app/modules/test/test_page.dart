import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/theme/app_colors.dart';
import 'dart:ui' as ui;
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import '../../../common/widget/app_widget.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("SettingPage").build(context),
      body: ListView(
        children: [
          Text('创建账户'.tr),
          _testBtn("弹窗".tr, () {
            showAnimatedDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return ClassicGeneralDialogWidget(
                  titleText: 'Title',
                  contentText: 'content',
                  onPositiveClick: () {
                    Navigator.of(context).pop();
                  },
                  onNegativeClick: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              animationType: DialogTransitionType.size,
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 1),
            );
          }),
          _testBtn("底部弹窗测试", () async {
            showAnimatedDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return Material(
                  color: Colors.transparent,
                  child: Container(
                    child: Column(
                      children: [
                        MySuperWidget(
                            height: 260, width: 300, bgColor: Colors.deepOrange),
                      ],
                    ),
                  ),
                );
              },
              animationType: DialogTransitionType.slideFromTopFade,
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 200),
              barrierColor: Colors.transparent,
            );
          }),
          _testBtn("切换语言为英语", () async {
            var locale = Locale('en', 'US');
            Get.updateLocale(locale);
          }),
          _testBtn("切换语言为中文", () async {
            var locale = Locale('zh', 'CN');
            Get.updateLocale(locale);
          }),
          _testBtn("切换语言为德语", () async {
            var locale = Locale('de', 'DE');
            Get.updateLocale(locale);
          }),
          _testBtn("切换语言为手机本地语言".tr, () async {
            var locale = ui.window.locale;
            Get.updateLocale(locale);
          })
        ],
      ),
    );
  }

  _testBtn(title, onTap) {
    return MySuperWidget(
      text: title,
      onTap: onTap,
      fontSize: 13,
      textColor: Colors.white,
      bgColor: randomColor(),
      height: 60,
      radius: 12,
      margin: const EdgeInsets.only(top: 10, left: 60, right: 60),
    );
  }
}
