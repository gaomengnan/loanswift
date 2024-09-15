class OrderConfirm {
  final dynamic _serviceFee;
  final String _controlNumber;
  final String _serviceFeeDesc;
  final dynamic _interestFee;
  final dynamic _firstPeriodInterest;
  final dynamic _repayAmount;
  final dynamic _totalInterest;
  final dynamic _totalServiceFee;
  final dynamic _deductionFee;
  final dynamic _firstPeriodInterestFee;
  final dynamic _platformManagementFee;
  final dynamic _riskServiceFee;
  final dynamic _actualAmount;
  final String _firstPeriodPayTime;
  final dynamic _processingFee;
  final dynamic _gstFee;
  final dynamic _repaymentAmount;
  final List<RepayPlanConfirm> _repayPlan;

  OrderConfirm({
    required dynamic serviceFee,
    required String controlNumber,
    required String serviceFeeDesc,
    required dynamic interestFee,
    required dynamic firstPeriodInterest,
    required dynamic repayAmount,
    required dynamic totalInterest,
    required dynamic totalServiceFee,
    required dynamic deductionFee,
    required dynamic firstPeriodInterestFee,
    required dynamic platformManagementFee,
    required dynamic riskServiceFee,
    required dynamic actualAmount,
    required String firstPeriodPayTime,
    required dynamic processingFee,
    required dynamic gstFee,
    required dynamic repaymentAmount,
    required List<RepayPlanConfirm> repayPlan,
  })  : _serviceFee = serviceFee,
        _controlNumber = controlNumber,
        _serviceFeeDesc = serviceFeeDesc,
        _interestFee = interestFee,
        _firstPeriodInterest = firstPeriodInterest,
        _repayAmount = repayAmount,
        _totalInterest = totalInterest,
        _totalServiceFee = totalServiceFee,
        _deductionFee = deductionFee,
        _firstPeriodInterestFee = firstPeriodInterestFee,
        _platformManagementFee = platformManagementFee,
        _riskServiceFee = riskServiceFee,
        _actualAmount = actualAmount,
        _firstPeriodPayTime = firstPeriodPayTime,
        _processingFee = processingFee,
        _gstFee = gstFee,
        _repaymentAmount = repaymentAmount,
        _repayPlan = repayPlan;

  // Getters with default values
  dynamic get serviceFee => _serviceFee;
  String get controlNumber => _controlNumber;
  String get serviceFeeDesc => _serviceFeeDesc;
  dynamic get interestFee => _interestFee;
  dynamic get firstPeriodInterest => _firstPeriodInterest;
  dynamic get repayAmount => _repayAmount;
  dynamic get totalInterest => _totalInterest;
  dynamic get totalServiceFee => _totalServiceFee;
  dynamic get deductionFee => _deductionFee;
  dynamic get firstPeriodInterestFee => _firstPeriodInterestFee;
  dynamic get platformManagementFee => _platformManagementFee;
  dynamic get riskServiceFee => _riskServiceFee;
  dynamic get actualAmount => _actualAmount;
  String get firstPeriodPayTime => _firstPeriodPayTime;
  dynamic get processingFee => _processingFee;
  dynamic get gstFee => _gstFee;
  dynamic get repaymentAmount => _repaymentAmount;
  List<RepayPlanConfirm> get repayPlan => _repayPlan;
}

class RepayPlanConfirm {
  final dynamic _repayAmount;
  final String _repayAmountDesc;
  final dynamic _principal;
  final dynamic _interest;
  final dynamic _serviceFee;
  final dynamic _periodNo;
  final String _repayTime;
  final String _payTime;
  final dynamic _dateType;
  final dynamic _repayMoney;

  RepayPlanConfirm({
    required dynamic repayAmount,
    required String repayAmountDesc,
    required dynamic principal,
    required dynamic interest,
    required dynamic serviceFee,
    required dynamic periodNo,
    required String repayTime,
    required String payTime,
    required dynamic dateType,
    required dynamic repayMoney,
  })  : _repayAmount = repayAmount,
        _repayAmountDesc = repayAmountDesc,
        _principal = principal,
        _interest = interest,
        _serviceFee = serviceFee,
        _periodNo = periodNo,
        _repayTime = repayTime,
        _payTime = payTime,
        _dateType = dateType,
        _repayMoney = repayMoney;

  // Getters with default values
  dynamic get repayAmount => _repayAmount;
  String get repayAmountDesc => _repayAmountDesc;
  dynamic get principal => _principal;
  dynamic get interest => _interest;
  dynamic get serviceFee => _serviceFee;
  dynamic get periodNo => _periodNo;
  String get repayTime => _repayTime;
  String get payTime => _payTime;
  dynamic get dateType => _dateType;
  dynamic get repayMoney => _repayMoney;

  factory RepayPlanConfirm.fromJson(Map<String, dynamic> json) => RepayPlanConfirm(
    repayAmount: json["repay_amount"],
    repayAmountDesc: json["repay_amount_desc"],
    principal: json["principal"],
    interest: json["interest"],
    serviceFee: json["service_fee"],
    periodNo: json["period_no"],
    repayTime: json["repay_time"],
    payTime: json["pay_time"],
    dateType: json["date_type"],
    repayMoney: json["repay_money"],
  );

  factory RepayPlanConfirm.fromMap(Map<String, dynamic> map) => RepayPlanConfirm(
    repayAmount: map["repay_amount"],
    repayAmountDesc: map["repay_amount_desc"],
    principal: map["principal"],
    interest: map["interest"],
    serviceFee: map["service_fee"],
    periodNo: map["period_no"],
    repayTime: map["repay_time"],
    payTime: map["pay_time"],
    dateType: map["date_type"],
    repayMoney: map["repay_money"],
  );

  Map<String, dynamic> toMap() => {
    "repay_amount": _repayAmount,
    "repay_amount_desc": _repayAmountDesc,
    "principal": _principal,
    "interest": _interest,
    "service_fee": _serviceFee,
    "period_no": _periodNo,
    "repay_time": _repayTime,
    "pay_time": _payTime,
    "date_type": _dateType,
    "repay_money": _repayMoney,
  };
}
