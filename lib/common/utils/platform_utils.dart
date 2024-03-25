import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

class PlatformUtils {
  static Future<String> getVersionName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> getAppName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  static Future<Directory?> getStorageDirectory() async {
    Directory? rootDir;
    if (Platform.isAndroid) {
      rootDir = await getExternalStorageDirectory();
    } else {
      rootDir = await getApplicationSupportDirectory();
    }
    if (rootDir == null) {
      rootDir = await getApplicationDocumentsDirectory();
    }
    return rootDir;
  }
}
