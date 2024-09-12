import 'package:loanswift/core/core.dart';

class Other {
  final String feedbackUrl;
  final List<Protocol> protocols;

  Other.empty()
      : this(
          feedbackUrl: '',
          protocols: [],
        );

  factory Other.fromMap(DataMap map) {
    return Other(
        feedbackUrl: map['feedback_path'] ?? '',
        protocols: List<Protocol>.from(
            map["protocol_list"].map((x) => Protocol.fromMap(x))));
  }

  Other({required this.feedbackUrl, required this.protocols});
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

  Protocol({required this.name, required this.path});
}
