class ApiResponse<T> {
  final int code;
  final T? data;
  final String message;

  ApiResponse({
    this.code = 0,
    this.data,
    this.message = '',
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    return ApiResponse<T>(
      code: json['code'] as int,
      data: _getData(json, fromJsonT),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data,
      'message': message,
    };
  }

  static T _getData<T>(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    if (json['data'] != null) {
      return fromJsonT(json['data']);
    }
    return {} as T;
  }

  @override
  String toString() {
    return "Code : $code \n Message : $message \n Data : $data";
  }
}
