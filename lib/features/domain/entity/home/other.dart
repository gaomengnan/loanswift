import 'package:loanswift/core/core.dart';

class Other {
  final String? _feedbackUrl;
  final String? _cardListPath;
  final List<Protocol>? _protocols;

  Other({
    String? feedbackUrl,
    String? cardListPath,
    List<Protocol>? protocols,
  })  : _feedbackUrl = feedbackUrl,
        _cardListPath = cardListPath,
        _protocols = protocols;

  Other.empty()
      : this(
          feedbackUrl: '',
          cardListPath: '',
          protocols: [],
        );

  factory Other.fromMap(DataMap map) {
    return Other(
      cardListPath: map['card_list_path'] as String? ?? '',
      feedbackUrl: map['feedback_path'] as String? ?? '',
      protocols: List<Protocol>.from(
        (map["protocol_list"] as List).map((x) => Protocol.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() => {
        'card_list_path': _cardListPath,
        'feedback_path': _feedbackUrl,
        'protocol_list': _protocols?.map((x) => x.toMap()).toList(),
      };

  // Getters with default values
  String get feedbackUrl => _feedbackUrl ?? "";
  String get cardListPath => _cardListPath ?? "";
  List<Protocol> get protocols => _protocols ?? [];
}

class Protocol {
  final String? _name;
  final String? _path;

  Protocol({
    String? name,
    String? path,
  })  : _name = name,
        _path = path;

  factory Protocol.fromMap(DataMap map) {
    return Protocol(
      name: map['name'] as String? ?? '',
      path: map['path'] as String? ?? '',
    );
  }

  DataMap toMap() => {
        'name': _name,
        'path': _path,
      };

  // Getters with default values
  String get name => _name ?? "";
  String get path => _path ?? "";
}
