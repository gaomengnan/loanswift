import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/features/presentation/views/widgets/login_widget.dart';
import 'package:loanswift/features/presentation/views/widgets/verification_code.dart';
import 'package:loanswift/theme/theme.dart';

import '../../features/presentation/bloc/auth/auth_bloc.dart';
import '../common/widgets/widgets.dart';
import '../core.dart';

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
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: BlocProvider(
              create: (_) => sl<AuthBloc>()
                ..add(
                  LoadAuthTokenEvent(),
                ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    topRight: Radius.circular(5.r),
                  ),
                  gradient: Pallete.bottomSheetGradient,
                ),
                // height: 500.h,
                // width: double.infinity,
                // height: double.infinity,
                child: const LoginWidget(),
              ),
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
      useSafeArea: true,
      isScrollControlled: true,
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
