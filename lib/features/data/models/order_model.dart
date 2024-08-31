import 'dart:convert';

import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/domain/entity/orders/order.dart';
import 'package:loanswift/features/domain/entity/orders/repayment_info.dart';
import 'package:loanswift/features/domain/entity/orders/user_order_copywriter_info.dart';
import 'package:loanswift/features/domain/entity/products/relation_product.dart';

OrderModel orderModelFromMap(String str) =>
    OrderModel.fromMap(json.decode(str));

class OrderModel extends OrderEntity {
  OrderModel(
      {required super.orderNo,
      required super.relationProduct,
      required super.copywriterInfo,
      required super.showTime,
      required super.orderAmount,
      required super.serviceMoney,
      required super.term,
      required super.repaymentInfo});

  OrderModel.empty()
      : this(
          orderNo: '',
          relationProduct: RelationProduct.empty(),
          copywriterInfo: UserOrderCopywriterInfo.empty(),
          showTime: '',
          orderAmount: '',
          serviceMoney: '',
          term: '',
          repaymentInfo: RepaymentInfo.empty(),
        );
  // fromMap: 将 Map 转换为 OrderModel, 对象
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderNo: map['order_no'],
      relationProduct: RelationProduct.fromMap(map["relation_product"]),
      copywriterInfo: UserOrderCopywriterInfo.fromMap(map["copywriter_info"]),
      showTime: map['show_time'].toString(), // 假设日期格式为 ISO 8601 字符串
      orderAmount: map['order_amount'].toString(), // 确保转换为 double 类型
      serviceMoney: map['service_money'].toString(),
      term: map['term'],
      repaymentInfo: RepaymentInfo.fromMap(map["repayment_info"]),
    );
  }

  // toMap: 将 OrderModel 对象转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'order_no': orderNo,
      'relation_product': relationProduct.toMap(),
      'copywriter_info': copywriterInfo.toMap(),
      'show_time': showTime, // 转换为 ISO 8601 字符串格式
      'order_amount': orderAmount,
      'service_money': serviceMoney,
      'term': term,
      'repayment_info': repaymentInfo.toMap(),
    };
  }

  //静态方法：将 List<Map<String, dynamic>> 转换为 List<OrderModel>

  static List<OrderModel> listFromMap(List<dynamic> list) {
    return list.map((map) => OrderModel.fromMap(map)).toList();
  }
}
