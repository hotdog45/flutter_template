
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../app/data/net/http_manager.dart';

/// 依赖注入
class DenpendencyInjection {
  static Future<void> init() async {
    // 本地缓存
    await GetStorage.init('xd_service');
    // dio配置信息
    //  网络请求
    Get.put(HttpManager());
    // 登录信息提供者
    // 数据库
  }
}
