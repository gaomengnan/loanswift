import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/data/models/models.dart';
import 'package:loanswift/features/data/models/order_detail_model.dart';
import 'package:loanswift/features/domain/usecases/order/get_order_detail.dart';
import 'package:loanswift/features/domain/usecases/order/query_order.dart';

part 'order_state.dart';
part 'order_event.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final QueryOrderUseCase queryOrderUseCase;

  final GetOrderDetailUseCase getOrderDetailUseCase;

  OrderBloc({
    required this.queryOrderUseCase,
    required this.getOrderDetailUseCase,
  }) : super(OrderInitial()) {
    on<OrderLoadEvent>(_orderLoadHandler);
    on<OrderLoadDetailEvent>(_orderLoadDetailEvent);
  }

  void _orderLoadDetailEvent(
      OrderLoadDetailEvent event, Emitter<OrderState> emit) async {
    emit(OrderDetailLoading());
    final res = await getOrderDetailUseCase(
        GetOrderDetailParams(orderNo: event.orderNo));

    res.fold(
        (l) => emit(
            OrderLoadDetailFailure(error: CustomError(message: l.message))),
        (r) => emit(OrderLoadDetailSuccess(orderDetail: r)));
  }

  void _orderLoadHandler(OrderLoadEvent event, Emitter<OrderState> emit) async {
    if (event.isRefresh) {
      emit(OrderRefresh(orders: state.orders));
    } else {
      emit(OrderLoading(orders: state.orders));
    }

    final res = await queryOrderUseCase(
      QueryOrdersParams(status: event.orderStatus),
    );

    res.fold(
        (l) => emit(OrderLoadFailure(error: CustomError(message: l.message))),
        (r) => emit(OrderLoadSuccess(orders: r)));
  }
}
