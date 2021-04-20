/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-12 14:37:43
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/routes/app_pages.dart
 */
/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-08 21:23:35
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/routes/app_pages.dart
 */
import 'package:duo_hao/modules/main/app_bar/binding.dart';
import 'package:duo_hao/modules/main/app_bar/view.dart';
import 'package:duo_hao/modules/main/splash/binding.dart';
import 'package:duo_hao/modules/main/splash/view.dart';
import 'package:duo_hao/modules/profile/profile/view.dart';
import 'package:duo_hao/modules/publish/publish/view.dart';
import 'package:duo_hao/modules/user/login/binding.dart';
import 'package:duo_hao/modules/user/login/view.dart';
import 'package:duo_hao/modules/user/sign_up/view.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.MAIN,
        page: () => AppBarPage(),
        binding: MainBinding()
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: Routes.PUBLISH,
      page: () => PublishPage(),
      transition:  Transition.downToUp,
    )
  ];
}
