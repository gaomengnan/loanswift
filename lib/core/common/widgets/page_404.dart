import 'package:flutter/material.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/theme.dart';
import 'package:lottie/lottie.dart';


class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        ),
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
            Assets.underConstruction,
          ),
        ),
      ),
    ));
  }
}
