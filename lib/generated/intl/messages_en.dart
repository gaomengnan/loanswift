// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "hello_world": MessageLookupByLibrary.simpleMessage("Hello World"),
        "home_button": MessageLookupByLibrary.simpleMessage("Home"),
        "lang": MessageLookupByLibrary.simpleMessage("en"),
        "maximun_load_sub_text": MessageLookupByLibrary.simpleMessage(
            "Borrow up to 1,000 yuan for 12 months, starting from 6% daily fee, annual interest rate (simple interest) starting from 3.6%"),
        "maximun_load_text":
            MessageLookupByLibrary.simpleMessage("Maximum Loan Amount"),
        "maximun_load_text_unit": MessageLookupByLibrary.simpleMessage("(CNY)"),
        "name": MessageLookupByLibrary.simpleMessage("Flutter localization"),
        "person_button": MessageLookupByLibrary.simpleMessage("Profile"),
        "title100": MessageLookupByLibrary.simpleMessage(
            "After obtaining the limit, rewards can be acquired."),
        "title200":
            MessageLookupByLibrary.simpleMessage("Up to 30 days interest-free"),
        "title300": MessageLookupByLibrary.simpleMessage(
            "Minimum annual interest rate of 3.6%"),
        "title400": MessageLookupByLibrary.simpleMessage(
            "Fastest loan disbursement in five minutes"),
        "title500": MessageLookupByLibrary.simpleMessage("Check your limit"),
        "title600": MessageLookupByLibrary.simpleMessage("Borrowing Strategies")
      };
}
