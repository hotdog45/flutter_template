import '../../app/modules/goods_details_module/goods_details_page.dart';
import '../../app/modules/goods_details_module/goods_details_bindings.dart';
import '../../app/modules/goods_list_module/goods_list_page.dart';
import '../../app/modules/goods_list_module/goods_list_bindings.dart';
import '../../app/modules/sign_up_module/sign_up_page.dart';
import '../../app/modules/sign_up_module/sign_up_bindings.dart';
import '../../app/modules/splash_module/splash_page.dart';
import '../../app/modules/splash_module/splash_bindings.dart';
import '../../app/modules/profile_module/profile_page.dart';
import '../../app/modules/profile_module/profile_bindings.dart';
import '../../app/modules/home_module/home_page.dart';
import '../../app/modules/home_module/home_bindings.dart';
import '../../app/modules/publish_module/publish_page.dart';
import '../../app/modules/publish_module/publish_bindings.dart';
import '../../app/modules/login_module/login_page.dart';
import '../../app/modules/login_module/login_bindings.dart';
import '../../app/modules/main_module/main_page.dart';
import '../../app/modules/main_module/main_bindings.dart';
import '../../app/modules/not_found_module/not_found_page.dart';
import '../../app/modules/not_found_module/not_found_bindings.dart';
import 'package:get/get.dart';
part './app_routes.dart';


abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.NOT_FOUND,
      page: () => NotFoundPage(),
      binding: NotFoundBinding(),
    ),
    GetPage(
        name: Routes.MAIN,
        page: () => MainPage(),
        binding: MainBinding(),
        transition: Transition.zoom),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: Routes.PUBLISH,
        page: () => PublishPage(),
        binding: PublishBinding(),
        transition: Transition.zoom),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.GOODS_LIST,
      page: () => GoodsListPage(),
      binding: GoodsListBinding(),
    ),
    GetPage(
      name: Routes.GOODS_DETAILS,
      page: () => GoodsDetailsPage(),
      binding: GoodsDetailsBinding(),
    ),
  ];
}
