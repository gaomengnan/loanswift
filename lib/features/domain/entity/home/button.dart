class Button {
  final String text;
  final bool isClick;

  Button({
    required this.text,
    required this.isClick,
  });

  Button.empty()
      : this(
          text: "",
          isClick: false,
        );

  factory Button.fromMap(Map<String, dynamic> json) => Button(
        text: json["text"],
        isClick: json["is_click"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "is_click": isClick,
      };
}
