
import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';
import 'package:duo_hao/app/data/model/base_model.dart';
import 'package:duo_hao/app/utils/toast_utils.dart';
import 'package:duo_hao/config/config.dart';

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
  netFetch(String api, body,
      {noTip = false,
      method = "post",
      useBaseModel = true,
      hostType = 1}) async {
    String apiNum = "1"; //
    resultError(DioError e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 999, requestOptions: null);
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (!noTip) MyToast.show(Config.ERROR_MSG);
      return null;
    }

    resultOk(Response response) async {
      BaseModel baseModel = BaseModel.fromJson(response.data);
      if (!useBaseModel) return baseModel;
      if (baseModel != null && baseModel.success) {
        return baseModel.data;
      }
      if (!noTip)  MyToast.show(baseModel.msg);
      return null;
    }

    Response response;
    try {
      response = await _dio.request(getHostAddress(apiNum, hostType) + api,
          data: body, options: Options(method: method));
    } on DioError catch (e) {
      return resultError(e);
    }
    if (response.data is DioError) {
      return resultError(response.data);
    }
    return resultOk(response);
  }
}

// final HttpManager httpManager = HttpManager();
