// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "hello_world": MessageLookupByLibrary.simpleMessage("Hello World"),
        "home_button": MessageLookupByLibrary.simpleMessage("首页"),
        "lang": MessageLookupByLibrary.simpleMessage("zh"),
        "maximun_load_sub_text": MessageLookupByLibrary.simpleMessage(
            "1千元借12个月,日费用6分起,年化利率(单利) 3.6%起"),
        "maximun_load_text": MessageLookupByLibrary.simpleMessage("最高可借额度"),
        "maximun_load_text_unit": MessageLookupByLibrary.simpleMessage("(元)"),
        "name": MessageLookupByLibrary.simpleMessage("Flutter localization"),
        "person_button": MessageLookupByLibrary.simpleMessage("我的")
      };
}
