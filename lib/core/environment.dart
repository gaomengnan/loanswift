import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      return ".env.prod";
    }
    return ".env.dev";
  }

  static String get baseUrl => dotenv.env['BASE_URL'] ?? "http://localhost";
}
