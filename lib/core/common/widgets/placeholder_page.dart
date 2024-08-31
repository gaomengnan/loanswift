import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:lottie/lottie.dart';


class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: SafeArea(
          child: Lottie.asset(
            Assets.placeholder,
            height: 150.h,
            width: 150.w,
          ),
        ),
      ),
    ));
  }
}
