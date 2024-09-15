import 'package:dartz/dartz.dart';
import 'package:loanswift/core/api_response.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/features/data/models/models.dart';
import 'package:loanswift/features/data/models/order_confirm_model.dart';
import 'package:loanswift/features/data/models/order_detail_model.dart';

abstract class IOrderDataSource {
  ResultFuture<ApiResponse<List<OrderModel>>> getOrders(
      {required String status});

  ResultFuture<ApiResponse<OrderDetailModel>> getOrderDetail(
      {required String orderNo});

  ResultFuture<ApiResponse<OrderConfirmModel>> orderConfirm(
      {required String isConfirm, required int productId});

  ResultFuture<ApiResponse<DataMap>> order(
      {required String isConfirm, required int productId});
}

class OrderDataSource implements IOrderDataSource {
  final DioClient http;

  OrderDataSource({required this.http});

  @override
  ResultFuture<ApiResponse<List<OrderModel>>> getOrders(
      {required String status}) async {
    final res = await http.get(path: '/middle/order/list', queryParameters: {
      'status': status,
    });

    return res.fold((l) => left(l), (r) {
      return Right(ApiResponse.fromJson(
        r.data,
        (json) => OrderModel.listFromMap(json),
      ));
    });
  }

  @override
  ResultFuture<ApiResponse<OrderDetailModel>> getOrderDetail(
      {required String orderNo}) async {
    final resp = await http.get(path: '/middle/order/detail', queryParameters: {
      'order_no': orderNo,
    });

    return resp.fold((l) => left(l), (r) {
      return Right(ApiResponse.fromJson(
        r.data,
        (json) => OrderDetailModel.fromMap(json),
      ));
    });
  }

  @override
  ResultFuture<ApiResponse<OrderConfirmModel>> orderConfirm(
      {required String isConfirm, required int productId}) async {
    final res = await http.post(
      path: '/middle/apply/apply-order',
      data: {
        'is_confirm': isConfirm,
        'product_id': productId,
      },
    );

    return res.fold((l) => left(l), (r) {
      return Right(ApiResponse.fromJson(
        r.data,
        (json) => OrderConfirmModel.fromMap(json),
      ));
    });
  }

  @override
  ResultFuture<ApiResponse<DataMap>> order(
      {required String isConfirm, required int productId}) async {
    final res = await http.post(
      path: '/middle/apply/apply-order',
      data: {
        'is_confirm': isConfirm,
        'product_id': productId,
      },
    );

    return res.fold((l) => left(l), (r) {
      return Right(ApiResponse.fromJson(
        r.data,
        (json) => DataMapExtensions.fromMap(json),
      ));
    });
  }
}
