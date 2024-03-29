import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/core.dart';

class DioClient {
  BaseOptions options = BaseOptions(
    baseUrl: AppContant.baseURI, // 设置基本URL
    connectTimeout: AppContant.connectTimeout, // 连接超时时间，单位毫秒
    receiveTimeout: AppContant.receiveTimeout,
  );

  late Dio _dio;

  final InternetConnectionChecker connectionChecker;

  DioClient({
    required this.connectionChecker,
  }) {
    var dioInstance = Dio(options);
    dioInstance.interceptors.add(
      DioInterceptor(),
    );

    _dio = dioInstance;
  }

  Dio get dio => _dio;

  ResultFuture<Response> post({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    final InternetConnectionStatus connected =
        await connectionChecker.connectionStatus;
    if (connected == InternetConnectionStatus.connected) {
      try {
        final resp = await _dio.post(path, data: data);
        return right(resp);
      } on DioException catch (e) {
        return left(
          ServerFailure(
            message: e.message ?? "",
            statusCode: e.response?.statusCode ?? 0,
          ),
        );
      }
    } else {
      return left(
        const ConnectionFailure(),
      );
    }
  }

  ResultFuture<Response> get({
    required String path,
  }) async {
    final InternetConnectionStatus connected =
        await connectionChecker.connectionStatus;
    if (connected == InternetConnectionStatus.connected) {
      try {
        final resp = await _dio.get(path);
        return right(resp);
      } on DioException catch (e) {
        return left(
          ServerFailure(
            message: e.message ?? "",
            statusCode: e.response?.statusCode ?? 0,
          ),
        );
      }
    } else {
      return left(
        const ConnectionFailure(),
      );
    }
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
