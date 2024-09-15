class RepaymentInfo {
  final String? _loanInterest;
  final dynamic _lastRepayTime;
  final int? _overdue;
  final int? _overdueDays;
  final String? _actualTotalMoney;

  RepaymentInfo({
    String? loanInterest,
    dynamic lastRepayTime,
    int? overdue,
    int? overdueDays,
    String? actualTotalMoney,
  })  : _loanInterest = loanInterest,
        _lastRepayTime = lastRepayTime,
        _overdue = overdue,
        _overdueDays = overdueDays,
        _actualTotalMoney = actualTotalMoney;

  RepaymentInfo.empty()
      : this(
          loanInterest: "",
          lastRepayTime: null,
          overdue: 0,
          overdueDays: 0,
          actualTotalMoney: "",
        );

  factory RepaymentInfo.fromMap(Map<String, dynamic> json) => RepaymentInfo(
        loanInterest: json["loan_interest"] as String? ?? "",
        lastRepayTime: json["last_repay_time"],
        overdue: json["overdue"] as int? ?? 0,
        overdueDays: json["overdue_days"] as int? ?? 0,
        actualTotalMoney: json["actual_total_money"] as String? ?? "",
      );

  Map<String, dynamic> toMap() => {
        "loan_interest": _loanInterest,
        "last_repay_time": _lastRepayTime,
        "overdue": _overdue,
        "overdue_days": _overdueDays,
        "actual_total_money": _actualTotalMoney,
      };

  // Getters with default values
  String get loanInterest => _loanInterest ?? "";
  dynamic get lastRepayTime => _lastRepayTime;
  int get overdue => _overdue ?? 0;
  int get overdueDays => _overdueDays ?? 0;
  String get actualTotalMoney => _actualTotalMoney ?? "";
}
