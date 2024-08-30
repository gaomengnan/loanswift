class BannerEntity {
  final String path;
  final int isClick;
  final String jumpUrl;

  BannerEntity({
    required this.path,
    required this.isClick,
    required this.jumpUrl,
  });

  BannerEntity.empty()
      : this(
          path: "",
          isClick: 0,
          jumpUrl: "",
        );

  factory BannerEntity.fromMap(Map<String, dynamic> json) => BannerEntity(
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
