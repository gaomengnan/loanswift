import 'package:loanswift/features/domain/entity/entity.dart';
import 'package:loanswift/features/domain/entity/orders/user_order_copywriter_info.dart';

class OrderEntity {
  final String _orderNo;
  final RelationProduct _relationProduct;
  final UserOrderCopywriterInfo _copywriterInfo;
  final String _showTime;
  final String _orderAmount;
  final String _serviceMoney;
  final String _term;
  final RepaymentInfo _repaymentInfo;

  OrderEntity({
    required String orderNo,
    required RelationProduct relationProduct,
    required UserOrderCopywriterInfo copywriterInfo,
    required String showTime,
    required String orderAmount,
    required String serviceMoney,
    required String term,
    required RepaymentInfo repaymentInfo,
  })  : _orderNo = orderNo,
        _relationProduct = relationProduct,
        _copywriterInfo = copywriterInfo,
        _showTime = showTime,
        _orderAmount = orderAmount,
        _serviceMoney = serviceMoney,
        _term = term,
        _repaymentInfo = repaymentInfo;

  // Getters
  String get orderNo => _orderNo;
  RelationProduct get relationProduct => _relationProduct;
  UserOrderCopywriterInfo get copywriterInfo => _copywriterInfo;
  String get showTime => _showTime;
  String get orderAmount => _orderAmount;
  String get serviceMoney => _serviceMoney;
  String get term => _term;
  RepaymentInfo get repaymentInfo => _repaymentInfo;

  @override
  String toString() {
    return 'OrderEntity(orderNo: $_orderNo, relationProduct: $_relationProduct, copywriterInfo: $_copywriterInfo, showTime: $_showTime, orderAmount: $_orderAmount, serviceMoney: $_serviceMoney, term: $_term, repaymentInfo: $_repaymentInfo)';
  }
}
