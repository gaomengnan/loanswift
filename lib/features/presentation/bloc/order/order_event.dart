part of 'order_bloc.dart';

@immutable
sealed class OrderEvent extends Equatable {}

class OrderLoadEvent extends OrderEvent {
  final OrderStatus orderStatus;

  OrderLoadEvent({required this.orderStatus});

  @override
  List<Object?> get props => [orderStatus];
}
