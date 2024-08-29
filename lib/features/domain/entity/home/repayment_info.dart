class RepaymentInfo {
  final String loanInterest;
  final dynamic lastRepayTime;
  final int overdue;
  final int overdueDays;
  final String actualTotalMoney;

  RepaymentInfo({
    required this.loanInterest,
    required this.lastRepayTime,
    required this.overdue,
    required this.overdueDays,
    required this.actualTotalMoney,
  });

  factory RepaymentInfo.fromMap(Map<String, dynamic> json) => RepaymentInfo(
        loanInterest: json["loan_interest"],
        lastRepayTime: json["last_repay_time"],
        overdue: json["overdue"],
        overdueDays: json["overdue_days"],
        actualTotalMoney: json["actual_total_money"],
      );

  Map<String, dynamic> toMap() => {
        "loan_interest": loanInterest,
        "last_repay_time": lastRepayTime,
        "overdue": overdue,
        "overdue_days": overdueDays,
        "actual_total_money": actualTotalMoney,
      };
}
