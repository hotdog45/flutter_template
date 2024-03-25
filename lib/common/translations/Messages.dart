import 'package:get/get.dart';

import 'de_DE.dart';
import 'en_US.dart';
import 'zh_CN.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'de_DE': de_DE,
        'en_US': en_US,
      };
}

///改变语言
// 调用Get.updateLocale(locale)来更新语言环境。然后翻译会自动使用新的locale。
//
// var locale = Locale('en', 'US');
// Get.updateLocale(locale);

///要读取系统语言，可以使用window.locale。
//
// import 'dart:ui' as ui;
//
// return GetMaterialApp(
//     locale: ui.window.locale,
// );
