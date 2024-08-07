import 'package:loanswift/core/core.dart';

abstract class UsecaseParams<Type, Params> {
  const UsecaseParams._();
  ResultFuture<Type> call(Params params);
}

abstract class Usecase<Type> {
  const Usecase._();
  ResultFuture<Type> call();
}
