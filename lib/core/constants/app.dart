class AppContant {
  AppContant._();
  static const String baseURI = "http://localhost:8081";
  static const Duration connectTimeout = Duration(
    milliseconds: 5000,
  );
  static const Duration receiveTimeout = Duration(
    milliseconds: 5000,
  );
}
