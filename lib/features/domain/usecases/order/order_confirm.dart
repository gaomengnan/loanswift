import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/data/models/order_confirm_model.dart';
import 'package:loanswift/features/domain/repos/order.dart';

class OrderConfim extends UsecaseParams<void, OrderConfirmParam> {
  final IOrder order;

  OrderConfim({required this.order});
  @override
  ResultFuture<OrderConfirmModel> call(OrderConfirmParam params) => order.orderConfirm(
      isConfirm: params.isConfim, productId: params.productId);
}

class OrderConfirmParam {
  final String isConfim;
  final int productId;

  OrderConfirmParam({required this.isConfim, required this.productId});
}
