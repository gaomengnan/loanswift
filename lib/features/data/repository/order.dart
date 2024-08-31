import 'package:dartz/dartz.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/order.dart';
import 'package:loanswift/features/data/models/order_model.dart';
import 'package:loanswift/features/domain/repos/order.dart';

class OrderRepository implements IOrder {
  final IOrderDataSource _orderDataSource;

  OrderRepository({required IOrderDataSource orderDataSource})
      : _orderDataSource = orderDataSource;

  @override
  ResultFuture<List<OrderModel>> queryOrders({required String status}) async {
    final res = await _orderDataSource.getOrders(status: status);
    return res.fold(
      (l) => Left(l),
      (r) => Right(r.data!),
    );
  }
}
