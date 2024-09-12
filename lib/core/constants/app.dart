class AppContant {
  AppContant._();
  static const String baseURI = "http://localhost:8081";
  static const Duration connectTimeout = Duration(
    milliseconds: 100000,
  );

  static const Duration sendTimeout = Duration(
    milliseconds: 100000,
  );

  static const Duration receiveTimeout = Duration(
    milliseconds: 100000,
  );

  static const String tokenKey = "c3078354-002d-4e19-b674-8e1a580d3461";

  static const tokenExpireCode = 10401;

  static const apiSuccessCode = 10000;

  static const String uploadUri = '/middle/upload/index';


  static const fcmTokenReportInitial = "fcm_token_report_initial";
  static const fcmToken = "fcm_token";

  static const deviceInfoKey = "device_info_key";
  static const deviceUUIDKy = "device_uuid_key";
}
