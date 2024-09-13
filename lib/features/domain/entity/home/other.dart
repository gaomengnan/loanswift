import 'package:loanswift/core/core.dart';

class Other {
  final String feedbackUrl;
  final String cardListPath;
  final List<Protocol> protocols;

  Other.empty()
      : this(
          feedbackUrl: '',
          cardListPath: '',
          protocols: [],
        );

  factory Other.fromMap(DataMap map) {
    return Other(
        cardListPath: map['card_list_path'] ?? '',
        feedbackUrl: map['feedback_path'] ?? '',
        protocols: List<Protocol>.from(
            map["protocol_list"].map((x) => Protocol.fromMap(x))));
  }
  Map<String, dynamic> toMap() => {
        'card_list_path': cardListPath,
        'feedback_path': feedbackUrl,
        'protocol_list': protocols
            .map((x) => x.toMap())
            .toList() // Convert List<Protocol> to List<Map<String, dynamic>> for serialization.
      };

  Other({
    required this.feedbackUrl,
    required this.protocols,
    required this.cardListPath,
  });
}

class Protocol {
  final String name;

  final String path;

  factory Protocol.fromMap(DataMap map) {
    return Protocol(
      name: map['name'] ?? '',
      path: map['path'] ?? '',
    );
  }

  DataMap toMap() => {
        'name': name,
        'path': path,
      };

  Protocol({required this.name, required this.path});
}
