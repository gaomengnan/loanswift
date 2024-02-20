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

  /// `US`
  String get phone_code {
    return Intl.message(
      'US',
      name: 'phone_code',
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

  /// `Apply in 3 minutes`
  String get title700 {
    return Intl.message(
      'Apply in 3 minutes',
      name: 'title700',
      desc: '',
      args: [],
    );
  }

  /// `Loan approval in 5 minutes`
  String get title800 {
    return Intl.message(
      'Loan approval in 5 minutes',
      name: 'title800',
      desc: '',
      args: [],
    );
  }

  /// `Flexible Borrowing and Repayment`
  String get title900 {
    return Intl.message(
      'Flexible Borrowing and Repayment',
      name: 'title900',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your real-name authenticated mobile number`
  String get shurushoujihao {
    return Intl.message(
      'Please enter your real-name authenticated mobile number',
      name: 'shurushoujihao',
      desc: '',
      args: [],
    );
  }

  /// `Login or register only`
  String get jindengluzhuce {
    return Intl.message(
      'Login or register only',
      name: 'jindengluzhuce',
      desc: '',
      args: [],
    );
  }

  /// `Apply now`
  String get lijishengqing {
    return Intl.message(
      'Apply now',
      name: 'lijishengqing',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Login/Register`
  String get huanying {
    return Intl.message(
      'Welcome to Login/Register',
      name: 'huanying',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get errorPhone {
    return Intl.message(
      'Invalid phone number',
      name: 'errorPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get enter_verification_code {
    return Intl.message(
      'Enter Verification Code',
      name: 'enter_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `SMS verification code has been sent to`
  String get verification_code_sendto {
    return Intl.message(
      'SMS verification code has been sent to',
      name: 'verification_code_sendto',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect verification code`
  String get verification_code_wrong {
    return Intl.message(
      'Incorrect verification code',
      name: 'verification_code_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Not receiving the verification code?`
  String get unable_to_receive_the_verification_code {
    return Intl.message(
      'Not receiving the verification code?',
      name: 'unable_to_receive_the_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Retrieve Again`
  String get retrieve_again {
    return Intl.message(
      'Retrieve Again',
      name: 'retrieve_again',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Read`
  String get read_privacy {
    return Intl.message(
      'Read',
      name: 'read_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree_privacy {
    return Intl.message(
      'Agree',
      name: 'agree_privacy',
      desc: '',
      args: [],
    );
  }

  /// `To expedite your loan process, we need these permissions`
  String get permission_title {
    return Intl.message(
      'To expedite your loan process, we need these permissions',
      name: 'permission_title',
      desc: '',
      args: [],
    );
  }

  /// `Contact List`
  String get contact {
    return Intl.message(
      'Contact List',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Installed Applications`
  String get install_packages {
    return Intl.message(
      'Installed Applications',
      name: 'install_packages',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get sms {
    return Intl.message(
      'SMS',
      name: 'sms',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive`
  String get high_quality {
    return Intl.message(
      'Exclusive',
      name: 'high_quality',
      desc: '',
      args: [],
    );
  }

  /// `Concession`
  String get free_concession {
    return Intl.message(
      'Concession',
      name: 'free_concession',
      desc: '',
      args: [],
    );
  }

  /// `Fast Transfer`
  String get quick_deposit {
    return Intl.message(
      'Fast Transfer',
      name: 'quick_deposit',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive`
  String get exclusive {
    return Intl.message(
      'Exclusive',
      name: 'exclusive',
      desc: '',
      args: [],
    );
  }

  /// `ID Card Photo`
  String get idcard {
    return Intl.message(
      'ID Card Photo',
      name: 'idcard',
      desc: '',
      args: [],
    );
  }

  /// `ID Card Front Photo`
  String get idcard_front {
    return Intl.message(
      'ID Card Front Photo',
      name: 'idcard_front',
      desc: '',
      args: [],
    );
  }

  /// `ID Card Reverse Photo`
  String get idcard_reverse {
    return Intl.message(
      'ID Card Reverse Photo',
      name: 'idcard_reverse',
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
