import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/order.dart';

class GetOrderDetailUseCase extends UsecaseParams<void, GetOrderDetailParams> {
  final IOrder _order;

  GetOrderDetailUseCase({required IOrder order}) : _order = order;
  @override
  ResultFuture call(params) => _order.getDetail(
        orderNo: params.orderNo,
      );
}

class GetOrderDetailParams {
  final String orderNo;

  GetOrderDetailParams({required this.orderNo});
}
