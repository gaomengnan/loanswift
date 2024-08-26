import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  // 弹出对话框
  static Future<bool?> showLogoutConfirmDialog(
      context, String title, String desc, void Function()? callback) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(desc),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: const Text("确定"),
              onPressed: () {
                callback!();
              },
            ),
          ],
        );
      },
    );
  }

  static void showError(BuildContext context, String message) {
    EasyLoading.showError(
      message,
      duration: const Duration(seconds: 3),
    );
  }

  static Future<void> showLoading() async {
    await EasyLoading.show(
      status: "加载中...",
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
              create: (_) => sl<AuthBloc>(),
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
              child: const VerificationCodePage(),
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

  static Widget kHeight5() {
    return Space(
      height: 5.h,
      width: 0,
    );
  }

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

  static Widget kWidth5() {
    return Space(
      height: 0,
      width: 5.w,
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

  static Widget squareContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(8.0.sp), // 圆角半径
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0.sp), // 设置圆角
        child: child,
      ),
    );
  }
}
