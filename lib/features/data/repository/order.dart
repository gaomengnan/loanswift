import 'package:dartz/dartz.dart';
import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/data/datasource/order.dart';
import 'package:loanswift/features/data/models/order_confirm_model.dart';
import 'package:loanswift/features/data/models/order_detail_model.dart';
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

  @override
  ResultFuture<OrderDetailModel> getDetail({required String orderNo}) async {
    final res = await _orderDataSource.getOrderDetail(orderNo: orderNo);

    return res.fold(
      (l) => Left(l),
      (r) => Right(r.data!),
    );
  }

  @override
  ResultFuture<OrderConfirmModel> orderConfirm(
      {required String isConfirm, required int productId}) async {
    final resp = await _orderDataSource.orderConfirm(
        isConfirm: isConfirm, productId: productId);

    return resp.fold((l) => left(l), (r) => Right(r.data!));
  }

  @override
  ResultFuture<DataMap> order(
      {required String isConfirm, required int productId}) async {
    final resp = await _orderDataSource.order(
        isConfirm: isConfirm, productId: productId);

    return resp.fold((l) => left(l), (r) => Right(r.data!));
  }
}
