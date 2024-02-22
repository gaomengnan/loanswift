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

  /// `急用钱`
  String get app_name {
    return Intl.message(
      '急用钱',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `zh`
  String get lang {
    return Intl.message(
      'zh',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `CN`
  String get phone_code {
    return Intl.message(
      'CN',
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

  /// `首页`
  String get home_button {
    return Intl.message(
      '首页',
      name: 'home_button',
      desc: '',
      args: [],
    );
  }

  /// `我的`
  String get person_button {
    return Intl.message(
      '我的',
      name: 'person_button',
      desc: '',
      args: [],
    );
  }

  /// `最高可借额度`
  String get maximun_load_text {
    return Intl.message(
      '最高可借额度',
      name: 'maximun_load_text',
      desc: '',
      args: [],
    );
  }

  /// `1千元借12个月,日费用6分起,年化利率(单利) 3.6%起`
  String get maximun_load_sub_text {
    return Intl.message(
      '1千元借12个月,日费用6分起,年化利率(单利) 3.6%起',
      name: 'maximun_load_sub_text',
      desc: '',
      args: [],
    );
  }

  /// `(元)`
  String get maximun_load_text_unit {
    return Intl.message(
      '(元)',
      name: 'maximun_load_text_unit',
      desc: '',
      args: [],
    );
  }

  /// `获取额度之后可获取奖励`
  String get title100 {
    return Intl.message(
      '获取额度之后可获取奖励',
      name: 'title100',
      desc: '',
      args: [],
    );
  }

  /// `最长30天免息`
  String get title200 {
    return Intl.message(
      '最长30天免息',
      name: 'title200',
      desc: '',
      args: [],
    );
  }

  /// `最低年化3.6%`
  String get title300 {
    return Intl.message(
      '最低年化3.6%',
      name: 'title300',
      desc: '',
      args: [],
    );
  }

  /// `最快五分钟放款`
  String get title400 {
    return Intl.message(
      '最快五分钟放款',
      name: 'title400',
      desc: '',
      args: [],
    );
  }

  /// `查看额度`
  String get title500 {
    return Intl.message(
      '查看额度',
      name: 'title500',
      desc: '',
      args: [],
    );
  }

  /// `借钱攻略`
  String get title600 {
    return Intl.message(
      '借钱攻略',
      name: 'title600',
      desc: '',
      args: [],
    );
  }

  /// `3分钟申请`
  String get title700 {
    return Intl.message(
      '3分钟申请',
      name: 'title700',
      desc: '',
      args: [],
    );
  }

  /// `5分钟放贷`
  String get title800 {
    return Intl.message(
      '5分钟放贷',
      name: 'title800',
      desc: '',
      args: [],
    );
  }

  /// `灵活借还`
  String get title900 {
    return Intl.message(
      '灵活借还',
      name: 'title900',
      desc: '',
      args: [],
    );
  }

  /// `请输入本人实名认证手机号`
  String get shurushoujihao {
    return Intl.message(
      '请输入本人实名认证手机号',
      name: 'shurushoujihao',
      desc: '',
      args: [],
    );
  }

  /// `仅登录或者注册`
  String get jindengluzhuce {
    return Intl.message(
      '仅登录或者注册',
      name: 'jindengluzhuce',
      desc: '',
      args: [],
    );
  }

  /// `立即申请`
  String get lijishengqing {
    return Intl.message(
      '立即申请',
      name: 'lijishengqing',
      desc: '',
      args: [],
    );
  }

  /// `欢迎登录/注册`
  String get huanying {
    return Intl.message(
      '欢迎登录/注册',
      name: 'huanying',
      desc: '',
      args: [],
    );
  }

  /// `请输入正确手机号码`
  String get errorPhone {
    return Intl.message(
      '请输入正确手机号码',
      name: 'errorPhone',
      desc: '',
      args: [],
    );
  }

  /// `请输入验证码`
  String get enter_verification_code {
    return Intl.message(
      '请输入验证码',
      name: 'enter_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `短信验证码已发送至`
  String get verification_code_sendto {
    return Intl.message(
      '短信验证码已发送至',
      name: 'verification_code_sendto',
      desc: '',
      args: [],
    );
  }

  /// `验证码错误`
  String get verification_code_wrong {
    return Intl.message(
      '验证码错误',
      name: 'verification_code_wrong',
      desc: '',
      args: [],
    );
  }

  /// `收不到验证码?`
  String get unable_to_receive_the_verification_code {
    return Intl.message(
      '收不到验证码?',
      name: 'unable_to_receive_the_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `重新获取`
  String get retrieve_again {
    return Intl.message(
      '重新获取',
      name: 'retrieve_again',
      desc: '',
      args: [],
    );
  }

  /// `重发`
  String get resend {
    return Intl.message(
      '重发',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `请阅读`
  String get read_privacy {
    return Intl.message(
      '请阅读',
      name: 'read_privacy',
      desc: '',
      args: [],
    );
  }

  /// `隐私政策`
  String get privacy {
    return Intl.message(
      '隐私政策',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `同意`
  String get agree_privacy {
    return Intl.message(
      '同意',
      name: 'agree_privacy',
      desc: '',
      args: [],
    );
  }

  /// `为了快速完成您的贷款流程, 我们需要这些权限`
  String get permission_title {
    return Intl.message(
      '为了快速完成您的贷款流程, 我们需要这些权限',
      name: 'permission_title',
      desc: '',
      args: [],
    );
  }

  /// `联系人列表`
  String get contact {
    return Intl.message(
      '联系人列表',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `已安装的应用程序`
  String get install_packages {
    return Intl.message(
      '已安装的应用程序',
      name: 'install_packages',
      desc: '',
      args: [],
    );
  }

  /// `短信`
  String get sms {
    return Intl.message(
      '短信',
      name: 'sms',
      desc: '',
      args: [],
    );
  }

  /// `相机`
  String get camera {
    return Intl.message(
      '相机',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `位置`
  String get location {
    return Intl.message(
      '位置',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `通知`
  String get notification {
    return Intl.message(
      '通知',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `优质专享`
  String get high_quality {
    return Intl.message(
      '优质专享',
      name: 'high_quality',
      desc: '',
      args: [],
    );
  }

  /// `费率优惠`
  String get free_concession {
    return Intl.message(
      '费率优惠',
      name: 'free_concession',
      desc: '',
      args: [],
    );
  }

  /// `快速到账`
  String get quick_deposit {
    return Intl.message(
      '快速到账',
      name: 'quick_deposit',
      desc: '',
      args: [],
    );
  }

  /// `优质专享`
  String get exclusive {
    return Intl.message(
      '优质专享',
      name: 'exclusive',
      desc: '',
      args: [],
    );
  }

  /// `身份证照片`
  String get idcard {
    return Intl.message(
      '身份证照片',
      name: 'idcard',
      desc: '',
      args: [],
    );
  }

  /// `身份证正面照片`
  String get idcard_front {
    return Intl.message(
      '身份证正面照片',
      name: 'idcard_front',
      desc: '',
      args: [],
    );
  }

  /// `身份证反面照片`
  String get idcard_reverse {
    return Intl.message(
      '身份证反面照片',
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
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
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
