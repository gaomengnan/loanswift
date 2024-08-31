import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/models.dart';
import 'package:loanswift/features/data/models/order_detail_model.dart';

abstract class IOrder {
  ResultFuture<List<OrderModel>> queryOrders({required String status});
  ResultFuture<OrderDetailModel> getDetail({required String orderNo});
}
