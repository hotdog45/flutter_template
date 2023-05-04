import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/log_utils.dart';

/// Log 拦截器
class LogsInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i("请求数据method = ${options.method.toString()} " +
        "请求url = ${options.uri.toString()}");
    logger.i("请求头headers = ${options.headers.toString()}");
    if (options.data is FormData) {
      FormData formData = options.data;
      logger.i("请求参数 FormData = ${formData.boundary}");
    } else {
      logger.i("请求参数params = ${options.data.toString()}");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      logger.i("响应数据开始code = ${response.statusCode.toString()}");
    } else {
      logger.i("响应数据开始code = ${response.statusCode.toString()}");
      logger.i("响应数据开始data = ${response.data}");
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e("请求异常:type = ${err.type}");
    logger.e("请求异常信息:message = ${err.message}");
    logger.e('请求异常信息: ' + err.response.toString());
    super.onError(err, handler);
  }
}
