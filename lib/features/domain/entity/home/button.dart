class Button {
  final String? _text;
  final bool? _isClick;

  Button({
    String? text,
    bool? isClick,
  })  : _text = text,
        _isClick = isClick;

  Button.empty()
      : this(
          text: "",
          isClick: false,
        );

  factory Button.fromMap(Map<String, dynamic> json) => Button(
        text: json["text"] as String?,
        isClick: json["is_click"] as bool?,
      );

  Map<String, dynamic> toMap() => {
        "text": _text,
        "is_click": _isClick,
      };

  // Getters with default values
  String get text => _text ?? "";
  bool get isClick => _isClick ?? false;
}
