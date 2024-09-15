class ProductLimit {
  final String? _serviceRate;
  final int? _productForm;
  final String? _rateMin;
  final String? _loanRate;
  final String? _term;
  final String? _newMaxAmount;
  final String? _oldMaxAmount;

  ProductLimit({
    String? serviceRate,
    int? productForm,
    String? rateMin,
    String? loanRate,
    String? term,
    String? newMaxAmount,
    String? oldMaxAmount,
  })  : _serviceRate = serviceRate,
        _productForm = productForm,
        _rateMin = rateMin,
        _loanRate = loanRate,
        _term = term,
        _newMaxAmount = newMaxAmount,
        _oldMaxAmount = oldMaxAmount;

  ProductLimit.empty()
      : _serviceRate = null,
        _productForm = null,
        _rateMin = null,
        _loanRate = null,
        _term = null,
        _newMaxAmount = null,
        _oldMaxAmount = null;

  String get serviceRate => _serviceRate ?? '';
  int get productForm => _productForm ?? 0;
  String get rateMin => _rateMin ?? '';
  String get loanRate => _loanRate ?? '';
  String get term => _term ?? '';
  String get newMaxAmount => _newMaxAmount ?? '';
  String get oldMaxAmount => _oldMaxAmount ?? '';

  factory ProductLimit.fromMap(Map<String, dynamic> json) => ProductLimit(
        serviceRate: json["service_rate"] as String?,
        productForm: json["product_form"] as int?,
        rateMin: json["rate_min"] as String?,
        loanRate: json["loan_rate"] as String?,
        term: json["term"] as String?,
        newMaxAmount: json["new_max_amount"] as String?,
        oldMaxAmount: json["old_max_amount"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "service_rate": _serviceRate,
        "product_form": _productForm,
        "rate_min": _rateMin,
        "loan_rate": _loanRate,
        "term": _term,
        "new_max_amount": _newMaxAmount,
        "old_max_amount": _oldMaxAmount,
      };
}
