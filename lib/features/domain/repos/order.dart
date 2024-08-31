import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/models.dart';

abstract class IOrder {
  ResultFuture<List<OrderModel>> queryOrders({required String status});
}
