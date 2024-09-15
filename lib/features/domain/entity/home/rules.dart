class Rules {
  final bool? _certifyCompleted;
  final bool? _isBindCard;

  Rules({
    bool? certifyCompleted,
    bool? isBindCard,
  })  : _certifyCompleted = certifyCompleted,
        _isBindCard = isBindCard;

  Rules.empty()
      : this(
          certifyCompleted: false,
          isBindCard: false,
        );

  factory Rules.fromMap(Map<String, dynamic> json) => Rules(
        certifyCompleted: json["certify_completed"] as bool? ?? false,
        isBindCard: json["is_bind_card"] as bool? ?? false,
      );

  Map<String, dynamic> toMap() => {
        "certify_completed": _certifyCompleted,
        "is_bind_card": _isBindCard,
      };

  // Getters with default values
  bool get certifyCompleted => _certifyCompleted ?? false;
  bool get isBindCard => _isBindCard ?? false;
}
