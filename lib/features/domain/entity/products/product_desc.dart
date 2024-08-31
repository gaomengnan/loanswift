class ProductDesc {
  final String mainPositionDesc;
  final String logo;
  final String productDesc;
  final String title;
  final String label;
  final String tags;

  ProductDesc({
    required this.mainPositionDesc,
    required this.logo,
    required this.productDesc,
    required this.title,
    required this.label,
    required this.tags,
  });

  ProductDesc.empty()
      : this(
          tags: "",
          mainPositionDesc: "",
          logo: "",
          productDesc: "",
          title: "",
          label: "",
        );

  factory ProductDesc.fromMap(Map<String, dynamic> json) => ProductDesc(
        mainPositionDesc: json["main_position_desc"],
        logo: json["logo"],
        productDesc: json["product_desc"],
        title: json["title"],
        label: json["label"],
        tags: json["tags"],
      );

  Map<String, dynamic> toMap() => {
        "main_position_desc": mainPositionDesc,
        "logo": logo,
        "product_desc": productDesc,
        "title": title,
        "label": label,
        "tags": tags,
      };
}
