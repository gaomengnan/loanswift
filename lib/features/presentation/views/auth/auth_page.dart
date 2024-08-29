import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/theme/theme.dart';

import '../widgets/login_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  static const routerName = "/auth";

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        padding: const EdgeInsets.only(top: kToolbarHeight * 3),
        child: const SingleChildScrollView(
          child: LoginWidget(
            sourceName: "login",
          ),
        ),
      ),
    );
  }
}
