import 'package:dartz/dartz.dart';
import 'package:loanswift/core/core.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
