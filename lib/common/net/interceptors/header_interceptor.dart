import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';


class HeaderInterceptors extends InterceptorsWrapper {
  static const CONTENT_TYPE_FORM = "application/json";

  static String getCookies(List<Cookie> cookies) {
    return cookies.map((cookie) => "${cookie.name}=${cookie.value}").join('; ');
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> headers = HashMap();

    headers["token"] = "token";
    headers["app-platform"] = Platform.isIOS ? "ios" : "android";
    headers["api-version"] = "1.0";
    headers["APP-ID"] = "8b7ab03aa38c4e7599611aa80df54a12";
    headers["content-type"] = CONTENT_TYPE_FORM;

    options.headers = headers;
    options.connectTimeout = 30000; // 服务器链接超时，毫秒
    options.receiveTimeout = 10000; // 响应流上前后两次接受到数据的间隔，毫秒
    super.onRequest(options, handler);
  }
}
