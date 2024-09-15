import 'package:loanswift/features/domain/entity/products/relation_product.dart';
import 'package:loanswift/features/domain/entity/orders/repayment_info.dart';
import 'package:loanswift/features/domain/entity/orders/user_order_copywriter_info.dart';

class UserOrder {
  final String _orderNo;
  final RelationProduct _relationProduct;
  final UserOrderCopywriterInfo _copywriterInfo;
  final String _showTime;
  final String _orderAmount;
  final String _serviceMoney;
  final String _term;
  final RepaymentInfo _repaymentInfo;

  UserOrder({
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

  factory UserOrder.fromMap(Map<String, dynamic> json) => UserOrder(
        orderNo: json["order_no"],
        relationProduct: RelationProduct.fromMap(json["relation_product"]),
        copywriterInfo: UserOrderCopywriterInfo.fromMap(json["copywriter_info"]),
        showTime: json["show_time"],
        orderAmount: json["order_amount"],
        serviceMoney: json["service_money"],
        term: json["term"],
        repaymentInfo: RepaymentInfo.fromMap(json["repayment_info"]),
      );

  Map<String, dynamic> toMap() => {
        "order_no": _orderNo,
        "relation_product": _relationProduct.toMap(),
        "copywriter_info": _copywriterInfo.toMap(),
        "show_time": _showTime,
        "order_amount": _orderAmount,
        "service_money": _serviceMoney,
        "term": _term,
        "repayment_info": _repaymentInfo.toMap(),
      };
}
