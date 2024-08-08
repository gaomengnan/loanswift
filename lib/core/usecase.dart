import 'package:loanswift/core/core.dart';

abstract class UsecaseParams<Type, Params> {
  const UsecaseParams();
  ResultFuture<Type> call(Params params);
}

abstract class Usecase<Type> {
  const Usecase();
  ResultFuture<Type> call();
}
