import 'package:loanswift/features/domain/entity/home/relation_product.dart';
import 'package:loanswift/features/domain/entity/home/repayment_info.dart';
import 'package:loanswift/features/domain/entity/home/user_order_copywriter_info.dart';

class UserOrder {
  final String orderNo;
  final RelationProduct relationProduct;
  final UserOrderCopywriterInfo copywriterInfo;
  final String showTime;
  final String orderAmount;
  final String serviceMoney;
  final String term;
  final RepaymentInfo repaymentInfo;

  UserOrder({
    required this.orderNo,
    required this.relationProduct,
    required this.copywriterInfo,
    required this.showTime,
    required this.orderAmount,
    required this.serviceMoney,
    required this.term,
    required this.repaymentInfo,
  });

  factory UserOrder.fromMap(Map<String, dynamic> json) => UserOrder(
        orderNo: json["order_no"],
        relationProduct: RelationProduct.fromMap(json["relation_product"]),
        copywriterInfo:
            UserOrderCopywriterInfo.fromMap(json["copywriter_info"]),
        showTime: json["show_time"],
        orderAmount: json["order_amount"],
        serviceMoney: json["service_money"],
        term: json["term"],
        repaymentInfo: RepaymentInfo.fromMap(json["repayment_info"]),
      );

  Map<String, dynamic> toMap() => {
        "order_no": orderNo,
        "relation_product": relationProduct.toMap(),
        "copywriter_info": copywriterInfo.toMap(),
        "show_time": showTime,
        "order_amount": orderAmount,
        "service_money": serviceMoney,
        "term": term,
        "repayment_info": repaymentInfo.toMap(),
      };
}
