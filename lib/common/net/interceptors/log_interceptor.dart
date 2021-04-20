import 'dart:math';

import 'package:dio/dio.dart';
import 'package:duo_hao/common/uitls/log_utils.dart';
import 'package:duo_hao/config/config.dart';

/// Log 拦截器
class LogsInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Config.DEBUG) {
      logger.i("请求数据method = ${options.method.toString()}");
      logger.i("请求url = ${options.uri.toString()}");
      logger.i("请求头headers = ${options.headers}");
      logger.i("请求参数params = ${options.data}");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Config.DEBUG) {
      if (response != null) {
        logger.i("响应数据开始code = ${response.statusCode}");
        logger.i("响应数据开始data = ${response.data}");
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (Config.DEBUG) {
      logger.e("请求异常:type = ${err.type}");
      logger.e("请求异常信息:message = ${err.message}");
      logger.e('请求异常信息: ' + err.response?.toString() ?? "");
    }
    super.onError(err, handler);
  }
}
