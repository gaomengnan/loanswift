import 'package:loanswift/features/domain/entity/home/button.dart';
import 'package:loanswift/features/domain/entity/products/product_desc.dart';

class MainProductsCopywriterInfo {
  final Button? _button;
  final ProductDesc? _productDesc;

  MainProductsCopywriterInfo({
    Button? button,
    ProductDesc? productDesc,
  })  : _button = button,
        _productDesc = productDesc;

  MainProductsCopywriterInfo.empty()
      : _button = null,
        _productDesc = null;

  Button get button => _button ?? Button.empty();
  ProductDesc get productDesc => _productDesc ?? ProductDesc.empty();

  factory MainProductsCopywriterInfo.fromMap(Map<String, dynamic> json) =>
      MainProductsCopywriterInfo(
        button: json["button"] != null ? Button.fromMap(json["button"]) : null,
        productDesc: json["product_desc"] != null ? ProductDesc.fromMap(json["product_desc"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "button": _button?.toMap(),
        "product_desc": _productDesc?.toMap(),
      };
}
