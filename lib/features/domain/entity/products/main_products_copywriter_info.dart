import 'package:loanswift/features/domain/entity/home/button.dart';
import 'package:loanswift/features/domain/entity/products/product_desc.dart';

class MainProductsCopywriterInfo {
  final Button button;
  final ProductDesc productDesc;

  MainProductsCopywriterInfo({
    required this.button,
    required this.productDesc,
  });

  MainProductsCopywriterInfo.empty() : this(
      button: Button.empty(),
      productDesc: ProductDesc.empty(),
      );

  factory MainProductsCopywriterInfo.fromMap(Map<String, dynamic> json) =>
      MainProductsCopywriterInfo(
        button: Button.fromMap(json["button"]),
        productDesc: ProductDesc.fromMap(json["product_desc"]),
      );

  Map<String, dynamic> toMap() => {
        "button": button.toMap(),
        "product_desc": productDesc.toMap(),
      };
}
