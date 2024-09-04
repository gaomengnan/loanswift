class AppContant {
  AppContant._();
  static const String baseURI = "http://localhost:8081";
  static const Duration connectTimeout = Duration(
    milliseconds: 10000,
  );

  static const Duration sendTimeout = Duration(
    milliseconds: 10000,
  );

  static const Duration receiveTimeout = Duration(
    milliseconds: 10000,
  );

  static const String tokenKey = "c3078354-002d-4e19-b674-8e1a580d3461";

  static const tokenExpireCode = 10401;

  static const apiSuccessCode = 10000;

  static const String uploadUri = '/middle/upload/index';
}
