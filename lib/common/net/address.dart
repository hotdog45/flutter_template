
import 'package:duo_hao/config/config.dart';

////////////////////// -start - api -start///////////////////////////
///host1 验证码
const String securityCode = "app/security_code";

//账号 密码登陆
const String accountLogin = "account/login";
//账号 注册
const String accountNew = "account/new";

////////////////////// -end - api -end///////////////////////////

/// host1
const String BASE_URL_RELEASE = "http://dweb.xxxxxxxx.co/v1/"; //线上
const String BASE_URL_DEV = "http://dweb.xxxxxx.co/v1/"; //开发

/// host2
const String BASE_URL2_RELEASE = "http://dtrace.xxxxxx.co/"; //线上
const String BASE_URL2_DEV = "http://dtrace.xxxxxx.co/"; //开发

/// 网页h5
const String BASE_URL_H5_RELEASE = "https://h5.xxxxxxx.com"; //线上
const String BASE_URL_H5_DEV = "https://dev-h5.xxxxxxxxx.com"; //开发

/// 图片服务器
const String BASE_URL_IMAGE_RELEASE = "http://image.xxxxxxxx.com/"; //线上
const String BASE_URL_IMAGE_DEV = "http://image.xxxxxxxxx.com/"; //开发

/// Url
getHostAddress(apiNum, type) {
  if (type == 1) {
    switch (apiNum) {
      case Config.KEY_API_HOST_RELEASE:
        return BASE_URL_RELEASE;
      default:
        return BASE_URL_DEV;
    }
  } else {
    switch (apiNum) {
      case Config.KEY_API_HOST_RELEASE:
        return BASE_URL2_RELEASE;
      default:
        return BASE_URL2_DEV;
    }
  }
}

/// 获取不同环境的网页
getBaseH5Url(apiNum) {
  switch (apiNum) {
    case Config.KEY_API_HOST_RELEASE:
      return BASE_URL_H5_RELEASE;
    default:
      return BASE_URL_H5_DEV;
  }
}

///获取不同环境的图片服务器
getBaseIMAGEUrl(apiNum) {
  switch (apiNum) {
    case Config.KEY_API_HOST_RELEASE:
      return BASE_URL_IMAGE_RELEASE;
    default:
      return BASE_URL_IMAGE_DEV;
  }
}
