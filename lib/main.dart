import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/style/style.dart';
import 'config/dependency_injection.dart';
import 'config/global_config.dart';
import 'modules/main/app_bar/view.dart';
import 'modules/main/splash/binding.dart';
import 'modules/main/splash/view.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfig.init();
  await DenpendencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit(); //1.调用BotToastInit
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        builder: () => GetMaterialApp(
              home: SplashPage(),
              initialBinding: SplashBinding(),
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              builder: (context, child) {
                child = Scaffold(
                    body: GestureDetector(
                        onTap: () => hideKeyboard(context),
                        child: child)); //do something
                child = botToastBuilder(context, child);
                return child;
              },
              navigatorObservers: [BotToastNavigatorObserver()],
              theme: appThemeData,
              defaultTransition: Transition.cupertino,
              getPages: AppPages.pages
            ));
  }
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}
