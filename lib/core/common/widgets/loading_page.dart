import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:lottie/lottie.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade300,
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
            //reverse: true,
            Assets.loading,
            height: 300.h,
            width: 300.w,
          ),
        ),
      ),
    ));
  }
}
