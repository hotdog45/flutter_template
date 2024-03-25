import '../../../common/config/config.dart';
/// host1
const String BASE_URL_RELEASE =
    "https://www.fastmock.site/mock/e9989c53677bb7ea0b00f2c37e5f95ae/duohao"; //线上
const String BASE_URL_DEV =
    "https://www.fastmock.site/mock/e9989c53677bb7ea0b00f2c37e5f95ae/duohao"; //开发

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
