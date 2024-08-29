class Rules {
  final bool certifyCompleted;

  Rules({
    required this.certifyCompleted,
  });

  Rules.empty()
      : this(
          certifyCompleted: false,
        );

  factory Rules.fromMap(Map<String, dynamic> json) => Rules(
        certifyCompleted: json["certify_completed"],
      );

  Map<String, dynamic> toMap() => {
        "certify_completed": certifyCompleted,
      };
}
