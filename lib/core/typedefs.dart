import 'package:dartz/dartz.dart';
import 'package:loanswift/core/core.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;

extension DataMapExtensions on DataMap {
  static DataMap fromMap(Map<String, dynamic> map) {
    return Map<String, dynamic>.from(map);
  }
}
