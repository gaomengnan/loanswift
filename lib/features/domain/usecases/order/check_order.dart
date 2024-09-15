import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/core/usecase.dart';
import 'package:loanswift/features/domain/repos/order.dart';

class CheckOrder extends UsecaseParams<void, CheckOrderParam> {
  final IOrder order;

  CheckOrder({required this.order});
  @override
  ResultFuture<DataMap> call(CheckOrderParam params) => order
      .order(isConfirm: params.isConfim, productId: params.productId);
}

class CheckOrderParam {
  final String isConfim;
  final int productId;

  CheckOrderParam({required this.isConfim, required this.productId});
}
