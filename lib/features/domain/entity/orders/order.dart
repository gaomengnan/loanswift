import 'package:loanswift/features/domain/entity/entity.dart';
import 'package:loanswift/features/domain/entity/orders/user_order_copywriter_info.dart';

class OrderEntity {
  final String orderNo;
  final RelationProduct relationProduct;
  final UserOrderCopywriterInfo copywriterInfo;
  final String showTime;
  final String orderAmount;
  final String serviceMoney;
  final String term;
  final RepaymentInfo repaymentInfo;

  OrderEntity(
      {required this.orderNo,
      required this.relationProduct,
      required this.copywriterInfo,
      required this.showTime,
      required this.orderAmount,
      required this.serviceMoney,
      required this.term,
      required this.repaymentInfo});
}
