import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/core.dart';

class DioClient {
  BaseOptions options = BaseOptions(
    baseUrl: Environment.baseUrl, // 设置基本URL
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
    String pt = "json",
  }) async {
    final InternetConnectionStatus connected =
        await connectionChecker.connectionStatus;
    if (connected == InternetConnectionStatus.connected) {
      try {
        Object? poster;
        Map<String, dynamic>? headers = {};
        switch (pt) {
          case "form":
            poster = FormData.fromMap(data!);
            break;
          default:
            poster = data;
            headers['Content-Type'] = "application/json";
            break;
        }
        final resp = await _dio.post(
          path,
          data: poster ?? {},
          options: Options(
            headers: headers,
          ),
        );
        debugPrint("response code : ${resp.data['code']}");

        final int apiCode =
            int.tryParse(resp.data['code']?.toString() ?? '') ?? 10000;

        final errMessage = resp.data['message'].toString();

        if (apiCode != 10000) {
          return left(
            ApiFailure(
              message: errMessage,
              statusCode: apiCode,
            ),
          );
        }

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
  final token = GetStorage().read<DataMap>(AppContant.tokenKey);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('请求路径: ${options.path}');
    print('请求方法: ${options.method}');
    print('请求头: ${options.headers}');
    print('请求参数: ${options.queryParameters}');
    print('请求数据: ${options.data}');

    debugPrint("onRequest");
    options.headers.addAll({
      //"Content-Type": "application/json",
      "Authorization": "Bearer ${token?['token'].toString()}",
    });
    // get token from the storage
    //options.headers.addAll({
    //  "Authorization": "Bearer $token",
    //});
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("onResponse");
    debugPrint(response.toString());
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
