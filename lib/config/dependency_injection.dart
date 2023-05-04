/*
 * @Author: your name
 * @Date: 2020-12-08 20:57:12
 * @LastEditTime: 2020-12-11 01:38:08
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /todo/lib/utils/dependency_injection.dart
 */
import 'package:flutter_template/app/data/net/http_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
