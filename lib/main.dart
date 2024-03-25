import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/modules/main_module/splash_page.dart';
import 'common/config/dependency_injection.dart';
import 'common/theme/app_theme.dart';
import 'common/translations/Messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
            home: SplashPage(),
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
              return child;
            },
            navigatorObservers: [BotToastNavigatorObserver()],
            theme: appThemeData,
            translations: Messages(),
            // 你的翻译
            locale: Locale('zh', 'CN'),
            // 将会按照此处指定的语言翻译
            fallbackLocale: Locale('en', 'US'),
            // 添加一个回调语言选项，以备上面指定的语言翻译不存在
            defaultTransition: Transition.cupertino,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              //一定要配置,否则iphone手机长按编辑框有白屏卡着的bug出现
            ],
            supportedLocales: [
              const Locale('zh', 'CN'), //设置语言为中文
            ],
          );
        });
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
