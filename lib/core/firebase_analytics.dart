import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  // 私有构造函数
  FirebaseAnalyticsService._privateConstructor();

  // 单例对象
  static final FirebaseAnalyticsService _instance = FirebaseAnalyticsService._privateConstructor();

  // 静态方法用于访问单例实例
  static FirebaseAnalyticsService get instance => _instance;

  // FirebaseAnalytics 实例
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // FirebaseAnalyticsObserver 实例
  final FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics.instance,
  );

  // 记录自定义事件
  Future<void> logCustomEvent(String name, Map<String, dynamic> parameters) async {
    await analytics.logEvent(name: name, parameters: parameters);
  }

  // 设置当前屏幕
  Future<void> setCurrentScreen(String screenName) async {
    await analytics.logScreenView(screenName: screenName);
  }

  // 设置用户属性
  Future<void> setUserProperty(String name, String value) async {
    await analytics.setUserProperty(name: name, value: value);
  }
}
