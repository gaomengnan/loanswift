class OrderDetail {
  final int _orderStatus;
  final String _noticeStatusText;
  final String _noticeDesText;
  final String _vCode;
  final String _productName;
  final String _productLogo;
  final int _isDelay;
  final UserOrderDetail _userOrderDetail;
  final RepayPlanEntity _repayPlan;
  final List<BestDesc> _bestDesc;
  final JumpPath _jumpPath;

  OrderDetail({
    required int orderStatus,
    required String noticeStatusText,
    required String noticeDesText,
    required String vCode,
    required String productName,
    required String productLogo,
    required int isDelay,
    required UserOrderDetail userOrderDetail,
    required RepayPlanEntity repayPlan,
    required List<BestDesc> bestDesc,
    required JumpPath jumpPath,
  })  : _orderStatus = orderStatus,
        _noticeStatusText = noticeStatusText,
        _noticeDesText = noticeDesText,
        _vCode = vCode,
        _productName = productName,
        _productLogo = productLogo,
        _isDelay = isDelay,
        _userOrderDetail = userOrderDetail,
        _repayPlan = repayPlan,
        _bestDesc = bestDesc,
        _jumpPath = jumpPath;

  // Getters
  int get orderStatus => _orderStatus;
  String get noticeStatusText => _noticeStatusText;
  String get noticeDesText => _noticeDesText;
  String get vCode => _vCode;
  String get productName => _productName;
  String get productLogo => _productLogo;
  int get isDelay => _isDelay;
  UserOrderDetail get userOrderDetail => _userOrderDetail;
  RepayPlanEntity get repayPlan => _repayPlan;
  List<BestDesc> get bestDesc => _bestDesc;
  JumpPath get jumpPath => _jumpPath;

  @override
  String toString() {
    return 'OrderDetail(orderStatus: $_orderStatus, noticeStatusText: $_noticeStatusText, noticeDesText: $_noticeDesText, vCode: $_vCode, productName: $_productName, productLogo: $_productLogo, isDelay: $_isDelay, userOrderDetail: $_userOrderDetail, repayPlan: $_repayPlan, bestDesc: $_bestDesc, jumpPath: $_jumpPath)';
  }
}

class JumpPath {
  final String _jumpByDelay;
  final String _jumpByNormal;
  final String _jumpByLoanContact;

  JumpPath({
    required String jumpByDelay,
    required String jumpByNormal,
    required String jumpByLoanContact,
  })  : _jumpByDelay = jumpByDelay,
        _jumpByNormal = jumpByNormal,
        _jumpByLoanContact = jumpByLoanContact;

  JumpPath.empty()
      : this(
          jumpByDelay: '',
          jumpByNormal: '',
          jumpByLoanContact: '',
        );

  // Getters
  String get jumpByDelay => _jumpByDelay;
  String get jumpByNormal => _jumpByNormal;
  String get jumpByLoanContact => _jumpByLoanContact;

  factory JumpPath.fromMap(Map<String, dynamic> map) {
    return JumpPath(
      jumpByDelay: map['jump_by_delay'].toString(),
      jumpByNormal: map['jump_by_normal'].toString(),
      jumpByLoanContact: map['jump_by_loan_contact'].toString(),
    );
  }
}

class UserOrderDetail {
  final List<DetailItem> _detail;

  UserOrderDetail({
    required List<DetailItem> detail,
  }) : _detail = detail;

  UserOrderDetail.empty() : this(detail: []);

  // Getters
  List<DetailItem> get detail => _detail;

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
      'detail': _detail.map((item) => item.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'UserOrderDetail(detail: $_detail)';
  }
}

class DetailItem {
  final String _text;
  final String _value;

  DetailItem({
    required String text,
    required String value,
  })  : _text = text,
        _value = value;

  // Getters
  String get text => _text;
  String get value => _value;

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
      'text': _text,
      'value': _value,
    };
  }

  @override
  String toString() {
    return 'DetailItem(text: $_text, value: $_value)';
  }
}

class RepayPlanEntity {
  final String _showDesc;
  final String _title;
  final List<RepayPlan> _repayPlan;

  RepayPlanEntity({
    required String showDesc,
    required String title,
    required List<RepayPlan> repayPlan,
  })  : _showDesc = showDesc,
        _title = title,
        _repayPlan = repayPlan;

  RepayPlanEntity.empty()
      : this(
          showDesc: '',
          title: '',
          repayPlan: [],
        );

  // Getters
  String get showDesc => _showDesc;
  String get title => _title;
  List<RepayPlan> get repayPlan => _repayPlan;

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
      'showDesc': _showDesc,
      'title': _title,
      'repayPlan': _repayPlan.map((x) => x.toMap()).toList(),
    };
  }
}

class RepayPlan {
  final String _date;
  final int _periodNo;
  final String _repaymentAmount;
  final String _repaymentAmountDesc;
  final int _status;
  final String _statusDesc;
  final int _canClick;

  RepayPlan({
    required String date,
    required int periodNo,
    required String repaymentAmount,
    required String repaymentAmountDesc,
    required int status,
    required String statusDesc,
    required int canClick,
  })  : _date = date,
        _periodNo = periodNo,
        _repaymentAmount = repaymentAmount,
        _repaymentAmountDesc = repaymentAmountDesc,
        _status = status,
        _statusDesc = statusDesc,
        _canClick = canClick;

  // Getters
  String get date => _date;
  int get periodNo => _periodNo;
  String get repaymentAmount => _repaymentAmount;
  String get repaymentAmountDesc => _repaymentAmountDesc;
  int get status => _status;
  String get statusDesc => _statusDesc;
  int get canClick => _canClick;

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
      'date': _date,
      'periodNo': _periodNo,
      'repaymentAmount': _repaymentAmount,
      'repaymentAmountDesc': _repaymentAmountDesc,
      'status': _status,
      'statusDesc': _statusDesc,
      'canClick': _canClick,
    };
  }
}

class BestDesc {
  final String _title;
  final String _status;
  final int _isLock;
  final String _amountDesc;
  final String _amount;

  BestDesc({
    required String title,
    required String status,
    required int isLock,
    required String amountDesc,
    required String amount,
  })  : _title = title,
        _status = status,
        _isLock = isLock,
        _amountDesc = amountDesc,
        _amount = amount;

  BestDesc.empty()
      : this(
          title: '',
          status: '',
          isLock: 0,
          amountDesc: '',
          amount: '',
        );

  // Getters
  String get title => _title;
  String get status => _status;
  int get isLock => _isLock;
  String get amountDesc => _amountDesc;
  String get amount => _amount;

  // fromMap 方法，用于从 Map 创建 BestDesc 实例
  factory BestDesc.fromMap(Map<String, dynamic> map) {
    return BestDesc(
      title: map['title'] ?? '',
      status: map['status'] ?? '',
      isLock: map['is_lock'] ?? 0,
      amountDesc: map['amount_dec'] ?? '',
      amount: map['amount'] ?? '',
    );
  }

  // toMap 方法，用于将 BestDesc 实例转换为 Map
  Map<String, dynamic> toMap() {
    return {
      'title': _title,
      'status': _status,
      'is_lock': _isLock,
      'amount_dec': _amountDesc,
      'amount': _amount,
    };
  }
}
