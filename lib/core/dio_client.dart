import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/event_bus_service.dart';
import 'package:loanswift/core/storage.dart';

class DioClient {
  BaseOptions options = BaseOptions(
    baseUrl: Environment.baseUrl, // 设置基本URL
    sendTimeout: AppContant.sendTimeout,
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
    Object? data,
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
            poster = FormData.fromMap(data! as DataMap);
            break;
          default:
            poster = data;
            headers['Content-Type'] = "application/json";
            break;
        }
        final resp = await _dio.post(
          path,
          data: poster,
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
        logger.e("exception: $e");
        //debugprint("DIO CLIENT ERROR: $e");
        return left(
          ServerFailure(
            message: e.message ?? "",
            statusCode: e.response?.statusCode ?? 0,
          ),
        );
      } catch (e) {
        logger.e("exception: $e");
        return left(
          ServerFailure(
            message: S.current.service_error,
            statusCode: -1,
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
    Map<String, dynamic>? queryParameters,
  }) async {
    final InternetConnectionStatus connected =
        await connectionChecker.connectionStatus;
    if (connected == InternetConnectionStatus.connected) {
      try {
        final resp = await _dio.get(
          path,
          queryParameters: queryParameters,
        );

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
        logger.e("exception: $e");
        //print("DIO CLIENT ERROR: $e");
        return left(
          ServerFailure(
            message: e.message ?? '',
            statusCode: e.response?.statusCode ?? 0,
          ),
        );
      } catch (e) {
        logger.e("exception: $e");
        return left(
          ServerFailure(
            message: S.current.service_error,
            statusCode: -1,
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

    final String deviceId = Storage.deviceID;

    final nowTime = (DateTime.now().millisecondsSinceEpoch / 1000).round();

    final hashString =
        "${options.method}${options.path}$nowTime${AppContant.apiSecret}";

    List<int> bytes = utf8.encode(hashString);
    Digest digest = sha256.convert(bytes);

    options.headers.addAll({
      //"Content-Type": "application/json",
      "Authorization": "${token?['token'].toString()}",
      "deviceId": deviceId,
      "timestamp": nowTime,
      "iv": digest.toString(),
    });

    logger.i('请求信息: \n'
        '请求路径: ${options.path}\n'
        '请求方法: ${options.method}\n'
        '请求头: ${options.headers}\n'
        '请求参数: ${options.queryParameters}\n'
        '请求数据: ${options.data.toString()}');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(response.toString());

    final int apiCode =
        int.tryParse(response.data['code']?.toString() ?? '') ?? 10000;

    //final errMessage = response.data['message'].toString();

    if (apiCode == AppContant.tokenExpireCode) {
      bus.fire(LoginExpireEvent());
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
