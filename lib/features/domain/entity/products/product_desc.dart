class ProductDesc {
  final String? _mainPositionDesc;
  final String? _logo;
  final String? _productDesc;
  final String? _title;
  final String? _label;
  final String? _tags;

  ProductDesc({
    String? mainPositionDesc,
    String? logo,
    String? productDesc,
    String? title,
    String? label,
    String? tags,
  })  : _mainPositionDesc = mainPositionDesc,
        _logo = logo,
        _productDesc = productDesc,
        _title = title,
        _label = label,
        _tags = tags;

  ProductDesc.empty()
      : _mainPositionDesc = null,
        _logo = null,
        _productDesc = null,
        _title = null,
        _label = null,
        _tags = null;

  String get mainPositionDesc => _mainPositionDesc ?? '';
  String get logo => _logo ?? '';
  String get productDesc => _productDesc ?? '';
  String get title => _title ?? '';
  String get label => _label ?? '';
  String get tags => _tags ?? '';

  factory ProductDesc.fromMap(Map<String, dynamic> json) => ProductDesc(
        mainPositionDesc: json["main_position_desc"] as String?,
        logo: json["logo"] as String?,
        productDesc: json["product_desc"] as String?,
        title: json["title"] as String?,
        label: json["label"] as String?,
        tags: json["tags"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "main_position_desc": _mainPositionDesc,
        "logo": _logo,
        "product_desc": _productDesc,
        "title": _title,
        "label": _label,
        "tags": _tags,
      };
}
