class RelationProduct {
  final String? _productName;
  final String? _productAmount;
  final String? _productLogo;

  RelationProduct({
    String? productName,
    String? productAmount,
    String? productLogo,
  })  : _productName = productName,
        _productAmount = productAmount,
        _productLogo = productLogo;

  RelationProduct.empty()
      : _productName = null,
        _productAmount = null,
        _productLogo = null;

  String get productName => _productName ?? '';
  String get productAmount => _productAmount ?? '';
  String get productLogo => _productLogo ?? '';

  factory RelationProduct.fromMap(Map<String, dynamic> json) => RelationProduct(
        productName: json["product_name"] as String?,
        productAmount: json["product_amount"] as String?,
        productLogo: json["product_logo"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "product_name": _productName,
        "product_amount": _productAmount,
        "product_logo": _productLogo,
      };
}
