part of 'order_bloc.dart';

@immutable
sealed class OrderEvent extends Equatable {}

class OrderLoadEvent extends OrderEvent {
  final OrderStatus orderStatus;

  final bool isRefresh;

  OrderLoadEvent({required this.orderStatus, this.isRefresh = false});

  @override
  List<Object?> get props => [orderStatus];
}

class OrderLoadDetailEvent extends OrderEvent {
  final String orderNo;

  OrderLoadDetailEvent({required this.orderNo});

  @override
  List<Object?> get props => [orderNo];
}
