class OrderDetail {
  final int orderStatus;
  final String noticeStatusText;
  final String noticeDesText;
  final String vCode;
  final String productName;
  final String productLogo;
  final int isDelay;
  final UserOrderDetail userOrderDetail;

  // 构造函数
  OrderDetail({
    required this.orderStatus,
    required this.noticeStatusText,
    required this.noticeDesText,
    required this.vCode,
    required this.productName,
    required this.productLogo,
    required this.isDelay,
    required this.userOrderDetail,
  });


  @override
  String toString() {
    return 'OrderInfo(orderStatus: $orderStatus, noticeStatusText: $noticeStatusText, noticeDesText: $noticeDesText, vCode: $vCode, productName: $productName, productLogo: $productLogo, isDelay: $isDelay, userOrderDetail: $userOrderDetail)';
  }
}

class UserOrderDetail {
  final List<DetailItem> detail;

  // 构造函数
  UserOrderDetail({required this.detail});

  UserOrderDetail.empty() : this(detail: []);

  // 从 Map 创建 UserOrderDetail 实体
  factory UserOrderDetail.fromMap(Map<String, dynamic> map) {
    return UserOrderDetail(
      detail: List<DetailItem>.from(
          map['detail']?.map((item) => DetailItem.fromMap(item)) ?? []),
    );
  }

  // 将 UserOrderDetail 实体转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'detail': detail.map((item) => item.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'UserOrderDetail(detail: $detail)';
  }
}

class DetailItem {
  final String text;
  final String value;

  // 构造函数
  DetailItem({
    required this.text,
    required this.value,
  });

  // 从 Map 创建 DetailItem 实体
  factory DetailItem.fromMap(Map<String, dynamic> map) {
    return DetailItem(
      text: map['text'],
      value: map['value'],
    );
  }

  // 将 DetailItem 实体转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'value': value,
    };
  }

  @override
  String toString() {
    return 'DetailItem(text: $text, value: $value)';
  }
}
