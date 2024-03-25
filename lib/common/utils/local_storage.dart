import 'package:get_storage/get_storage.dart';

final _box = GetStorage("xd_service");

class LocalStorage {

  static Future<void> save(String key, dynamic value) {
    return _box.write(key, value);
  }

  static dynamic get(String key) {
    return _box.read(key);
  }

  static bool hasData(String key) {
    return _box.hasData(key);
  }

  static Future<void> remove(String key) {
    return _box.remove(key);
  }
}
