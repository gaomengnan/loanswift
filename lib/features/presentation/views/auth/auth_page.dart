import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
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
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        padding: const EdgeInsets.only(top: kToolbarHeight * 3),
        decoration: const BoxDecoration(
          //color: Colors.grey.shade200,
          //borderRadius: BorderRadius.circular(10.sp),
          //gradient: LinearGradient(
          // begin: Alignment.topRight,
          // end: Alignment.bottomLeft,
          // stops: [0.1, 0.4],
          // colors: [
          //   Color(0xff2cdeee),
          //   Pallete.backgroundColor
          // ],
          //),
        ),
        child: const SingleChildScrollView(
          child: LoginWidget(
            sourceName: "login",
          ),
        ),
      ),
    );
  }
}
