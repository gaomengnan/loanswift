import 'package:loanswift/features/domain/entity/products/credit_info.dart';
import 'package:loanswift/features/domain/entity/products/product_limit.dart';

import 'main_products_copywriter_info.dart';

class MainProducts {
  final int? _productId;
  final String? _productName;
  final String? _productCompany;
  final String? _productAmount;
  final bool? _isFakeAmount;
  final ProductLimit? _productLimit;
  final MainProductsCopywriterInfo? _copywriterInfo;
  final CreditInfo? _creditInfo;

  MainProducts({
    int? productId,
    String? productName,
    String? productCompany,
    String? productAmount,
    bool? isFakeAmount,
    ProductLimit? productLimit,
    MainProductsCopywriterInfo? copywriterInfo,
    CreditInfo? creditInfo,
  })  : _productId = productId,
        _productName = productName,
        _productCompany = productCompany,
        _productAmount = productAmount,
        _isFakeAmount = isFakeAmount,
        _productLimit = productLimit,
        _copywriterInfo = copywriterInfo,
        _creditInfo = creditInfo;

  MainProducts.empty()
      : _productId = 0,
        _productName = '',
        _productCompany = '',
        _productAmount = '',
        _isFakeAmount = false,
        _productLimit = ProductLimit.empty(),
        _copywriterInfo = MainProductsCopywriterInfo.empty(),
        _creditInfo = CreditInfo.empty();

  int get productId => _productId ?? 0;
  String get productName => _productName ?? '';
  String get productCompany => _productCompany ?? '';
  String get productAmount => _productAmount ?? '';
  bool get isFakeAmount => _isFakeAmount ?? false;
  ProductLimit get productLimit => _productLimit ?? ProductLimit.empty();
  MainProductsCopywriterInfo get copywriterInfo => _copywriterInfo ?? MainProductsCopywriterInfo.empty();
  CreditInfo get creditInfo => _creditInfo ?? CreditInfo.empty();

  factory MainProducts.fromMap(Map<String, dynamic> json) => MainProducts(
        productId: json["product_id"] as int?,
        productName: json["product_name"] as String?,
        productCompany: json["product_company"] as String?,
        productAmount: json["product_amount"] as String?,
        isFakeAmount: json["is_fake_amount"] as bool?,
        productLimit: json["product_limit"] != null ? ProductLimit.fromMap(json["product_limit"]) : null,
        copywriterInfo: json["copywriter_info"] != null ? MainProductsCopywriterInfo.fromMap(json["copywriter_info"]) : null,
        creditInfo: json["credit_info"] != null ? CreditInfo.fromMap(json["credit_info"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "product_id": _productId,
        "product_name": _productName,
        "product_company": _productCompany,
        "product_amount": _productAmount,
        "is_fake_amount": _isFakeAmount,
        "product_limit": _productLimit?.toMap(),
        "copywriter_info": _copywriterInfo?.toMap(),
        "credit_info": _creditInfo?.toMap(),
      };

  Map<String, dynamic> toJson() => toMap();
}
