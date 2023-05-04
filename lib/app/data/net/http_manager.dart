import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';
import 'package:flutter_template/app/data/model/base_model.dart';
import 'package:flutter_template/app/utils/toast_utils.dart';
import 'package:flutter_template/config/config.dart';

import '../../utils/log_utils.dart';
import 'address.dart';
import 'code.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';

///http请求
class HttpManager {
  Dio _dio = Dio(); // 使用默认配置

  HttpManager() {
    // _dio.interceptors.add(CookieManager(CookieJar()));
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(LogsInterceptors());
    _dio.interceptors.add(DioLogInterceptor());
    // _dio.interceptors.add(ErrorInterceptors(_dio));
    // _dio.interceptors.add(ResponseInterceptors());
  }

  ///发起网络请求
  Future<dynamic> netFetch(
    String api,
    dynamic body, {
    Map<String, dynamic> queryParametars = const {},
    bool noTip = false,
    String method = "post",
    bool needBaseModel = false,
    bool showLoading = true, // 是否展示加载动画，默认展示
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
  }) async {
    try {
      if (showLoading) {
        myToast.showLoading(text: '');
      }
      final host = api.startsWith('http') ? api : BASE_URL_RELEASE + api;
      final response = await _dio.request(
        host,
        data: body,
        queryParameters: queryParametars,
        options: Options(method: method),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      myToast.closeLoading();
      if (response.statusCode != null && response.statusCode! < 205) {
        BaseModel baseModel = BaseModel.fromJson(response.data);
        if (needBaseModel) return baseModel;
        if (baseModel.success) {
          return baseModel.data;
        }
        if (baseModel.code == "400015") {
          /// token 失效 退出登录
          MyToast.show('token 失效,请重新登录');

          logger.e('app请求账号退出');
          return null;
        }
        if (!noTip) MyToast.show(baseModel.msg);
        return null;
      }
      if (!noTip) MyToast.show(Config.ERROR_MSG);
      return null;
    } on DioError catch (err) {
      MyToast().closeLoading();
      logger.e(
          '网络错误：code==>${err.response?.statusCode} msg==>${err.response?.data["message"]}');
      String message = '网络异常';
      if (!noTip && err.response?.data["message"] != null) {
        message = '${err.response?.data["message"] ?? '网络异常'}';
      }
      if (err.type == DioErrorType.connectTimeout ||
          err.type == DioErrorType.receiveTimeout) {
        message = '网络请求超时';
      }
      if (err.message.contains('Connection refused')) {
        message = '服务器连接异常';
      }
      MyToast.show(message);
      return null;
    }
  }
}
