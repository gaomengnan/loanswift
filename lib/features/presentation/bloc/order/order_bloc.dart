import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/data/models/error.dart';
import 'package:loanswift/features/data/models/models.dart';
import 'package:loanswift/features/domain/usecases/order/query_order.dart';

part 'order_state.dart';
part 'order_event.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final QueryOrderUseCase queryOrderUseCase;

  OrderBloc({
    required this.queryOrderUseCase,
  }) : super(OrderInitial()) {
    on<OrderLoadEvent>(_orderLoadHandler);
  }

  void _orderLoadHandler(OrderLoadEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());

    final res = await queryOrderUseCase(
      QueryOrdersParams(status: event.orderStatus),
    );

    res.fold(
        (l) => emit(OrderLoadFailure(error: CustomError(message: l.message))),
        (r) => emit(OrderLoadSuccess()));
  }
}
