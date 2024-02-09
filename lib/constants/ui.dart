import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/theme/theme.dart';

import '../presentation/widgets/login_sheet.dart';
import '../presentation/widgets/verification_code.dart';

class UI{
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
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.r),
              topRight: Radius.circular(5.r),
            ),
            gradient: Pallete.bottomSheetGradient,
          ),
          width: double.infinity,
          height: double.infinity,
          child: const LoginWidget(),
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
}
