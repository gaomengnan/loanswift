part of 'order_bloc.dart';

@immutable
sealed class OrderState extends Equatable {
  final List<OrderModel> orders;

  const OrderState({required this.orders});

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {
  OrderInitial() : super(orders: []);
}

class OrderLoading extends OrderState {
  const OrderLoading({required super.orders});
}

class OrderDetailLoading extends OrderState {
  OrderDetailLoading() : super(orders: []);
}

class OrderRefresh extends OrderState {
  const OrderRefresh({required super.orders});
}

class OrderLoadSuccess extends OrderState {
  const OrderLoadSuccess({required super.orders});

  @override
  List<Object?> get props => [orders];
}

class OrderLoadDetailSuccess extends OrderState {
  final OrderDetailModel orderDetail;

  OrderLoadDetailSuccess({required this.orderDetail}) : super(orders: []);

  @override
  List<Object?> get props => [orders];
}

class OrderLoadFailure extends OrderState {
  final CustomError error;

  OrderLoadFailure({required this.error}) : super(orders: []);
  @override
  List<Object?> get props => [error];
}

class OrderLoadDetailFailure extends OrderState {
  final CustomError error;

  OrderLoadDetailFailure({required this.error}) : super(orders: []);
  @override
  List<Object?> get props => [error];
}
