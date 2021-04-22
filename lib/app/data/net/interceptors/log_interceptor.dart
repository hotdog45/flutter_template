
import 'package:dio/dio.dart';
import 'package:duo_hao/app/utils/log_util.dart';
import 'package:duo_hao/app/utils/log_utils.dart';
import 'package:duo_hao/config/config.dart';

/// Log 拦截器
class LogsInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Config.DEBUG) {
      logger.i("请求数据method = ${options?.method.toString()}");
      logger.i("请求url = ${options?.uri.toString()}");
      logger.i("请求头headers = ${options?.headers.toString() ?? ""}");
      logger.i("请求参数params = ${options?.data.toString() ?? ""}");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Config.DEBUG) {
      if (response != null) {
        logger.i("响应数据开始code = ${response?.statusCode.toString()}");
        LogUtil.d("响应数据开始data = ${response?.data}");
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (Config.DEBUG) {
      logger.e("请求异常:type = ${err.type}");
      logger.e("请求异常信息:message = ${err?.message}");
      logger.e('请求异常信息: ' + err.response?.toString() ?? "");
    }
    super.onError(err, handler);
  }
}
