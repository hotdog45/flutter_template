import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../../common/utils/log_utils.dart';
import '../../../common/utils/toast_utils.dart';
import 'address.dart';
import 'header_interceptor.dart';

///http请求
class HttpManager {
  Dio _dio = Dio(); // 使用默认配置

  HttpManager() {
    _dio.interceptors.add(TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printRequestData: true,
            printResponseMessage: true,
            printResponseData: true)));
    _dio.interceptors.add(HeaderInterceptors());
  }

  ///发起网络请求
  Future<dynamic> netFetch(
      String api,
      Map<String, dynamic> body, {
        bool noTip = false,
        String method = "post",
        bool needBaseModel = false,
        bool showLoading = true,
      }) async {
    try {
      if (showLoading) {
        myToast.showLoading();
      }

      final host = api.startsWith('http') ? api : BASE_URL_RELEASE + api;
      var response;
      if (method == "get") {
        response = await _dio.get(host, queryParameters: body);
      } else if (method == "post") {
        response = await _dio.post(host, data: body);
      }
      myToast.closeLoading();
      if (response != null &&
          response.statusCode != null &&
          response.statusCode! < 205) {
        if (response.data == null) {
          return true;
        }
        return response.data;
      }
      return null;
    } on DioException catch (err) {
      MyToast().closeLoading();
      logger.e(
          '网络错误：code==>${err.response?.statusCode} msg==>${err.response?.data["message"]}');
      if (err.response?.statusCode == 401) {

        return null;
      }
      String message = '服务器异常';
      if (!noTip && err.response?.data["message"] != null) {
        message = '${err.response?.data["message"]}';
        MyToast.show(message);
      }
      return null;
    }
  }
}
