part of 'order_bloc.dart';

@immutable
sealed class OrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}
class OrderLoadSuccess extends OrderState {

}

class OrderLoadFailure extends OrderState {
  final CustomError error;

  OrderLoadFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
