import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/theme/theme.dart';

import '../../features/presentation/widgets/login_widget.dart';
import '../../features/presentation/widgets/verification_code.dart';
import '../common/widgets/widgets.dart';

class UI {
  static AppBar appBar() {
    return AppBar(
      centerTitle: true,
    );
  }

  Text appText(String text) {
    return Text(
      text,
    );
  }

  static void showSignInAndUpBootomSheet(context) async {
    await showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  topRight: Radius.circular(5.r),
                ),
                gradient: Pallete.bottomSheetGradient,
              ),
              height: MediaQuery.of(context).size.height / 2,
              // width: double.infinity,
              // height: double.infinity,
              child: const LoginWidget(),
            ),
          ),
        );
      },
    );
  }

  static void showVerifyCodeSheet(
    BuildContext context,
  ) async {
    await showModalBottomSheet(
      // isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  topRight: Radius.circular(5.r),
                ),
                gradient: Pallete.bottomSheetGradient,
              ),
              // height: 100,
              child: const VerificationCode(),
            ),
          ),
        );
      },
    );
  }

  static const List<Widget> bottomTabBarPages = [
    // TweetList(),
    // ExploreView(),
    // NotificationView(),
  ];

  static Widget kHeight10() {
    return Space(
      height: 10.h,
      width: 0,
    );
  }

  static Widget kWidth10() {
    return Space(
      height: 0,
      width: 10.w,
    );
  }

  static Widget kHeight20() {
    return Space(
      height: 20.h,
      width: 0,
    );
  }

  static Widget kWidth20() {
    return Space(
      height: 0,
      width: 20.w,
    );
  }
}
