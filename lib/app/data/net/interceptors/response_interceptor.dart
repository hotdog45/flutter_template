import 'package:dio/dio.dart';
import 'package:flutter_template/app/utils/log_utils.dart';

///
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions option = response.requestOptions;
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } catch (e) {
      logger.e(option.path,e);
    }
    super.onResponse(response, handler);
  }
}
