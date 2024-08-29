class Banner {
  final String path;
  final int isClick;
  final String jumpUrl;

  Banner({
    required this.path,
    required this.isClick,
    required this.jumpUrl,
  });

  Banner.empty()
      : this(
          path: "",
          isClick: 0,
          jumpUrl: "",
        );

  factory Banner.fromMap(Map<String, dynamic> json) => Banner(
        path: json["path"],
        isClick: json["is_click"],
        jumpUrl: json["jump_url"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "is_click": isClick,
        "jump_url": jumpUrl,
      };
}
