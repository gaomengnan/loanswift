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

  static const homeDataKey = "home_data_key";

  static const apiSecret =
      "48ab1dd3e274f2d67ea84ba7e004a5bc4d5c6329d79a03b9ba64391f0ef47f33";

  static const String appCertifyIntoTimeKey = "app_certify_into_time_key";
}
