import 'package:loanswift/features/domain/entity/orders/order_detail.dart';

class OrderDetailModel extends OrderDetail {
  OrderDetailModel({
    required super.orderStatus,
    required super.noticeStatusText,
    required super.noticeDesText,
    required super.vCode,
    required super.productName,
    required super.productLogo,
    required super.isDelay,
    required super.userOrderDetail,
  });

  OrderDetailModel.empty()
      : super(
          orderStatus: 0,
          noticeStatusText: '',
          noticeDesText: '',
          vCode: '',
          productName: '',
          productLogo: '',
          isDelay: 0,
          userOrderDetail: UserOrderDetail.empty(),
        );

  // 从 Map 创建 OrderInfo 实体
  factory OrderDetailModel.fromMap(Map<String, dynamic> map) {
    return OrderDetailModel(
      orderStatus: map['order_status'],
      noticeStatusText: map['notice_status_text'],
      noticeDesText: map['notice_des_text'],
      vCode: map['v_code'],
      productName: map['product_name'],
      productLogo: map['product_logo'],
      isDelay: map['is_delay'],
      userOrderDetail: UserOrderDetail.fromMap(map['user_order_detail']),
    );
  }

  // 将 OrderInfo 实体转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'order_status': orderStatus,
      'notice_status_text': noticeStatusText,
      'notice_des_text': noticeDesText,
      'v_code': vCode,
      'product_name': productName,
      'product_logo': productLogo,
      'is_delay': isDelay,
      'user_order_detail': userOrderDetail.toMap(),
    };
  }
}
