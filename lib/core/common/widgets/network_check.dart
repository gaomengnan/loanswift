import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/theme.dart';

class NetworkCheckerWidget extends StatefulWidget {
  final Widget child;

  const NetworkCheckerWidget({super.key, required this.child});

  @override
  State<NetworkCheckerWidget> createState() => _NetworkCheckerWidgetState();
}

class _NetworkCheckerWidgetState extends State<NetworkCheckerWidget> {
  bool _isConnected = true;
  late InternetConnectionChecker _connectionChecker;

  late final StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _connectionChecker = sl();
    _streamSubscription = _connectionChecker.onStatusChange.listen((status) {
      final bool connected = status == InternetConnectionStatus.connected;
      if (connected != _isConnected) {
        setState(() {
          _isConnected = connected;
        });
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (!_isConnected)
          SafeArea(
            child: Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: kToolbarHeight,
                color: Pallete.networkCheckColor,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: 10.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.grey,
                      ),
                    ),

                    //Icon(Icons.info_rounded, color: Pallete.redDeepColor,),
                    UI.kWidth5(),
                    //const SizedBox(width: 8),
                    Text(
                      S.current.network_error,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
