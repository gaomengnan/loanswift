import 'package:dio/dio.dart';
import 'package:loanswift/core/constants/app.dart';

class DioClient {
  BaseOptions options = BaseOptions(
    baseUrl: AppContant.baseURI, // 设置基本URL
    connectTimeout: AppContant.connectTimeout, // 连接超时时间，单位毫秒
    receiveTimeout: AppContant.receiveTimeout,
  );

  DioClient() {
    var dioInstance = Dio(options);
    dioInstance.interceptors.add(
      DioInterceptor(),
    );
  }
}

class DioInterceptor extends Interceptor {
  final String token = "";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });
    // get token from the storage
    options.headers.addAll({
      "Authorization": "Bearer $token",
    });
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("onResponse");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // await refreshToken();
      try {
        // handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        handler.next(e);
      }
      return;
    }
    handler.next(err);
  }
}
