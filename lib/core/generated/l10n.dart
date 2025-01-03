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

  /// `pintek`
  String get app_name {
    return Intl.message(
      'pintek',
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

  /// `1千元借12个月,日费用6分起,年化利率(单利) #rate#`
  String get maximun_load_sub_text {
    return Intl.message(
      '1千元借12个月,日费用6分起,年化利率(单利) #rate#',
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

  /// `最低年化`
  String get title300 {
    return Intl.message(
      '最低年化',
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

  /// `随用随取`
  String get grab_go {
    return Intl.message(
      '随用随取',
      name: 'grab_go',
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

  /// `个人信息`
  String get personal_info {
    return Intl.message(
      '个人信息',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `登录/注册`
  String get login_or_register {
    return Intl.message(
      '登录/注册',
      name: 'login_or_register',
      desc: '',
      args: [],
    );
  }

  /// `实名认证`
  String get real_authentication {
    return Intl.message(
      '实名认证',
      name: 'real_authentication',
      desc: '',
      args: [],
    );
  }

  /// `拍摄`
  String get take_photo {
    return Intl.message(
      '拍摄',
      name: 'take_photo',
      desc: '',
      args: [],
    );
  }

  /// `从相册选择`
  String get take_photo_from_gallery {
    return Intl.message(
      '从相册选择',
      name: 'take_photo_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `相机权限获取失败`
  String get photo_permission_missing {
    return Intl.message(
      '相机权限获取失败',
      name: 'photo_permission_missing',
      desc: '',
      args: [],
    );
  }

  /// `点击授权`
  String get click_to_access {
    return Intl.message(
      '点击授权',
      name: 'click_to_access',
      desc: '',
      args: [],
    );
  }

  /// `网络连接异常`
  String get network_error {
    return Intl.message(
      '网络连接异常',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `服务异常`
  String get service_error {
    return Intl.message(
      '服务异常',
      name: 'service_error',
      desc: '',
      args: [],
    );
  }

  /// `欢迎你`
  String get welcome_you {
    return Intl.message(
      '欢迎你',
      name: 'welcome_you',
      desc: '',
      args: [],
    );
  }

  /// `请尽快付款`
  String get soon_pay {
    return Intl.message(
      '请尽快付款',
      name: 'soon_pay',
      desc: '',
      args: [],
    );
  }

  /// `到期日`
  String get due_date {
    return Intl.message(
      '到期日',
      name: 'due_date',
      desc: '',
      args: [],
    );
  }

  /// `账单金额`
  String get bill_amount {
    return Intl.message(
      '账单金额',
      name: 'bill_amount',
      desc: '',
      args: [],
    );
  }

  /// `贷款记录`
  String get load_amount {
    return Intl.message(
      '贷款记录',
      name: 'load_amount',
      desc: '',
      args: [],
    );
  }

  /// `推荐`
  String get recommend {
    return Intl.message(
      '推荐',
      name: 'recommend',
      desc: '',
      args: [],
    );
  }

  /// `账户总览`
  String get my_repayment {
    return Intl.message(
      '账户总览',
      name: 'my_repayment',
      desc: '',
      args: [],
    );
  }

  /// `暂未获取额度，无账单`
  String get no_credit_limit {
    return Intl.message(
      '暂未获取额度，无账单',
      name: 'no_credit_limit',
      desc: '',
      args: [],
    );
  }

  /// `借还记录`
  String get loan_return {
    return Intl.message(
      '借还记录',
      name: 'loan_return',
      desc: '',
      args: [],
    );
  }

  /// `自动还款`
  String get auto_repayment {
    return Intl.message(
      '自动还款',
      name: 'auto_repayment',
      desc: '',
      args: [],
    );
  }

  /// `账单证明`
  String get bill_state {
    return Intl.message(
      '账单证明',
      name: 'bill_state',
      desc: '',
      args: [],
    );
  }

  /// `获取额度`
  String get get_credit_limit {
    return Intl.message(
      '获取额度',
      name: 'get_credit_limit',
      desc: '',
      args: [],
    );
  }

  /// `请等待`
  String get loading {
    return Intl.message(
      '请等待',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `注销`
  String get logout {
    return Intl.message(
      '注销',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `你确定要退出登录吗？`
  String get logoutConfirmation {
    return Intl.message(
      '你确定要退出登录吗？',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `确定`
  String get confirm {
    return Intl.message(
      '确定',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get cancel {
    return Intl.message(
      '取消',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `所有`
  String get all {
    return Intl.message(
      '所有',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `审核中`
  String get underReview {
    return Intl.message(
      '审核中',
      name: 'underReview',
      desc: '',
      args: [],
    );
  }

  /// `待还款`
  String get awaitingRepayment {
    return Intl.message(
      '待还款',
      name: 'awaitingRepayment',
      desc: '',
      args: [],
    );
  }

  /// `审核失败`
  String get auditFailure {
    return Intl.message(
      '审核失败',
      name: 'auditFailure',
      desc: '',
      args: [],
    );
  }

  /// `已逾期`
  String get overdue {
    return Intl.message(
      '已逾期',
      name: 'overdue',
      desc: '',
      args: [],
    );
  }

  /// `已完成`
  String get completed {
    return Intl.message(
      '已完成',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `订单详情`
  String get orderDetails {
    return Intl.message(
      '订单详情',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `身份认证`
  String get identity_authentication {
    return Intl.message(
      '身份认证',
      name: 'identity_authentication',
      desc: '',
      args: [],
    );
  }

  /// `紧急联系人`
  String get emergency_contact {
    return Intl.message(
      '紧急联系人',
      name: 'emergency_contact',
      desc: '',
      args: [],
    );
  }

  /// `工作信息`
  String get work_information {
    return Intl.message(
      '工作信息',
      name: 'work_information',
      desc: '',
      args: [],
    );
  }

  /// `个人信息`
  String get personal_information {
    return Intl.message(
      '个人信息',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `请选择一个选项`
  String get please_select {
    return Intl.message(
      '请选择一个选项',
      name: 'please_select',
      desc: '',
      args: [],
    );
  }

  /// `上一步`
  String get previousStep {
    return Intl.message(
      '上一步',
      name: 'previousStep',
      desc: '',
      args: [],
    );
  }

  /// `下一步`
  String get nextStep {
    return Intl.message(
      '下一步',
      name: 'nextStep',
      desc: '',
      args: [],
    );
  }

  /// `立即还款`
  String get immediate_repayment {
    return Intl.message(
      '立即还款',
      name: 'immediate_repayment',
      desc: '',
      args: [],
    );
  }

  /// `手机号码`
  String get phone_number {
    return Intl.message(
      '手机号码',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `姓名`
  String get user_name {
    return Intl.message(
      '姓名',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `身份证`
  String get id_card {
    return Intl.message(
      '身份证',
      name: 'id_card',
      desc: '',
      args: [],
    );
  }

  /// `银行卡号`
  String get bank_card {
    return Intl.message(
      '银行卡号',
      name: 'bank_card',
      desc: '',
      args: [],
    );
  }

  /// `请选择银行`
  String get please_select_bank {
    return Intl.message(
      '请选择银行',
      name: 'please_select_bank',
      desc: '',
      args: [],
    );
  }

  /// `提交`
  String get submit {
    return Intl.message(
      '提交',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `必填项`
  String get required_field {
    return Intl.message(
      '必填项',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `绑定银行卡`
  String get bind_bank_card {
    return Intl.message(
      '绑定银行卡',
      name: 'bind_bank_card',
      desc: '',
      args: [],
    );
  }

  /// `恭喜您已经认证成功`
  String get congratulations_verified {
    return Intl.message(
      '恭喜您已经认证成功',
      name: 'congratulations_verified',
      desc: '',
      args: [],
    );
  }

  /// `去绑定银行卡`
  String get go_bind_bank_card {
    return Intl.message(
      '去绑定银行卡',
      name: 'go_bind_bank_card',
      desc: '',
      args: [],
    );
  }

  /// `已认证`
  String get verified {
    return Intl.message(
      '已认证',
      name: 'verified',
      desc: '',
      args: [],
    );
  }

  /// `前往认证`
  String get go_to_verify {
    return Intl.message(
      '前往认证',
      name: 'go_to_verify',
      desc: '',
      args: [],
    );
  }

  /// `查看合同`
  String get view_contract {
    return Intl.message(
      '查看合同',
      name: 'view_contract',
      desc: '',
      args: [],
    );
  }

  /// `分期还款`
  String get installment_repayment {
    return Intl.message(
      '分期还款',
      name: 'installment_repayment',
      desc: '',
      args: [],
    );
  }

  /// `正常还款`
  String get normal_repayment {
    return Intl.message(
      '正常还款',
      name: 'normal_repayment',
      desc: '',
      args: [],
    );
  }

  /// `意见反馈`
  String get feedback {
    return Intl.message(
      '意见反馈',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `授信成功`
  String get credit_success {
    return Intl.message(
      '授信成功',
      name: 'credit_success',
      desc: '',
      args: [],
    );
  }

  /// `授信失败`
  String get credit_failure {
    return Intl.message(
      '授信失败',
      name: 'credit_failure',
      desc: '',
      args: [],
    );
  }

  /// `获取授信结果中`
  String get credit_fetching_result {
    return Intl.message(
      '获取授信结果中',
      name: 'credit_fetching_result',
      desc: '',
      args: [],
    );
  }

  /// `登录失效`
  String get credit_login_expired {
    return Intl.message(
      '登录失效',
      name: 'credit_login_expired',
      desc: '',
      args: [],
    );
  }

  /// `订单管理`
  String get my_account_order_management {
    return Intl.message(
      '订单管理',
      name: 'my_account_order_management',
      desc: '',
      args: [],
    );
  }

  /// `我的银行卡`
  String get my_account_my_bank_card {
    return Intl.message(
      '我的银行卡',
      name: 'my_account_my_bank_card',
      desc: '',
      args: [],
    );
  }

  /// `关于我们`
  String get my_account_about_us {
    return Intl.message(
      '关于我们',
      name: 'my_account_about_us',
      desc: '',
      args: [],
    );
  }

  /// `隐私协议`
  String get my_account_privacy_policy {
    return Intl.message(
      '隐私协议',
      name: 'my_account_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `订单确认`
  String get order_confirm_title {
    return Intl.message(
      '订单确认',
      name: 'order_confirm_title',
      desc: '',
      args: [],
    );
  }

  /// `服务费`
  String get order_confirm_service_fee {
    return Intl.message(
      '服务费',
      name: 'order_confirm_service_fee',
      desc: '',
      args: [],
    );
  }

  /// `利息费用`
  String get order_confirm_interest_fee {
    return Intl.message(
      '利息费用',
      name: 'order_confirm_interest_fee',
      desc: '',
      args: [],
    );
  }

  /// `第一期费用`
  String get order_confirm_first_period_fee {
    return Intl.message(
      '第一期费用',
      name: 'order_confirm_first_period_fee',
      desc: '',
      args: [],
    );
  }

  /// `还款金额`
  String get order_confirm_repay_amount {
    return Intl.message(
      '还款金额',
      name: 'order_confirm_repay_amount',
      desc: '',
      args: [],
    );
  }

  /// `总利息`
  String get order_confirm_total_interest {
    return Intl.message(
      '总利息',
      name: 'order_confirm_total_interest',
      desc: '',
      args: [],
    );
  }

  /// `总服务费`
  String get order_confirm_total_service_fee {
    return Intl.message(
      '总服务费',
      name: 'order_confirm_total_service_fee',
      desc: '',
      args: [],
    );
  }

  /// `扣除费用`
  String get order_confirm_deduction_fee {
    return Intl.message(
      '扣除费用',
      name: 'order_confirm_deduction_fee',
      desc: '',
      args: [],
    );
  }

  /// `第一期利息费`
  String get order_confirm_first_period_interest_fee {
    return Intl.message(
      '第一期利息费',
      name: 'order_confirm_first_period_interest_fee',
      desc: '',
      args: [],
    );
  }

  /// `平台管理费`
  String get order_confirm_platform_management_fee {
    return Intl.message(
      '平台管理费',
      name: 'order_confirm_platform_management_fee',
      desc: '',
      args: [],
    );
  }

  /// `风险服务费`
  String get order_confirm_risk_service_fee {
    return Intl.message(
      '风险服务费',
      name: 'order_confirm_risk_service_fee',
      desc: '',
      args: [],
    );
  }

  /// `实际金额`
  String get order_confirm_actual_amount {
    return Intl.message(
      '实际金额',
      name: 'order_confirm_actual_amount',
      desc: '',
      args: [],
    );
  }

  /// `第一期还款时间`
  String get order_confirm_first_period_pay_time {
    return Intl.message(
      '第一期还款时间',
      name: 'order_confirm_first_period_pay_time',
      desc: '',
      args: [],
    );
  }

  /// `手续费`
  String get order_confirm_processing_fee {
    return Intl.message(
      '手续费',
      name: 'order_confirm_processing_fee',
      desc: '',
      args: [],
    );
  }

  /// `GST 费用`
  String get order_confirm_gst_fee {
    return Intl.message(
      'GST 费用',
      name: 'order_confirm_gst_fee',
      desc: '',
      args: [],
    );
  }

  /// `还款总金额`
  String get order_confirm_repayment_amount {
    return Intl.message(
      '还款总金额',
      name: 'order_confirm_repayment_amount',
      desc: '',
      args: [],
    );
  }

  /// `查看更多`
  String get order_confirm_see_more {
    return Intl.message(
      '查看更多',
      name: 'order_confirm_see_more',
      desc: '',
      args: [],
    );
  }

  /// `收起`
  String get order_confirm_collapse {
    return Intl.message(
      '收起',
      name: 'order_confirm_collapse',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get order_confirm_cancel {
    return Intl.message(
      '取消',
      name: 'order_confirm_cancel',
      desc: '',
      args: [],
    );
  }

  /// `确认`
  String get order_confirm_confirm {
    return Intl.message(
      '确认',
      name: 'order_confirm_confirm',
      desc: '',
      args: [],
    );
  }

  /// `还款计划`
  String get order_confirm_repayment_plan {
    return Intl.message(
      '还款计划',
      name: 'order_confirm_repayment_plan',
      desc: '',
      args: [],
    );
  }

  /// `下单成功`
  String get order_success {
    return Intl.message(
      '下单成功',
      name: 'order_success',
      desc: '',
      args: [],
    );
  }

  /// `认证失败，请重新尝试。`
  String get authFailed {
    return Intl.message(
      '认证失败，请重新尝试。',
      name: 'authFailed',
      desc: '',
      args: [],
    );
  }

  /// `请问您`
  String get please_ask {
    return Intl.message(
      '请问您',
      name: 'please_ask',
      desc: '',
      args: [],
    );
  }

  /// `是否要放弃以下福利?`
  String get whether_abandon_benefits {
    return Intl.message(
      '是否要放弃以下福利?',
      name: 'whether_abandon_benefits',
      desc: '',
      args: [],
    );
  }

  /// `大家都说:`
  String get everyone_says {
    return Intl.message(
      '大家都说:',
      name: 'everyone_says',
      desc: '',
      args: [],
    );
  }

  /// `操作简单`
  String get easy_to_use {
    return Intl.message(
      '操作简单',
      name: 'easy_to_use',
      desc: '',
      args: [],
    );
  }

  /// `审批快`
  String get fast_approval {
    return Intl.message(
      '审批快',
      name: 'fast_approval',
      desc: '',
      args: [],
    );
  }

  /// `还款灵活`
  String get flexible_repayment {
    return Intl.message(
      '还款灵活',
      name: 'flexible_repayment',
      desc: '',
      args: [],
    );
  }

  /// `按日计息`
  String get daily_interest {
    return Intl.message(
      '按日计息',
      name: 'daily_interest',
      desc: '',
      args: [],
    );
  }

  /// `放款快`
  String get fast_disbursement {
    return Intl.message(
      '放款快',
      name: 'fast_disbursement',
      desc: '',
      args: [],
    );
  }

  /// `合规平台`
  String get compliant_platform {
    return Intl.message(
      '合规平台',
      name: 'compliant_platform',
      desc: '',
      args: [],
    );
  }

  /// `隐私安全`
  String get privacy_security {
    return Intl.message(
      '隐私安全',
      name: 'privacy_security',
      desc: '',
      args: [],
    );
  }

  /// `继续申请`
  String get continue_to_apply {
    return Intl.message(
      '继续申请',
      name: 'continue_to_apply',
      desc: '',
      args: [],
    );
  }

  /// `残忍拒绝`
  String get cruelly_reject {
    return Intl.message(
      '残忍拒绝',
      name: 'cruelly_reject',
      desc: '',
      args: [],
    );
  }

  /// `账号设置`
  String get account_settings {
    return Intl.message(
      '账号设置',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `清理缓存`
  String get clear_cache {
    return Intl.message(
      '清理缓存',
      name: 'clear_cache',
      desc: '',
      args: [],
    );
  }

  /// `关于`
  String get about {
    return Intl.message(
      '关于',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `版本`
  String get version {
    return Intl.message(
      '版本',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `发现新版本`
  String get discover_new_version {
    return Intl.message(
      '发现新版本',
      name: 'discover_new_version',
      desc: '',
      args: [],
    );
  }

  /// `发生错误了`
  String get error_occurred {
    return Intl.message(
      '发生错误了',
      name: 'error_occurred',
      desc: '',
      args: [],
    );
  }

  /// `您好`
  String get ninhao {
    return Intl.message(
      '您好',
      name: 'ninhao',
      desc: '',
      args: [],
    );
  }

  /// `请将上方列表中带有红色标记的权限在系统设置打开之后再重试`
  String get permission_error {
    return Intl.message(
      '请将上方列表中带有红色标记的权限在系统设置打开之后再重试',
      name: 'permission_error',
      desc: '',
      args: [],
    );
  }

  /// `检查更新`
  String get check_for_updates {
    return Intl.message(
      '检查更新',
      name: 'check_for_updates',
      desc: '',
      args: [],
    );
  }

  /// `已清除缓存`
  String get cacheCleared {
    return Intl.message(
      '已清除缓存',
      name: 'cacheCleared',
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
