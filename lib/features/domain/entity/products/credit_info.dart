class CreditInfo {
  final int creditStatus;
  final String sourceOrderNo;

  CreditInfo({
    required this.creditStatus,
    required this.sourceOrderNo,
  });

  CreditInfo.empty()
      : this(
          creditStatus: 0,
          sourceOrderNo: "",
        );

  factory CreditInfo.fromMap(Map<String, dynamic> json) => CreditInfo(
        creditStatus: json["credit_status"],
        sourceOrderNo: json["source_order_no"],
      );

  Map<String, dynamic> toMap() => {
        "credit_status": creditStatus,
        "source_order_no": sourceOrderNo,
      };
}
