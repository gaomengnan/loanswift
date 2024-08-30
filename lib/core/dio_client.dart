import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/constants/app.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/storage.dart';
import 'package:loanswift/core/subscription.dart';

class DioClient {
  BaseOptions options = BaseOptions(
    baseUrl: Environment.baseUrl, // 设置基本URL
    connectTimeout: AppContant.connectTimeout, // 连接超时时间，单位毫秒
    receiveTimeout: AppContant.receiveTimeout,
  );

  late Dio _dio;

  final InternetConnectionChecker connectionChecker;

  final DioInterceptor interceptor;

  DioClient({
    required this.connectionChecker,
    required this.interceptor,
  }) {
    var dioInstance = Dio(options);
    dioInstance.interceptors.add(
      interceptor,
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
        ConnectionFailure(),
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
            message: S.current.service_error,
            statusCode: e.response?.statusCode ?? 0,
          ),
        );
      }
    } else {
      return left(
        ConnectionFailure(),
      );
    }
  }
}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = Storage.token;

    options.headers.addAll({
      //"Content-Type": "application/json",
      "Authorization": "${token?['token'].toString()}",
    });

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("onResponse");
    debugPrint(response.toString());

    final int apiCode =
        int.tryParse(response.data['code']?.toString() ?? '') ?? 10000;

    //final errMessage = response.data['message'].toString();

    if (apiCode == AppContant.tokenExpireCode) {
      tokenExpireStreamController.add(null);
    }
    //if(apiCode != AppContant.apiSuccessCode) {
    //
    //
    //}

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
