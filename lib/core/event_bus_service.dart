import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:loanswift/core/container.dart';
import 'package:loanswift/core/report.dart';

class EventBus extends WidgetsBindingObserver {
  static final EventBus _instance = EventBus._internal();

  factory EventBus() => _instance;

  EventBus._internal();

  late StreamSubscription<TargetPointEvent> _targetPointSubscription;

  final StreamController _controller = StreamController.broadcast();

  void onEvent() {
    _targetPointSubscription = on<TargetPointEvent>().listen((e) {
      final ReportService reportService = sl();
      reportService.targetReport(
        e.startTime,
        e.endTime,
        e.sceneType,
        productCode: e.productCode ?? "unknown",
      );
    });
  }

  // 用于触发事件
  void fire(event) {
    _controller.add(event);
  }

  // 用于监听事件
  Stream<T> on<T>() {
    return _controller.stream.where((event) => event is T).cast<T>();
  }

  // 清理资源
  void dispose() {
    _controller.close();
  }

  // 监听应用生命周期事件
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      _controller.close();
      _targetPointSubscription.cancel();
    }
  }
}

class TargetPointEvent {
  final DateTime startTime;
  final DateTime endTime;
  final SceneType sceneType;
  String? productCode;

  TargetPointEvent(this.startTime, this.endTime, this.sceneType,
      {this.productCode});
}


class LoginExpireEvent {}
