import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {
  static save(String key, value) async {
    SharedPreferences prefs = Get.find<SharedPreferences>();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = Get.find<SharedPreferences>();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = Get.find<SharedPreferences>();
    prefs.remove(key);
  }
}
