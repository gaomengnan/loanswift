class BannerEntity {
  final String? _path;
  final int? _isClick;
  final String? _jumpUrl;

  BannerEntity({
    String? path,
    int? isClick,
    String? jumpUrl,
  })  : _path = path,
        _isClick = isClick,
        _jumpUrl = jumpUrl;

  BannerEntity.empty()
      : this(
          path: "",
          isClick: 0,
          jumpUrl: "",
        );

  factory BannerEntity.fromMap(Map<String, dynamic> json) => BannerEntity(
        path: json["path"] as String?,
        isClick: json["is_click"] as int?,
        jumpUrl: json["jump_url"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "path": _path,
        "is_click": _isClick,
        "jump_url": _jumpUrl,
      };

  // Getters with default values
  String get path => _path ?? "";
  int get isClick => _isClick ?? 0;
  String get jumpUrl => _jumpUrl ?? "";
}
