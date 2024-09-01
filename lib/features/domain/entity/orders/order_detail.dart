class OrderDetail {
  final int orderStatus;
  final String noticeStatusText;
  final String noticeDesText;
  final String vCode;
  final String productName;
  final String productLogo;
  final int isDelay;
  final UserOrderDetail userOrderDetail;
  final RepayPlanEntity repayPlan;

  final List<BestDesc> bestDesc;

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
    required this.repayPlan,
    required this.bestDesc,
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

class RepayPlanEntity {
  final String showDesc;
  final String title;
  final List<RepayPlan> repayPlan;

  RepayPlanEntity({
    required this.showDesc,
    required this.title,
    required this.repayPlan,
  });

  RepayPlanEntity.empty()
      : this(
          showDesc: '',
          title: '',
          repayPlan: [],
        );

  // fromMap 方法，用于从 Map 创建 RepayPlanEntity 实例
  factory RepayPlanEntity.fromMap(Map<String, dynamic> map) {
    return RepayPlanEntity(
      showDesc: map['showDesc'] ?? '',
      title: map['title'] ?? '',
      repayPlan: List<RepayPlan>.from(
        map['repayPlan']?.map((x) => RepayPlan.fromMap(x)) ?? [],
      ),
    );
  }

  // toMap 方法，用于将 RepayPlanEntity 实例转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'showDesc': showDesc,
      'title': title,
      'repayPlan': repayPlan.map((x) => x.toMap()).toList(),
    };
  }
}

class RepayPlan {
  final String date;
  final int periodNo;
  final String repaymentAmount;
  final String repaymentAmountDesc;
  final int status;
  final String statusDesc;
  final int canClick;

  RepayPlan({
    required this.date,
    required this.periodNo,
    required this.repaymentAmount,
    required this.repaymentAmountDesc,
    required this.status,
    required this.statusDesc,
    required this.canClick,
  });

  // fromMap 方法，用于从 Map 创建 RepayPlan 实例
  factory RepayPlan.fromMap(Map<String, dynamic> map) {
    return RepayPlan(
      date: map['date'] ?? '',
      periodNo: map['periodNo'] ?? 0,
      repaymentAmount: map['repaymentAmount'] ?? '',
      repaymentAmountDesc: map['repaymentAmountDesc'] ?? '',
      status: map['status'] ?? 0,
      statusDesc: map['statusDesc'] ?? '',
      canClick: map['canClick'] ?? 0,
    );
  }

  // toMap 方法，用于将 RepayPlan 实例转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'periodNo': periodNo,
      'repaymentAmount': repaymentAmount,
      'repaymentAmountDesc': repaymentAmountDesc,
      'status': status,
      'statusDesc': statusDesc,
      'canClick': canClick,
    };
  }
}

class BestDesc {
  final String title;
  final String status;
  final int isLock;
  final String amountDesc;
  final String amount;

  BestDesc.empty()
      : this(
          title: '',
          status: '',
          isLock: 0,
          amountDesc: '',
          amount: '',
        );

  BestDesc(
      {required this.title,
      required this.status,
      required this.isLock,
      required this.amountDesc,
      required this.amount});
  // fromMap 方法，用于从 Map 创建 RepayPlan 实例

  factory BestDesc.fromMap(Map<String, dynamic> map) {
    return BestDesc(
      title: map['title'] ?? '',
      status: map['status'] ?? 0,
      isLock: map['is_lock'] ?? '',
      amountDesc: map['amount_dec'] ?? '',
      amount: map['amount'] ?? '',
    );
  }

  // toMap 方法，用于将 RepayPlan 实例转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'status': status,
      'is_lock': isLock,
      'amount_dec': amountDesc,
      'amount': amount,
    };
  }
}
