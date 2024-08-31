class RelationProduct {
  final String productName;
  final String productAmount;
  final String productLogo;

  RelationProduct({
    required this.productName,
    required this.productAmount,
    required this.productLogo,
  });

  factory RelationProduct.fromMap(Map<String, dynamic> json) => RelationProduct(
        productName: json["product_name"],
        productAmount: json["product_amount"],
        productLogo: json["product_logo"],
      );

  Map<String, dynamic> toMap() => {
        "product_name": productName,
        "product_amount": productAmount,
        "product_logo": productLogo,
      };
}
