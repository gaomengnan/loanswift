class UserOrderCopywriterInfo {
  final String? _orderStatusText;
  final String? _dateText;
  final String? _moneyText;

  UserOrderCopywriterInfo({
    String? orderStatusText,
    String? dateText,
    String? moneyText,
  })  : _orderStatusText = orderStatusText,
        _dateText = dateText,
        _moneyText = moneyText;

  UserOrderCopywriterInfo.empty()
      : this(
          orderStatusText: "",
          dateText: "",
          moneyText: "",
        );

  factory UserOrderCopywriterInfo.fromMap(Map<String, dynamic> json) =>
      UserOrderCopywriterInfo(
        orderStatusText: json["order_status_text"] as String? ?? "",
        dateText: json["date_text"] as String? ?? "",
        moneyText: json["money_text"] as String? ?? "",
      );

  Map<String, dynamic> toMap() => {
        "order_status_text": _orderStatusText,
        "date_text": _dateText,
        "money_text": _moneyText,
      };

  // Getters with default values
  String get orderStatusText => _orderStatusText ?? "";
  String get dateText => _dateText ?? "";
  String get moneyText => _moneyText ?? "";
}
