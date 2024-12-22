import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/utils.dart';
import 'package:loanswift/features/domain/entity/common/configure.dart';
import 'package:loanswift/features/presentation/views/widgets/login_widget.dart';
import 'package:loanswift/features/presentation/views/widgets/verification_code.dart';
import 'package:loanswift/theme/theme.dart';

import '../../features/presentation/bloc/auth/auth_bloc.dart';
import '../common/widgets/widgets.dart';
import '../core.dart';

class Ui {
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r), // 设置圆角率
          ),
          title: Text(title),
          content: Text(desc),
          actions: <Widget>[
            TextButton(
              child: Text(S.current.cancel),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text(S.current.confirm),
              onPressed: () {
                callback!();
              },
            ),
          ],
        );
      },
    );
  }

  static void showSuccess(BuildContext context, String message) {
    EasyLoading.showSuccess(
      message,
      duration: const Duration(seconds: 2),
    );
  }

  static void showLoadingWithMessage(BuildContext context, String message) {
    EasyLoading.show(
      status: message,
    );
  }

  static void showProgress(BuildContext context, String message) {
    EasyLoading.showProgress(
      0,
      status: message,
    );
  }

  static void showError(BuildContext context, String message) {
    Utils.showSnakebar(context, message);
    //EasyLoading.showError(
    //  message,
    //  duration: const Duration(seconds: 2),
    //);
  }

  static void showErrorNoContext(String message) {
    EasyLoading.showError(
      message,
      duration: const Duration(seconds: 2),
    );
  }

  static Future<void> showLoading() async {
    await EasyLoading.show(
      dismissOnTap: false,
      status: "${S.current.loading}...",
      maskType: EasyLoadingMaskType.black,
    );
  }

  static Future<void> hideLoading() async {
    await EasyLoading.dismiss();
  }

  static void showSignInAndUpBottomSheet(context) async {
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

  static Widget kWidth50() {
    return Space(
      height: 0,
      width: 50.w,
    );
  }

  static Widget squareContainer(Widget child) {
    return Container(
      //height: 50,
      //width: 50,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(8.0.sp), // 圆角半径
      ),
      child: ClipOval(
        //borderRadius: BorderRadius.circular(8.0.sp), // 设置圆角
        child: child,
      ),
    );
  }

  static ButtonStyle orderButtonStyle() {
    return OutlinedButton.styleFrom().copyWith(
      minimumSize: WidgetStateProperty.all<Size>(
        Size(
          10.w,
          30.h,
        ),
      ),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(
          width: 1,
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(
          //vertical: 10,
          horizontal: 9.w,
        ),
      ),
    );
  }

  static Future<bool?> showAdvertiseWindow(
    GlobalKey gkey,
    context,
    AdvertiseEntity advertise,
    void Function()? callback,
  ) {
    if (Navigator.canPop(context)) {
      return Future.value(false);
    }
    return showDialog<bool>(
      //barrierColor: Colors.grey.withOpacity(0.5),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(
            1.r,
          ),
          backgroundColor: Colors.transparent,
          key: gkey,
          //shape: RoundedRectangleBorder(
          //  borderRadius: BorderRadius.circular(10.r), // 设置圆角
          //),
          //title: const Text("title"),
          content: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.maxFinite,
                //height: 300.h,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: 300.h,
                    enlargeCenterPage: true, // 居中显示并放大当前页面
                    autoPlay: false, // 自动播放
                    aspectRatio: 16 / 9, // 宽高比
                    viewportFraction: 1, // 每次显示部分页面
                  ),
                  items: [
                    ...advertise.list.map((e) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10), // 设置圆角半径
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: e.imageUrl,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: FloatingActionButton(
                  onPressed: () {
                    //context.read<AdvertiseCubit>().setKnown();
                    callback!();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.white,
                  mini: true,
                  //elevation: 5.0,
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
