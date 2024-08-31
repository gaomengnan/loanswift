import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/order.dart';

import '../../../data/models/models.dart';

class QueryOrderUseCase extends UsecaseParams<void, QueryOrdersParams> {
  final IOrder _order;

  QueryOrderUseCase({required IOrder order}) : _order = order;

  @override
  ResultFuture<List<OrderModel>> call(QueryOrdersParams params) =>
      _order.queryOrders(status: params.status.text);
}

class QueryOrdersParams {
  final OrderStatus status;

  QueryOrdersParams({required this.status});
}
