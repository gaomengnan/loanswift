import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:lottie/lottie.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(Assets.onboardingBackground),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Center(
        child: SafeArea(
          child: Lottie.asset(
            Assets.loading,
            height: 90.h,
            width: 90.w,
          ),
        ),
      ),
    ));
  }
}
