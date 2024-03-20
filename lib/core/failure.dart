import 'package:equatable/equatable.dart';
import 'package:loanswift/core/exceptions.dart';


abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object> get props => [statusCode, message];
}

class ApiFailure extends Failure {
  const ApiFailure({required super.message, required super.statusCode});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message, required super.statusCode});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class ConnectionFailure extends Failure {
  // 直接给message 为 网络错误 和 statusCode 为 -1 初始化
  const ConnectionFailure()
      : super(
          message: "网络连接异常",
          statusCode: 0,
        );
}
