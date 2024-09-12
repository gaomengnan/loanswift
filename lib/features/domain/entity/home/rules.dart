class Rules {
  final bool certifyCompleted;
  final bool isBindCard;


  Rules({
    required this.certifyCompleted,
    required this.isBindCard,
  });

  Rules.empty()
      : this(
          certifyCompleted: false,
          isBindCard: false,
        );

  factory Rules.fromMap(Map<String, dynamic> json) => Rules(
        certifyCompleted: json["certify_completed"] ?? false,
        isBindCard: json["is_bind_card"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "certify_completed": certifyCompleted,
        "is_bind_card": isBindCard,
      };
}
