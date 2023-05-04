import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/modules/not_found_module/not_found_bindings.dart';
import 'app/modules/not_found_module/not_found_page.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';
import 'config/dependency_injection.dart';
import 'config/global_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfig.init();
  await DenpendencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    final botToastBuilder = BotToastInit();
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.SPLASH,
              builder: (context, child) {
                child = GestureDetector(
                    onTap: () => hideKeyboard(context), child: child);
                child = botToastBuilder(context, child);
                if (Platform.isAndroid) {
                  /// 仅针对安卓
                  final systemUiOverlayStyle =
                      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
                  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
                }
                // if (true) { //是否黑白主题
                //   child = SaturationWidget(child: child);
                // }
                return child;
              },
              navigatorObservers: [BotToastNavigatorObserver()],
              theme: appThemeData,
              defaultTransition: Transition.cupertino,
              unknownRoute: GetPage(
                name: Routes.NOT_FOUND,
                page: () => NotFoundPage(),
                binding: NotFoundBinding(),
              ),
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                //一定要配置,否则iphone手机长按编辑框有白屏卡着的bug出现
              ],
              supportedLocales: [
                const Locale('zh', 'CN'), //设置语言为中文
              ],
              getPages: AppPages.pages);
        });
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
