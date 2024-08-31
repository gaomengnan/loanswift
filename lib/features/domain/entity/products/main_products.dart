import 'package:loanswift/features/domain/entity/products/credit_info.dart';
import 'package:loanswift/features/domain/entity/products/product_limit.dart';

import 'main_products_copywriter_info.dart';

class MainProducts {
  final String productName;
  final String productCompany;
  final String productAmount;
  final bool isFakeAmount;
  final ProductLimit productLimit;
  final MainProductsCopywriterInfo copywriterInfo;
  final CreditInfo creditInfo;

  MainProducts({
    required this.productName,
    required this.productCompany,
    required this.productAmount,
    required this.isFakeAmount,
    required this.productLimit,
    required this.copywriterInfo,
    required this.creditInfo,
  });

  MainProducts.empty()
      : this(
          productName: "",
          productCompany: "",
          productAmount: "",
          isFakeAmount: false,
          productLimit: ProductLimit.empty(),
          copywriterInfo: MainProductsCopywriterInfo.empty(),
          creditInfo: CreditInfo.empty(),
        );

  factory MainProducts.fromMap(Map<String, dynamic> json) => MainProducts(
        productName: json["product_name"],
        productCompany: json["product_company"],
        productAmount: json["product_amount"],
        isFakeAmount: json["is_fake_amount"],
        productLimit: ProductLimit.fromMap(json["product_limit"]),
        copywriterInfo:
            MainProductsCopywriterInfo.fromMap(json["copywriter_info"]),
        creditInfo: CreditInfo.fromMap(json["credit_info"]),
      );

  Map<String, dynamic> toMap() => {
        "product_name": productName,
        "product_company": productCompany,
        "product_amount": productAmount,
        "is_fake_amount": isFakeAmount,
        "product_limit": productLimit.toMap(),
        "copywriter_info": copywriterInfo.toMap(),
        "credit_info": creditInfo.toMap(),
      };
}
