import 'package:duo_hao/app/data/repository/login_repository.dart';
import 'package:duo_hao/app/routes/app_pages.dart';
import 'package:duo_hao/app/utils/local_storage.dart';
import 'package:get/get.dart';
import 'package:duo_hao/common/extension/get_extension.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginController extends GetxController{

  final LoginRepository repository;

  LoginController({this.repository});

  var userName = "";
  var pwd = "";

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onInit() async {
    super.onInit();
    userName = await LocalStorage.get("user_phone") ?? "";
    pwd = await LocalStorage.get("user_pwd") ?? "";
  }

  void onUsernameChanged(String username) {
    userName = username.trim();
  }

  void onPasswordChanged(String password) {
    pwd = password.trim();
  }

  login() async {
    Get.snackbar('Hi', 'userName==>'+userName+"pwd==>"+pwd);
    if (userName == null || userName.trim.toString().isEmpty) {
      Get.snackbar('Hi', 'Your Email not be null');
      return;
    }

    if (pwd == null || pwd.trim.toString().isEmpty) {
      Get.snackbar('Hi', 'Your Password not be null');
      return;
    }

    Get.loading();

    try {
      Future.delayed(Duration(seconds:1),(){
        Get.dismiss();
        Get.offAllNamed(Routes.MAIN);
      });
      // LoginBean bean = await repository.login(_username, _password);

    } catch (e) {
      Get.dismiss();
      Get.snackbar('Error', e.message ?? "登录失败");
    }
  }
}
