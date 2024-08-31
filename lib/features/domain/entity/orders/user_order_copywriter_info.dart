class UserOrderCopywriterInfo {
  final String orderStatusText;
  final String dateText;
  final String moneyText;

  UserOrderCopywriterInfo({
    required this.orderStatusText,
    required this.dateText,
    required this.moneyText,
  });

  UserOrderCopywriterInfo.empty()
      : this(
          orderStatusText: "",
          dateText: "",
          moneyText: "",
        );

  factory UserOrderCopywriterInfo.fromMap(Map<String, dynamic> json) =>
      UserOrderCopywriterInfo(
        orderStatusText: json["order_status_text"],
        dateText: json["date_text"],
        moneyText: json["money_text"],
      );

  Map<String, dynamic> toMap() => {
        "order_status_text": orderStatusText,
        "date_text": dateText,
        "money_text": moneyText,
      };
}
