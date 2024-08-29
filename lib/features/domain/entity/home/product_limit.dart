class ProductLimit {
  final String serviceRate;
  final int productForm;
  final String rateMin;
  final String loanRate;
  final String term;
  final String newMaxAmount;
  final String oldMaxAmount;

  ProductLimit({
    required this.serviceRate,
    required this.productForm,
    required this.rateMin,
    required this.loanRate,
    required this.term,
    required this.newMaxAmount,
    required this.oldMaxAmount,
  });

  ProductLimit.empty()
      : this(
          newMaxAmount: "",
          oldMaxAmount: "",
          serviceRate: "",
          productForm: 0,
          rateMin: "",
          loanRate: "",
          term: "",
        );

  factory ProductLimit.fromMap(Map<String, dynamic> json) => ProductLimit(
        serviceRate: json["service_rate"],
        productForm: json["product_form"],
        rateMin: json["rate_min"],
        loanRate: json["loan_rate"],
        term: json["term"],
        newMaxAmount: json["new_max_amount"],
        oldMaxAmount: json["old_max_amount"],
      );

  Map<String, dynamic> toMap() => {
        "service_rate": serviceRate,
        "product_form": productForm,
        "rate_min": rateMin,
        "loan_rate": loanRate,
        "term": term,
        "new_max_amount": newMaxAmount,
        "old_max_amount": oldMaxAmount,
      };
}
