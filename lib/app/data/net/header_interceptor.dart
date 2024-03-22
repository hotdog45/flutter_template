import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';


class HeaderInterceptors extends InterceptorsWrapper {
  static const CONTENT_TYPE_FORM = "application/json";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> headers = HashMap();

    headers["token"] = "token";
    headers["app-platform"] = Platform.isIOS ? "ios" : "android";
    headers["content-type"] = CONTENT_TYPE_FORM;

    options.headers = headers;
    options.connectTimeout = Duration(seconds: 3); // 服务器链接超时，秒
    options.receiveTimeout = Duration(seconds: 3); // 响应流上前后两次接受到数据的间隔，秒
    super.onRequest(options, handler);
  }
}
