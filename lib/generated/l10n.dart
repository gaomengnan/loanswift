// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get lang {
    return Intl.message(
      'en',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Flutter localization`
  String get name {
    return Intl.message(
      'Flutter localization',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Hello World`
  String get hello_world {
    return Intl.message(
      'Hello World',
      name: 'hello_world',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_button {
    return Intl.message(
      'Home',
      name: 'home_button',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get person_button {
    return Intl.message(
      'Profile',
      name: 'person_button',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Loan Amount`
  String get maximun_load_text {
    return Intl.message(
      'Maximum Loan Amount',
      name: 'maximun_load_text',
      desc: '',
      args: [],
    );
  }

  /// `Borrow up to 1,000 yuan for 12 months, starting from 6% daily fee, annual interest rate (simple interest) starting from 3.6%`
  String get maximun_load_sub_text {
    return Intl.message(
      'Borrow up to 1,000 yuan for 12 months, starting from 6% daily fee, annual interest rate (simple interest) starting from 3.6%',
      name: 'maximun_load_sub_text',
      desc: '',
      args: [],
    );
  }

  /// `(CNY)`
  String get maximun_load_text_unit {
    return Intl.message(
      '(CNY)',
      name: 'maximun_load_text_unit',
      desc: '',
      args: [],
    );
  }

  /// `After obtaining the limit, rewards can be acquired.`
  String get title100 {
    return Intl.message(
      'After obtaining the limit, rewards can be acquired.',
      name: 'title100',
      desc: '',
      args: [],
    );
  }

  /// `Up to 30 days interest-free`
  String get title200 {
    return Intl.message(
      'Up to 30 days interest-free',
      name: 'title200',
      desc: '',
      args: [],
    );
  }

  /// `Minimum annual interest rate of 3.6%`
  String get title300 {
    return Intl.message(
      'Minimum annual interest rate of 3.6%',
      name: 'title300',
      desc: '',
      args: [],
    );
  }

  /// `Fastest loan disbursement in five minutes`
  String get title400 {
    return Intl.message(
      'Fastest loan disbursement in five minutes',
      name: 'title400',
      desc: '',
      args: [],
    );
  }

  /// `Check your limit`
  String get title500 {
    return Intl.message(
      'Check your limit',
      name: 'title500',
      desc: '',
      args: [],
    );
  }

  /// `Borrowing Strategies`
  String get title600 {
    return Intl.message(
      'Borrowing Strategies',
      name: 'title600',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
