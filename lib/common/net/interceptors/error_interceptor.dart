
import 'package:dio/dio.dart';




///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/// 网络状态拦截
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }
}
